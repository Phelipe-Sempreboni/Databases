-- Testes do SQLiteStudio

CREATE TABLE [Testes].[funcionarios] (
    ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, -- Chave primária com autoincremento.
    nome VARCHAR (50) UNIQUE NOT NULL, -- Chave UNIQUE para garantir que nomes não dupliquem.
    idade INTEGER
);

DROP TABLE [Testes].[funcionarios]; -- DROP tabela;

INSERT INTO [Testes].[funcionarios] VALUES (NULL,'Luiz Phelipe Utiama Sempreboni', 26); -- Inserção de dados. Não esquecer de colocar o (NULL) para que o autoincrement da tabela atue;
INSERT INTO [Testes].[funcionarios] VALUES (NULL,'Rafael De Brito Nascimento', 35);
INSERT INTO [Testes].[funcionarios] VALUES (NULL,'Ricardo Barbosa da Silva', 38);
INSERT INTO [Testes].[funcionarios] VALUES (NULL,'Luiz Phelipe U Sempreboni', 26);
INSERT INTO [Testes].[funcionarios] VALUES (NULL,'Ricardo Barbosa D Silva', 38); 
INSERT INTO [Testes].[funcionarios] VALUES (NULL,'Ricardo Barbosa da Silva', 38); -- Não é possível adicionar nomvante este nome devido a chave UNIQUE;

SELECT * FROM [Testes].[funcionarios]
