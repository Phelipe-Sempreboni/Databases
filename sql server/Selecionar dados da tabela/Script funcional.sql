-- Comando para selecionar todas as colunas da tabela.
-- Comando para selecionar colunas especificas da tabela.
-- Comando para selecionar e renomear colunas especificadas da tabela.
-- Iremos criar um database.
-- Iremos criar um schema.
-- Iremos criar a tabela.
-- Temos comando para dropar (excluir) a tabela.
-- Temos comando para deletar os dados da tabela.
-- Temos comando para truncar (excluir) os dados da tabela.
-- Temos comando para verificar informações da tabela criada.
-- Temos comando para verificar se a chave primária foi criada corretamente.

--------------------------------------------------------------------------------------------------------------------------------------

-- Criação do database.

CREATE DATABASE MARKETING;
GO

-- Caso queira excluir o database criado.

USE master;
GO

DROP DATABASE MARKETING;
GO

--------------------------------------------------------------------------------------------------------------------------------------

-- Criação do schema.

USE MARKETING;
GO

CREATE SCHEMA MARKETING_ANALISE_CAMPANHA;
GO

-- Caso queira excluir o schema criado.

USE MARKETING;
GO

DROP SCHEMA MARKETING_ANALISE_CAMPANHA;
GO

--------------------------------------------------------------------------------------------------------------------------------------

-- Criação da tabela.

USE MARKETING;
GO

CREATE TABLE [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA] (
	 ID INT
	,YEAR_BIRTH FLOAT 
	,EDUCATION VARCHAR (20) 
	,MARITAL_STATUS VARCHAR (20) 
	,INCOME FLOAT 
	,KIDHOME FLOAT 
	,TEENHOME FLOAT 
	,DT_CUSTOMER DATE 
	,RECENCY FLOAT 
	,MNT_WINES FLOAT 
	,MNT_FRUITS FLOAT 
	,MNT_MEAT_PRODUCTS FLOAT 
	,MNT_FISH_PRODUCTS FLOAT 
	,MNT_SWEET_PRODUCTS FLOAT 
	,MNT_GOLD_PRODS FLOAT 
	,NUM_DEALS_PURCHASES FLOAT 
	,NUM_WEB_PURCHASES FLOAT 
	,NUM_CATALOG_PURCHASES FLOAT 
	,NUM_STORE_PURCHASES FLOAT 
	,NUM_WEB_VISITS_MONTH FLOAT 
	,ACCEPTED_CMP3 FLOAT 
	,ACCEPTED_CMP4 FLOAT 
	,ACCEPTED_CMP5 FLOAT 
	,ACCEPTED_CMP1 FLOAT 
	,ACCEPTED_CMP2 FLOAT 
	,COMPLAIN FLOAT 
	,Z_COST_CONTACT FLOAT 
	,Z_REVENUE FLOAT 
	,RESPONSE FLOAT 
	,CONSTRAINT PK_ID PRIMARY KEY CLUSTERED (ID) -- Chave primária criada para não duplicar dados e facilitar em buscas com índice clusterizado.
);
GO

USE MARKETING;
GO

-- Verificar informações da tabela, onde, a principal verificada neste caso, seria a (COLUMN_NAME) e (DATA_TYPE) para validar os tipos dos dados na criação da tabela.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TBL_DADOS_CAMPANHA';
GO

-- Verificar se informações da tabela, onde, a principal verificada neste caso, seria se a tabela possuí uma chave primária, visando não duplicar registros.
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'TBL_DADOS_CAMPANHA';
GO

-- Caso queria excluir a tabela criada.

DROP TABLE [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA];
GO

-- Caso queira deletar dados da tabela criada.
DELETE FROM [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA];
GO

-- Caso queira truncar dados da tabela criada.
TRUNCATE TABLE [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA];
GO

--------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar todos as colunas da tabela.
SELECT * FROM [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA];

--------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar colunas especificas da tabela.
SELECT
      [ID]
	 ,[EDUCATION]
	 ,[MARITAL_STATUS]
	 ,[YEAR_BIRTH]
	 ,[RECENCY]

FROM [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA];

--------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar e renomear colunas especificadas da tabela.
SELECT
      [ID] AS [IDENTIFICAÇÃO]
	 ,[EDUCATION] AS [EDUCAÇÃO]
	 ,[MARITAL_STATUS] AS [ESTADO CIVIL]
	 ,[YEAR_BIRTH] AS [ANO DE NASCIMENTO]
	 ,[RECENCY] AS [DIAS DESDE ÚLTIMA COMPRA]

FROM [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA];

--------------------------------------------------------------------------------------------------------------------------------------