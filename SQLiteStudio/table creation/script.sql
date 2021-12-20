
-- Criar uma tabela com chave primária de autoincremento e uma chave unique para garintir, neste caso, que os nomes não dupliquem.
CREATE TABLE TABELA
(
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- Chave primária com autoincremento.
    nome VARCHAR (50) UNIQUE NOT NULL, -- Chave UNIQUE para garantir que nomes não dupliquem.
    idade INTEGER
);

------------------------------------------------------------------------------------------------------------------------------------

-- Criar uma tabela com uma chave primária em determinado campo, visando que os valores não dupliquem.
CREATE TABLE tb_iw59_medidores 
(
    nota VARCHAR(25) PRIMARY KEY
   ,instalacao VARCHAR(20)
   ,tipo_de_nota VARCHAR(8)
   ,code_codificacao VARCHAR(8)
   ,status_usuario VARCHAR(8)
   ,data_da_nota DATE
   ,modificado_em DATE
   ,encerram_por_data DATE
   ,centro_trabalho VARCHAR(20)
   ,cidade VARCHAR(50)
);

------------------------------------------------------------------------------------------------------------------------------------