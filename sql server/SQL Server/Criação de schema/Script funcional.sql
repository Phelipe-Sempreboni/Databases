-- Comando básico para criação de um schema em determinado banco de dados.
-- Schema ou Esquemas tem a função de agrupar certo grupo de tabelas, facilitando sua localidade.
-- Criaremos um banco de dados (MARKETING) e criaremos um schema (MARKETING_ANALISE_CAMPANHA) dentro deste banco criado.

--------------------------------------------------------------------------------------------------------------------------------------

-- Criação do database.

USE master;
GO

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