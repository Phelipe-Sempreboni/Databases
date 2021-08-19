------------------------------------------------------------------------------------------------------------------------
-- Exemplo de script que faz uma verificação na tabela, onde, caso um registro nomeado como (CANETA BIC V1), na tabela (ETL_SAP_ESTOQUE) pela coluna (DES_MATERIAL_NAME) exista ela prossegue e não faz nada e caso não haja ela executa o comando e faz o INSERT.
DECLARE
REGISTER_EXISTS NUMBER;
BEGIN
SELECT COUNT (*) INTO REGISTER_EXISTS
FROM SYSTEM.ETL_SAP_ESTOQUE WHERE DES_MATERIAL_NAME = 'CANETA BIC V1';

IF REGISTER_EXISTS = 0 THEN
EXECUTE IMMEDIATE 'INSERT INTO SYSTEM.ETL_SAP_ESTOQUE (ID_ORIGIN_SAP_ESTOQUE, DES_MATERIAL_NAME, DES_DESCRIPTION_MATERIAL, NAM_OWNER) VALUES (''5UK2M'', ''CANETA BIC V1'', ''Caneta modelo 2018'', ''Nova Verão'')';
END IF;
END;
/
------------------------------------------------------------------------------------------------------------------------
-- Exemplo de script que faz uma verificação de um servidor ou hostname ou ip, onde, caso um servidor/hostname/ip exista ela prossegue e não faz nada e caso não haja ela executa o comando e faz o INSERT.

DECLARE
REGISTER_EXISTS VARCHAR2(200);
BEGIN
SELECT UPPER(SYS_CONTEXT('USERENV','SERVER_HOST')) INTO REGISTER_EXISTS FROM DUAL ;

IF REGISTER_EXISTS = 'INSIRA O SERVIDOR/HOSTNAME/IP' THEN
EXECUTE IMMEDIATE 'INSERT INTO SYSTEM.ETL_SAP_ESTOQUE (ID_ORIGIN_SAP_ESTOQUE, DES_MATERIAL_NAME, DES_DESCRIPTION_MATERIAL, NAM_OWNER) VALUES (''5UK2M'', ''CANETA BIC V1'', ''Caneta modelo 2018'', ''Nova Verão'')';
END IF;
END;
/
------------------------------------------------------------------------------------------------------------------------

-- Neste caso abaixo, é um script que antes de criar a tabela, ele verifica se ela não existe, e caso não exista é criada, caso contrátio, será mantida a tabela existente e uma mensagem será exibida que a tabela já existe.
-- Neste script fizemos como se o schema/usuário fosse o próprio padrão do Oracle Database, o SYSTEM.

SET ECHO ON

SET SERVEROUT ON

DECLARE
    V_ERROR_RESOURCE_BUSY EXCEPTION;
    PRAGMA EXCEPTION_INIT(V_ERROR_RESOURCE_BUSY, -00054);
    V_SQL1 CONSTANT VARCHAR2(2000) := 'CREATE TABLE SYSTEM.ETL_SAP_ESTOQUE(
     ID_ETL_SAP_ESTOQUE INT GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CONSTRAINT PK_ETL_API_PEOPLES PRIMARY KEY
    ,ID_ORIGIN_SAP_ESTOQUE VARCHAR(50)
    ,DES_MATERIAL_NAME VARCHAR (100)
    ,DES_DESCRIPTION_MATERIAL VARCHAR (100)
    ,NAM_OWNER VARCHAR (100)
)';
    V_NAOEXECUTOU BOOLEAN := TRUE;
    V_EXISTE      NUMBER(10) := 0;
    V_TIME INT:=1;
    V_NOW DATE;
BEGIN
    SELECT COUNT(1)
        INTO V_EXISTE
    FROM ALL_TABLES
    WHERE OWNER = 'SYSTEM' -- Escreva o schema/usuário
    AND TABLE_NAME = 'ETL_SAP_ESTOQUE' -- Escreva o nome da tabela
    ;
   IF V_EXISTE > 0 THEN
      DBMS_OUTPUT.PUT_LINE('*** Essa tabela já existe neste ambiente: ' || SYS_CONTEXT('USERENV','INSTANCE_NAME') || ' / ' || SYS_CONTEXT('USERENV','SERVER_HOST'));
   ELSE
      WHILE V_NAOEXECUTOU
      LOOP
         BEGIN
            EXECUTE IMMEDIATE V_SQL1;
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN SYSTEM.ETL_SAP_ESTOQUE.ID_ETL_SAP_ESTOQUE IS ''Coluna de id gerada automaticamente com autoincremento.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN SYSTEM.ETL_SAP_ESTOQUE.ID_ORIGIN_SAP_ESTOQUE IS ''Coluna com id de origem do sistema..'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN SYSTEM.ETL_SAP_ESTOQUE.DES_MATERIAL_NAME IS ''Coluna com o nome do material.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN SYSTEM.ETL_SAP_ESTOQUE.DES_DESCRIPTION_MATERIAL IS ''Coluna com a descrição do material.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN SYSTEM.ETL_SAP_ESTOQUE.NAM_OWNER IS ''Coluna com o responsável pelo material.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN TABLE SYSTEM.ETL_SAP_ESTOQUE IS ''Coluna com a informação da quantidade em estoque disponível.'''; -- Adicição do comentário na tabela.
            V_NAOEXECUTOU := FALSE;
            DBMS_OUTPUT.PUT_LINE('--');
            DBMS_OUTPUT.PUT_LINE(V_SQL1);
            DBMS_OUTPUT.PUT_LINE('--');
         EXCEPTION
            WHEN V_ERROR_RESOURCE_BUSY THEN
                SELECT SYSDATE INTO V_NOW FROM DUAL;
                LOOP
                EXIT WHEN V_NOW + (V_TIME * (1/86400)) = SYSDATE;
                END LOOP;
            WHEN OTHERS THEN
               RAISE;
         END;
      END LOOP;
   END IF;
END;
/
------------------------------------------------------------------------------------------------------------------------
