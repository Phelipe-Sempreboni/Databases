-- Maneira 1 - Comando para saber o tamanho de todos bancos de dados do sistema.
-- Nota: Notar que neste método, a coluna (Tamanho) é a soma dos arquivos de dados e de log somados, logo, resultam neste tamanho (size).

SELECT A.name AS Nome, SUM(size) * 8 AS Tamanho
FROM sys.databases AS A
INNER JOIN sys.master_files
ON A.database_id = sys.master_files.database_id
GROUP BY A.name
GO

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x
-- Maneira 2 - Comando para saber o tamanho de um banco de dados especifico do sistema.
-- Nota: Notar que neste caso é possível saber somente o tamanho do arquivo de dados e não é possível verificar o do arquivo de logs.
-- Nota1: Notar que temos o tamanho normal e o tamanho convertido, que é multiplicado para os 8kbs.

SELECT name AS Nome, size AS Tamanho_normal, size * 8 AS Tamanho_convertido, size*1.0/128 AS Tamanho_em_MBs
FROM sys.master_files
WHERE name = N'SUCOS_VENDAS'; -- Insira aqui o nome do banco de dados que gostaria de saber o tamanho.
GO

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x
-- Maneira 3 - Comando para saber o tamanho de um banco de dados especifico do sistema.
-- Nota: Neste método, temos o tamanho em MB do arquivo de dados e do de logs, logo, temos os dois arquivos para sabermos o tamanho em MB.

WITH tamanho_em_mb AS
(
    SELECT database_id, type, size * 8.0 / 1024 size
    FROM sys.master_files
)
SELECT
    name AS NomeDoBanco,
    (SELECT sum(size) FROM tamanho_em_mb WHERE type = 0 AND tamanho_em_mb.database_id = databas.database_id) DataFileTamanho_MB,
    (SELECT sum(size) FROM tamanho_em_mb WHERE type = 1 AND tamanho_em_mb.database_id = databas.database_id) LogFileTamanho_MB
FROM sys.databases AS databas
GO
-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 4 - Comando por stored procedure com algumas informações sobre tamanho do banco de dados.

Use SUCOS_VENDAS;
Exec SP_SpaceUsed;
GO
-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 5 - Comando para saber o tamanho de um banco de dados especifico do sistema.
-- Nota: Neste caso, por tratar-se de um comando mais complexo, temos diversas informações sobre os databases, onde será necessário verificar quais dos métodos atende melhor ao usuário.

SELECT
    B.database_id AS database_id,
    B.[name] AS [database_name],
    A.state_desc,
    A.[type_desc],
    A.[file_id],
    A.[name],
    A.physical_name,
    CAST(C.total_bytes / 1073741824.0 AS NUMERIC(18, 2)) AS disk_total_size_GB,
    CAST(C.available_bytes / 1073741824.0 AS NUMERIC(18, 2)) AS disk_free_size_GB,
    CAST(A.size / 128 / 1024.0 AS NUMERIC(18, 2)) AS size_GB,
    CAST(A.max_size / 128 / 1024.0 AS NUMERIC(18, 2)) AS max_size_GB,
    CAST(
        (CASE
        WHEN A.growth <= 0 THEN A.size / 128 / 1024.0
            WHEN A.max_size <= 0 THEN C.total_bytes / 1073741824.0
            WHEN A.max_size / 128 / 1024.0 > C.total_bytes / 1073741824.0 THEN C.total_bytes / 1073741824.0
            ELSE A.max_size / 128 / 1024.0 
        END) AS NUMERIC(18, 2)) AS max_real_size_GB,
    CAST(NULL AS NUMERIC(18, 2)) AS free_space_GB,
    (CASE WHEN A.is_percent_growth = 1 THEN A.growth ELSE CAST(A.growth / 128 AS NUMERIC(18, 2)) END) AS growth_MB,
    A.is_percent_growth,
    (CASE WHEN A.growth <= 0 THEN 0 ELSE 1 END) AS is_autogrowth_enabled,
    CAST(NULL AS NUMERIC(18, 2)) AS percent_used,
    CAST(NULL AS INT) AS growth_times
INTO
    #Datafile_Size 
FROM
    sys.master_files        A   WITH(NOLOCK)
    JOIN sys.databases      B   WITH(NOLOCK)    ON  A.database_id = B.database_id
    CROSS APPLY sys.dm_os_volume_stats(A.database_id, A.[file_id]) C

    UPDATE A
SET
    A.free_space_GB = (
    (CASE 
        WHEN max_size_GB <= 0 THEN A.disk_free_size_GB
        WHEN max_real_size_GB > disk_free_size_GB THEN A.disk_free_size_GB 
        ELSE max_real_size_GB - size_GB
    END)),
    A.percent_used = (size_GB / (CASE WHEN max_real_size_GB > disk_total_size_GB THEN A.disk_total_size_GB ELSE max_real_size_GB END)) * 100
FROM 
    #Datafile_Size A
    
UPDATE A
SET
    A.growth_times = 
    (CASE 
        WHEN A.growth_MB <= 0 THEN 0 
        WHEN A.is_percent_growth = 0 THEN (A.max_real_size_GB - A.size_GB) / (A.growth_MB / 1024.0) 
        ELSE NULL 
    END)
FROM 
    #Datafile_Size A
GO
 
SELECT * 
FROM #Datafile_Size
GO
-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 6 - Comando para saber o tamanho de um banco de dados especifico do sistema.
-- Nota: Neste caso, você terá que criar a (STORED PROCEDURE) abaixo, a partir do comando (CREATE PROC) para conseguir executar corretamente o comando pelo (EXEC ou EXECUTE).
-- Nota2: Se quiser dropar (excluir) a PROCEDURE do seu database, execute o comando que inicia com (DROP PROCEDURE).
-- Nota3: Créditos ao criador da stored procedure: Thiago R. Cruz - Guiadba.com.br

EXEC spt_database_size 'SUCOS_VENDAS'; -- Alterar para o nome desejado do banco de dados.
GO

DROP PROCEDURE spt_database_size;
GO

CREATE PROC spt_database_size @DATABASE_NAME SYSNAME = NULL, @TABLE SYSNAME = NULL
AS

IF @DATABASE_NAME IS NULL AND @TABLE IS NOT NULL
BEGIN
PRINT 'FAVOR INFORMAR O NOME DO BANCO DE DADOS'
END 
ELSE 
BEGIN
DECLARE @DATABASE_ID INT 
DECLARE @SQL_STRING VARCHAR(6000) 

IF @TABLE IS NULL 
BEGIN
DECLARE @FILE_SIZE TABLE 
    ( 
    [DATABASE_NAME] [SYSNAME] NULL, 
    [GROUPID] [SMALLINT] NULL, 
    [GROUPNAME] [VARCHAR](80) NULL, 
    [FILEID] [SMALLINT] NULL, 
    [FILE_SIZE] [DECIMAL](12, 2) NULL, 
    [SPACE_USED] [DECIMAL](12, 2) NULL, 
    [FREE_SPACE] [DECIMAL](12, 2) NULL, 
    [PERCE_FREE] [DECIMAL] (12,2) NULL,
    [NAME] [SYSNAME] NOT NULL, 
    [FILENAME] [VARCHAR](260) NOT NULL,
    [RECOVERY_MODEL] [VARCHAR] (40) NULL,
    [LAST_FULL_BACKUP]	 [DATETIME] NULL,
    [TYPE] [VARCHAR] (40) NULL,
    [NAME_BACKUP] [VARCHAR] (400) NULL
    )
END

IF @TABLE IS NOT NULL
BEGIN
DECLARE @FILE_SIZE2 TABLE 
    ( 
    [DATABASE_NAME] [SYSNAME] NULL, 
    [GROUPID] [SMALLINT] NULL, 
    [GROUPNAME] [VARCHAR](80) NULL, 
    [FILEID] [SMALLINT] NULL, 
    [FILE_SIZE] [DECIMAL](12, 2) NULL, 
    [SPACE_USED] [DECIMAL](12, 2) NULL, 
    [FREE_SPACE] [DECIMAL](12, 2) NULL, 
    [PERCE_FREE] [DECIMAL] (12,2) NULL,
    [NAME] [SYSNAME] NOT NULL, 
    [FILENAME] [VARCHAR](260) NOT NULL,
    [INDEX]     [VARCHAR] (200) NULL,
    [PAGES]		[INT] NULL,
    [TABLE_KB]	[BIGINT] NULL,
    [ROWCNT]	[BIGINT] NULL
    )
END

IF @DATABASE_NAME IS NOT NULL AND @TABLE IS NOT NULL
BEGIN

    SET @SQL_STRING = 'USE ' + QUOTENAME(@DATABASE_NAME) + CHAR(10) 
    SET @SQL_STRING = @SQL_STRING + 'SELECT DISTINCT
                                        DB_NAME() 
                                        ,ISNULL(SYSFILEGROUPS.GROUPID,0) 
                                        ,ISNULL(SYSFILEGROUPS.GROUPNAME, ''TLOG'') 
                                        ,FILEID 
                                        ,CONVERT(DECIMAL(12,2),ROUND(SYSFILES.SIZE/128.000,2)) AS FILE_SIZE 
                                        ,CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(SYSFILES.NAME,''SPACEUSED'')/128.000,2)) AS SPACE_USED 
                                        ,CONVERT(DECIMAL(12,2),ROUND((SYSFILES.SIZE-FILEPROPERTY(SYSFILES.NAME,''SPACEUSED''))/128.000,2)) AS FREE_SPACE
                                        ,(CONVERT(DECIMAL(12,2),ROUND((SYSFILES.SIZE-FILEPROPERTY(SYSFILES.NAME,''SPACEUSED''))/128.000,2))/CONVERT(DECIMAL(12,2),ROUND(SYSFILES.SIZE/128.000,2))*100) 
                                        ,SYSFILES.NAME 
                                        ,SYSFILES.FILENAME 
                                        ' + CASE WHEN @TABLE IS NOT NULL THEN
                                        ',SYS.SYSINDEXES.NAME
                                        ,SYS.SYSINDEXES.DPAGES
                                        ,(SYS.SYSINDEXES.DPAGES*8) [TABLE KB]
                                        ,SYS.SYSINDEXES.ROWCNT'
                                        ELSE '' END +'
                                    FROM SYS.SYSFILES 
                                    LEFT OUTER JOIN SYS.SYSFILEGROUPS 
                                        ON SYSFILES.GROUPID = SYSFILEGROUPS.GROUPID
                                    ' + CASE WHEN @TABLE IS NOT NULL THEN
										'INNER JOIN SYS.SYSINDEXES
										    ON SYSFILES.GROUPID = SYS.SYSINDEXES.GROUPID
										   AND OBJECT_ID(''' + @TABLE + ''') = ID
										   AND SYS.SYSINDEXES.ROOT IS NOT NULL'
										   ELSE '' END +'								
                                   WHERE DB_NAME() = ''' + @DATABASE_NAME + ''''

IF @TABLE IS NULL
BEGIN
    INSERT INTO @FILE_SIZE 
        EXEC (@SQL_STRING)
END  
ELSE 
BEGIN
    INSERT INTO @FILE_SIZE2 
        EXEC (@SQL_STRING)  
END
END



IF @DATABASE_NAME IS NULL
BEGIN
SELECT TOP 1 @DATABASE_ID = DATABASE_ID 
    ,@DATABASE_NAME = NAME 
FROM SYS.DATABASES 
WHERE DATABASE_ID > 0 
ORDER BY DATABASE_ID


WHILE @DATABASE_NAME IS NOT NULL 
BEGIN

    SET @SQL_STRING = 'USE ' + QUOTENAME(@DATABASE_NAME) + CHAR(10) 
    SET @SQL_STRING = @SQL_STRING + 'SELECT 
                                        DB_NAME() 
                                        ,ISNULL(SYSFILEGROUPS.GROUPID,0)  
                                        ,ISNULL(SYSFILEGROUPS.GROUPNAME, ''TLOG'') 
                                        ,FILEID 
                                        ,CONVERT(DECIMAL(12,2),ROUND(SYSFILES.SIZE/128.000,2)) AS FILE_SIZE 
                                        ,CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(SYSFILES.NAME,''SPACEUSED'')/128.000,2)) AS SPACE_USED 
                                        ,CONVERT(DECIMAL(12,2),ROUND((SYSFILES.SIZE-FILEPROPERTY(SYSFILES.NAME,''SPACEUSED''))/128.000,2)) AS FREE_SPACE
                                        ,(CONVERT(DECIMAL(12,2),ROUND((SYSFILES.SIZE-FILEPROPERTY(SYSFILES.NAME,''SPACEUSED''))/128.000,2))/CONVERT(DECIMAL(12,2),ROUND(SYSFILES.SIZE/128.000,2))*100) 
                                        ,SYSFILES.NAME 
                                        ,SYSFILES.FILENAME 
                                        ,BACKUPSET.RECOVERY_MODEL
                                        ,BACKUPSET.LAST_FULL_BACKUP
                                        ,CASE WHEN BACKUPSET.TYPE  = ''D'' THEN ''Database'' 
                                              WHEN  BACKUPSET.TYPE = ''I'' THEN ''Differential database'' 
                                              WHEN BACKUPSET.TYPE = ''L'' THEN ''LOG''
											  WHEN    BACKUPSET.TYPE = ''F'' THEN ''File or filegroup'' 
											  WHEN  BACKUPSET.TYPE = ''G'' THEN ''Differential file'' 
											  WHEN     BACKUPSET.TYPE = ''P'' THEN ''PARTIAL''
											  ELSE ''Differential partial'' END
									    ,BACKUPSET.LOCAL
                                    FROM SYS.SYSFILES 
                                    LEFT OUTER JOIN SYS.SYSFILEGROUPS 
                                      ON SYSFILES.GROUPID = SYSFILEGROUPS.GROUPID
									CROSS APPLY (SELECT TOP 1 NAME AS LOCAL, RECOVERY_MODEL, BACKUP_FINISH_DATE AS LAST_FULL_BACKUP, TYPE
												   FROM MSDB.DBO.BACKUPSET 
											      WHERE MSDB.DBO.BACKUPSET.DATABASE_NAME =  '''+ @DATABASE_NAME +''' 
												  ORDER BY BACKUP_FINISH_DATE DESC) AS BACKUPSET        
                                   WHERE DB_NAME() = ''' + @DATABASE_NAME + ''''


        INSERT INTO @FILE_SIZE 
        EXEC (@SQL_STRING)  


 
    SET @DATABASE_NAME = NULL 
    SELECT TOP 1 @DATABASE_ID = DATABASE_ID 
        ,@DATABASE_NAME = NAME 
    FROM SYS.DATABASES 
    WHERE DATABASE_ID > @DATABASE_ID
    ORDER BY DATABASE_ID 
END
END

IF @DATABASE_NAME IS NOT NULL
BEGIN

WHILE @DATABASE_NAME IS NOT NULL 
BEGIN

    SET @SQL_STRING = 'USE ' + QUOTENAME(@DATABASE_NAME) + CHAR(10) 
    SET @SQL_STRING = @SQL_STRING + 'SELECT 
                                        DB_NAME() 
                                        ,ISNULL(SYSFILEGROUPS.GROUPID,0)  
                                        ,ISNULL(SYSFILEGROUPS.GROUPNAME, ''TLOG'') 
                                        ,FILEID 
                                        ,CONVERT(DECIMAL(12,2),ROUND(SYSFILES.SIZE/128.000,2)) AS FILE_SIZE 
                                        ,CONVERT(DECIMAL(12,2),ROUND(FILEPROPERTY(SYSFILES.NAME,''SPACEUSED'')/128.000,2)) AS SPACE_USED 
                                        ,CONVERT(DECIMAL(12,2),ROUND((SYSFILES.SIZE-FILEPROPERTY(SYSFILES.NAME,''SPACEUSED''))/128.000,2)) AS FREE_SPACE
                                        ,(CONVERT(DECIMAL(12,2),ROUND((SYSFILES.SIZE-FILEPROPERTY(SYSFILES.NAME,''SPACEUSED''))/128.000,2))/CONVERT(DECIMAL(12,2),ROUND(SYSFILES.SIZE/128.000,2))*100) 
                                        ,SYSFILES.NAME 
                                        ,SYSFILES.FILENAME 
                                        ,BACKUPSET.RECOVERY_MODEL
                                        ,BACKUPSET.LAST_FULL_BACKUP
                                        ,CASE WHEN BACKUPSET.TYPE  = ''D'' THEN ''Database'' 
                                              WHEN  BACKUPSET.TYPE = ''I'' THEN ''Differential database'' 
                                              WHEN BACKUPSET.TYPE = ''L'' THEN ''LOG''
											  WHEN    BACKUPSET.TYPE = ''F'' THEN ''File or filegroup'' 
											  WHEN  BACKUPSET.TYPE = ''G'' THEN ''Differential file'' 
											  WHEN     BACKUPSET.TYPE = ''P'' THEN ''PARTIAL''
											  ELSE ''Differential partial'' END
									    ,BACKUPSET.LOCAL
                                    FROM SYS.SYSFILES 
                                    LEFT OUTER JOIN SYS.SYSFILEGROUPS 
                                      ON SYSFILES.GROUPID = SYSFILEGROUPS.GROUPID
									CROSS APPLY (SELECT TOP 1 NAME AS LOCAL, RECOVERY_MODEL, BACKUP_FINISH_DATE AS LAST_FULL_BACKUP, TYPE
												   FROM MSDB.DBO.BACKUPSET 
											      WHERE MSDB.DBO.BACKUPSET.DATABASE_NAME =  '''+ @DATABASE_NAME +''' 
												  ORDER BY BACKUP_FINISH_DATE DESC) AS BACKUPSET        
                                   WHERE DB_NAME() = ''' + @DATABASE_NAME + ''''


        INSERT INTO @FILE_SIZE 
        EXEC (@SQL_STRING)  

 
    SET @DATABASE_NAME = NULL 
    SELECT TOP 1 @DATABASE_ID = DATABASE_ID 
        ,@DATABASE_NAME = NAME 
    FROM SYS.DATABASES 
    WHERE DATABASE_ID > @DATABASE_ID
    ORDER BY DATABASE_ID 
END
END

IF @TABLE IS NULL
BEGIN
SELECT *
FROM @FILE_SIZE 
END
ELSE 
BEGIN 
SELECT *
FROM @FILE_SIZE2
END
END
GO