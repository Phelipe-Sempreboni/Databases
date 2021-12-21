-- Exemplo para verificar se uma tabela contém dados.
-- Neste exemplo, irei utilizar o comando (SELECT) com (COUNT) e IF/ELSEIF.

-- Caso, queira utilziar diretamente o item (VII), pode utilizar, porém, criamos um passo a passo caso queira testar.
-- Execute os comandos em sequência, até chegar no (VII), que é o teste para verificar se uma coluna em determinada tabela.
-- Fique á vontade para alterar os códigos abaixo.
-- O comando do item (VIII) dropa (excluir) o database (TESTE), que foi criado para realiar esse teste, e consequentemente a tabela e o schema (agrupamento) também são excluídos.


-- I:
CREATE DATABASE TESTE;
GO

-- II:
USE TESTE;
GO

-- III:
CREATE SCHEMA testes;
GO

-- IV:
BEGIN
CREATE TABLE [TESTE].[testes].[TabelaFuncionarios]
(
    [matricula] VARCHAR (20),
    [nome do funcionario] VARCHAR (50),
    [idade] INT,
    [tipo da contratação] VARCHAR (15),
    [situacao] VARCHAR (15),
    [cargo] VARCHAR (70),
    [diretoria] VARCHAR (50),
    [setor] VARCHAR (50),
    [salario] FLOAT,
);
END

-- V:
BEGIN
INSERT INTO [TESTE].[testes].[TabelaFuncionarios] VALUES ('BR208080','Leticia Guimares','50','CLT','Ativo','Técnico Eletricista Especialista','Operaçao e Manutenção','Operacional do Polo Leste','7980')
INSERT INTO [TESTE].[testes].[TabelaFuncionarios] VALUES ('BR208081','Renan Nogueira','49','CLT','Ativo','Técnico Eletricista Especialista','Operaçao e Manutenção','Operacional do Polo Leste','7980')
INSERT INTO [TESTE].[testes].[TabelaFuncionarios] VALUES ('BR208082','Marcelo Angelo','48','CLT','Ativo','Técnico Eletricista Especialista','Operaçao e Manutenção','Operacional do Polo Norte','7980')
END

-- VI:
BEGIN
SELECT * FROM [TESTE].[testes].[TabelaFuncionarios]
END


-- VII:
-- Para testar as duas condições do (PRINT), você pode utilziar o comando abaixo (TRUNCATE TABLE) que exclui dados da tabela criada no item (IV) para teste, logo, você testará com dados e sem dados.

BEGIN
IF (SELECT COUNT(*) FROM [TESTE].[testes].[TabelaFuncionarios]) >=1
PRINT ('Tabela contém dados')
ELSE
IF (SELECT COUNT(*) FROM [TESTE].[testes].[TabelaFuncionarios]) =0 OR (SELECT COUNT(*) FROM [TESTE].[testes].[TabelaFuncionarios]) IS NULL
PRINT ('Tabela não contém dados')
END

BEGIN
TRUNCATE TABLE [TESTE].[testes].[TabelaFuncionarios]
END

-- VIII:
BEGIN
USE master
DROP DATABASE TESTE;
END