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
    ,CEP VARCHAR (30)
    ,IDADE INT
    ,SEXO VARCHAR (20)
    ,LIMITE_CREDITO_COMPRA FLOAT
    ,VOLUME_MINIMO_COMPRA FLOAT
    ,PRIMEIRA_COMPRA NUMBER (1)
    ,DATA_NASCIMENTO DATE
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
    ,DATA_ADMISSAO DATE
    ,ESTA_DE_FERIAS VARCHAR(4)

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

-- Oitavo exemplo:
-- Construção de uma tabela com: 
-- Coluna com auto incremento automático, neste caso um tipo de dado (INT) inteiro.
-- Chave primária.
-- Constraint (restrição).
-- Comentários na tabea e colunas.

CREATE TABLE PRODUTOS.ETL_SAP_ESTOQUE
(
     ID_ETL_SAP_ESTOQUE INT GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CONSTRAINT PK_ETL_API_PEOPLES PRIMARY KEY
    ,ID_ORIGIN_SAP_ESTOQUE VARCHAR(50)
    ,DES_MATERIAL_NAME VARCHAR (100)
    ,DES_DESCRIPTION_MATERIAL VARCHAR (100)
    ,NAM_OWNER VARCHAR (100)

);

COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.ID_ETL_SAP_ESTOQUE IS 'Coluna de id gerada automaticamente com autoincremento.'; -- Adicição do comentário na coluna.
COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.ID_ORIGIN_SAP_ESTOQUE IS 'Coluna com id de origem do sistema.'; -- Adicição do comentário na coluna.
COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.DES_MATERIAL_NAME IS 'Coluna com o nome do material.'; -- Adicição do comentário na coluna.
COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.DES_DESCRIPTION_MATERIAL IS 'Coluna com a descrição do material.'; -- Adicição do comentário na coluna.
COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.NAM_OWNER IS 'Coluna com o responsável pelo material.'; -- Adicição do comentário na coluna.
COMMENT ON TABLE PRODUTOS.ETL_SAP_ESTOQUE IS 'Coluna com a informação da quantidade em estoque disponível.'; -- Adicição do comentário na tabela.

------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Oitavo exemplo:
-- Construção de uma tabela com: 
-- Coluna com auto incremento automático, neste caso um tipo de dado (INT) inteiro.
-- Chave primária.
-- Constraint (restrição).
-- Comentários na tabea e colunas.

-- Neste caso abaixo, é um script que antes de criar a tabela, ele verifica se ela não existe, e caso não exista é criada, caso contrátio, será mantida a tabela existente e uma mensagem será exibida que a tabela já existe.

SET ECHO ON

SET SERVEROUT ON

DECLARE
    V_ERROR_RESOURCE_BUSY EXCEPTION;
    PRAGMA EXCEPTION_INIT(V_ERROR_RESOURCE_BUSY, -00054);
    V_SQL1 CONSTANT VARCHAR2(2000) := 'CREATE TABLE PRODUTOS.ETL_SAP_ESTOQUE(
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
    WHERE OWNER = 'PRODUTOS' -- Escreva o schema/usuário
    AND TABLE_NAME = 'ETL_SAP_ESTOQUE' -- Escreva o nome da tabela
    ;
   IF V_EXISTE > 0 THEN
      DBMS_OUTPUT.PUT_LINE('*** Essa tabela já existe neste ambiente: ' || SYS_CONTEXT('USERENV','INSTANCE_NAME') || ' / ' || SYS_CONTEXT('USERENV','SERVER_HOST'));
   ELSE
      WHILE V_NAOEXECUTOU
      LOOP
         BEGIN
            EXECUTE IMMEDIATE V_SQL1;
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.ID_ETL_SAP_ESTOQUE IS ''Coluna de id gerada automaticamente com autoincremento.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.ID_ORIGIN_SAP_ESTOQUE IS ''Coluna com id de origem do sistema..'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.DES_MATERIAL_NAME IS ''Coluna com o nome do material.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.DES_DESCRIPTION_MATERIAL IS ''Coluna com a descrição do material.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON COLUMN PRODUTOS.ETL_SAP_ESTOQUE.NAM_OWNER IS ''Coluna com o responsável pelo material.'''; -- Adicição do comentário na coluna.
            EXECUTE IMMEDIATE 'COMMENT ON TABLE PRODUTOS.ETL_SAP_ESTOQUE IS ''Coluna com a informação da quantidade em estoque disponível.'''; -- Adicição do comentário na tabela.
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
------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x

-- Este script é a mesma coisa do script acima, porém, fizemos como se o schema/usuário fosse o próprio padrão do Oracle Database, o SYSTEM.

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
------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x------ x
