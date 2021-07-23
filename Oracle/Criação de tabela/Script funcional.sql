-- Script funcional exemplo para criação de tabela no Oracle Database pelo SQL Developer ou SQL Plus.
-- Neste caso de criação, não foi inserido nenhuma chave primária ou índice, foi somente criada a tabela de forma normal.


-- Primeiro exemplo:
-- Criação convencional, sem nenhum tipo de restrição.
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
-- Criação convencional, sem nenhum tipo de restrição.
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
-- Criação convencional, sem nenhum tipo de restrição.
CREATE TABLE TBL_VENDEDORES (
     MATRICULA VARCHAR (30)
    ,NOME VARCHAR (150)
    ,PERCENTUAL_COMISSAO NUMBER

);

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Quarto exemplo:
-- Construção de uma tabela com: 
-- Chave primária.

CREATE TABLE PRODUTOS.ETL_SAP_ESTOQUE
(
     ID_ETL_SAP_ESTOQUE INT PRIMARY KEY
    ,ID_ORIGIN_SAP_ESTOQUE VARCHAR(50)
    ,DES_MATERIAL_NAME VARCHAR (100)
    ,DES_DESCRIPTION_MATERIAL VARCHAR (100)
    ,NAM_OWNER VARCHAR (100)

);

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Quinto exemplo:
-- Construção de uma tabela com: 
-- Chave primária.
-- Constraint (restrição).

CREATE TABLE PRODUTOS.ETL_SAP_ESTOQUE
(
     ID_ETL_SAP_ESTOQUE INT CONSTRAINT PK_ETL_API_PEOPLES PRIMARY KEY
    ,ID_ORIGIN_SAP_ESTOQUE VARCHAR(50)
    ,DES_MATERIAL_NAME VARCHAR (100)
    ,DES_DESCRIPTION_MATERIAL VARCHAR (100)
    ,NAM_OWNER VARCHAR (100)

);

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Quinto exemplo:
-- Construção de uma tabela com: 
-- Coluna com auto incremento automático, neste caso um tipo de dado (INT) inteiro.
-- Chave primária.
-- Constraint (restrição).

CREATE TABLE PRODUTOS.ETL_SAP_ESTOQUE
(
     ID_ETL_SAP_ESTOQUE INT GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CONSTRAINT PK_ETL_API_PEOPLES PRIMARY KEY
    ,ID_ORIGIN_SAP_ESTOQUE VARCHAR(50)
    ,DES_MATERIAL_NAME VARCHAR (100)
    ,DES_DESCRIPTION_MATERIAL VARCHAR (100)
    ,NAM_OWNER VARCHAR (100)

);

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Sexta maneira:
-- Alterando uma tabela existente, que não contém restrição nenhuma, em uma com:
-- Chave primária.
-- Constraint (restrição).

-- Tabela sem restrição:
CREATE TABLE TBL_PRODUTOS (
     PRODUTO VARCHAR (11)
    ,NOME VARCHAR (150)
    ,EMBALAGEM VARCHAR (50)
    ,TAMANHO VARCHAR (50)
    ,SABOR VARCHAR (50)
    ,PRECO_LISTA FLOAT
);

-- Alterando e inserindo chave primária.
ALTER TABLE TBL_PRODUTOS ADD CONSTRAINT PK_TBL_PRODUTOS PRIMARY KEY (PRODUTO);

-- Execute o select da tabela para verificação da da alteração.
SELECT * FROM TBL_PRODUTOS;

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Sétima maneira:
-- Adicionando uma nova coluna em uma tabela existente.

-- Tabela sem restrição:
CREATE TABLE TBL_PRODUTOS (
     PRODUTO VARCHAR (11)
    ,NOME VARCHAR (150)
    ,EMBALAGEM VARCHAR (50)
    ,TAMANHO VARCHAR (50)
    ,SABOR VARCHAR (50)
    ,PRECO_LISTA FLOAT
);

-- Alterando e inserindo chave primária.
ALTER TABLE TBL_PRODUTOS ADD CONSTRAINT PK_TBL_PRODUTOS PRIMARY KEY (PRODUTO);

ALTER TABLE TBL_PRODUTOS ADD DATA_VALIDADE DATE;

-- Execute o select da tabela para verificação da da alteração.
SELECT * FROM TBL_PRODUTOS;

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x