-- Exemplo para verificar se uma coluna exite em uma determinada tabela. Este teste é o comando do item (VII).

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
IF EXISTS
(
SELECT TABLE_CATALOG, COLUMN_NAME, TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_CATALOG = 'TESTE' AND TABLE_NAME = 'TabelaFuncionarios' AND COLUMN_NAME = 'matricula'
)
PRINT ('Coluna existe na tabela')
ELSE
PRINT ('Coluna não existe na tabela')

-- VIII:
BEGIN
USE master
DROP DATABASE TESTE;
END
