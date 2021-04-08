-- Script funcional exemplo para criação de tabela no Oracle Database pelo SQL Developer ou SQL Plus.
-- Neste caso de criação, não foi inserido nenhuma chave primária ou índice, foi somente criada a tabela de forma normal.


-- Primeiro exemplo:
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

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Segundo exemplo:
CREATE TABLE TBL_PRODUTOS (
     PRODUTO VARCHAR (11)
    ,NOME VARCHAR (150)
    ,EMBALAGEM VARCHAR (50)
    ,TAMANHO VARCHAR (50)
    ,SABOR VARCHAR (50)
    ,PRECO_LISTA FLOAT
);

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Terceiro exemplo:
CREATE TABLE TBL_VENDEDORES (
     MATRICULA VARCHAR (30)
    ,NOME VARCHAR (150)
    ,PERCENTUAL_COMISSAO NUMBER

);

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x
