-- Comando para alteração do tipo de coluna de uma tabela.
-- Iremos criar um database.
-- Iremos criar um schema.
-- Iremos criar a tabela.
-- Iremos alterar o tipo da coluna.
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

-- Comando para criação da tabela.

USE MARKETING;

CREATE TABLE [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA_TESTE] (
	 ID INT
	,YEAR_BIRTH FLOAT 
	,EDUCATION VARCHAR (20) 
	,MARITAL_STATUS VARCHAR (20) 
	,INCOME FLOAT 
	,KIDHOME FLOAT 
);

--------------------------------------------------------------------------------------------------------------------------------------

-- Iremos alterar ao coluna ID de tipo (INT) para varchar (10) e inserir que não pode haver comandos nulos no campos.

ALTER TABLE [MARKETING].[MARKETING_ANALISE_CAMPANHA].[TBL_DADOS_CAMPANHA_TESTE]
ALTER COLUMN [ID]
VARCHAR (10) NOT NULL

--------------------------------------------------------------------------------------------------------------------------------------
