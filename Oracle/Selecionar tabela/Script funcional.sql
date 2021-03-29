-- Comando para selecionar tabela no Oracle Database pelo SQL Developer ou SQL Plus.
-- Este comando seleciona a tabela inteira, onde ainda não temos a utilização de filtros.
-- Iremos utilizar como exemplo o script de criação de tabela juntamente do SELECT, para termos noção do que está sendo selecione.
-- Note que a tabela ainda está vazia.

-- Este script funcional está no exemplo da pasta (Criação de tabela).
CREATE TABLE TBL_CADASTRO_CLIENTES (
     CPF VARCHAR (11)
    ,NOME_COMPLETO VARCHAR (150)
    ,RUA VARCHAR (100)
    ,BAIRRO VARCHAR (100)
    ,CIDADE VARCHAR (60)
    ,ESTADO VARCHAR (5)
    ,CEP VARCHAR (10)
    ,IDADE INT
    ,SEXO VARCHAR (20)
    ,LIMITE_CREDITO_COMPRA FLOAT
    ,VOLUME_MINIMO_COMPRA FLOAT
    ,PRIMEIRA_COMPRA NUMBER (1)
);

-- Comando para seleção da tabela que foi criada acima.
SELECT * FROM TBL_CADASTRO_CLIENTES;