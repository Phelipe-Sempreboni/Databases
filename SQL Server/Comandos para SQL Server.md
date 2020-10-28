# Comandos para SQL Server

---

### Abaixo alguns comandos de SQL Server que podem ajudar a compreender um pouco da ferramenta com seus comandos e ajudar no dia a dia das pessoas que lidam com essa ferramenta.

---

Criei esse repositório para dividir um pouco do conhecimento que tenho sobre SQL Server, onde foram adquiridos no trabalho, estudos pela Web, cursos, etc. Sempre percebi muitos falando de ferramenras para programação, porém, não ando vendo muito sobre banco de dados, então resolvi criar esse repositório com intuito de aumentar os meus conhecimentos, treinar e dividir com as pessoas, pois, muitas vezes a programação se utiliza de banco de dados para suas aplicações.

Sempre que puder irei aumentar os comandos (querys) desse repositório, tanto em (DQL, DML, DDL, DCL, DTL). Os significados das siglas constam no arquivo (README.md).

Também haverão repositórios de Python e R posteriormente, pois, meu foco é a Ciência de Dados, e essas ferramentas em conjunto (SQL Server ou banco de dados, Python e R) são de extrema importância para essa área.

---

```

-- Os comentários e comando abaixo podem ser copiados e inseridos direto no SQL Server para análises, estudos, testes, etc.

-- Elaborado por: Luiz Phelipe Utiama Sempreboni.
-- Sempre que possível haverão atualizações e aumento dos comandos para análises, estudos, testes, etc.

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x
-- Criação do banco de dados "DB_Projetos" que ficarão as tabelas e demais funcionalidades "schema, functions, stored procedures, etc".
-- Criação do banco de dados de forma padrão somente com "CREATE DATABASE".
-- Nota: Temos mais maneiras de criar um banco de dados, tanto pelo assistente ou comandos com "CREATE DATABASE" com mais clausulas, porém, irei focar somente no mais simples neste momento.

CREATE DATABASE DB_Projetos;

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x
-- Criação do schema "agrupammento" que ficará e/ou ficarão as tabelas.
-- Criação do schema de forma padrão somente com "CREATE SCHEMA".
-- Nota: Não esqueça de executar os comandos abaixo, principalmente o "USE DB_Projetos", que server para selecionar o banco de dados que os esquemas serão criados.
-- Nota: Executar uma linha por vez dos 4 códigos abaixo, pois, caso não seja feito dessa maneira, ocorrerá erro.

USE DB_Projetos;
CREATE SCHEMA filmes;

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Comando para excluir um banco de dados "DROP DATABASE" e schemas (agrupamentos) "DROP SCHEMA".
-- Certificar-se que ao executar o comando, não esteja em uso o banco de dados que será excluído pelo comando.
-- Nota: Se for excluído primeira o banco de dados não será necessário executar os comandos para exclusão dos schemas.

USE DB_Projetos;
DROP SCHEMA filmes;

USE master;
DROP DATABASE DB_Projetos;

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Abaixo comando para criação de uma tabela "movies" no banco de dados "DB_Projetos" no schema "filmes".
-- Para criar a tabela executar somente o "Script 1", pois, se executar o "Script 2" a tabela será exluída.
-- Para excluir a tabela execute o "Script 2", e caso queira recriar a tabela execute o "Script 2".

-- Script 1: Criação da tabela "movies" no esquema "filmes"
-- Script 2: Deletar a tabela, onde toda estrutura e dados inclusos serão deletados.

-- Script 1
USE DB_Projetos;

CREATE TABLE filmes.movies (
     id INT IDENTITY (1,1) NOT NULL	
	,nome_filme VARCHAR (150)
	,produtora_filme VARCHAR (100)
	,nota_filme FLOAT
	CONSTRAINT PK_id PRIMARY KEY (id)
)
GO

-- Script 2
DROP TABLE filmes.movies;

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Abaixo comandos para inserção de dados na tabela "movies".
-- Também temos comandos para selecionar os dados, deletar os dados da tabela ou deletar a própria tabela.
-- Nota: Não esqueça de executar o "USE DB_Projetos" para que os comandos sejam executados no banco de dados correto.
-- Caso os dados da tabela sejam somente deletados, a coluna "id" gerará novos números e não zerados e recomeçados, somente serão recomeçados caso a tabela seja excluída e recriada, logo, a geração voltará para o inicio.

-- Script 1: Adicionar dados na tabela "movies"
-- SCript 2: Selecionar dados que foram inseridos na tabela "movies"
-- SCript 3: Deletar dados da tabela. Não deleterá a tabela.
-- Script 4: Deletar a tabela, onde toda estrutura e dados inclusos serão deletados.

-- Script 1
USE DB_Projetos;

INSERT INTO filmes.movies (nome_filme, produtora_filme, nota_filme) 
	  VALUES ('Homem-Aranha', 'Universal', 7.5)
			,('Velozes e Furiosos', 'Warner Bros', 5.5)
			,('Vingadores', 'New Studios', 4)
			,('Batman Begins', 'Studio California', 9)
			,('CREED', 'Universal', 7)
			,('O Poder', 'Universal', 9.5)
			,('Dragon Ball Z', 'Warner Bros', 10)
			,('A Hora do Hush', 'Old Studios', 4.5)
			,('Truque de Mestre', 'Studio Williams EUA', 8.5)
			,('O Estagiário', 'Texas Studio', 10)
			,('Zerando a Vida', 'Universal', 3.5)

-- Script 2
SELECT * FROM DB_Projetos.filmes.movies;

-- Script 3
DELETE FROM DB_Projetos.filmes.movies;

-- Script 4
DROP TABLE DB_Projetos.filmes.movies;

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Abaixo comandos para atualizar algum dado da tabela "movies" pelo comando UPDATE.

-- Script 1: Alterado o nome do filme do id (1).
-- Script 2: Alterado para o nome original o filme do id (1).
-- SCript 3: Utilizar esse script para selecionar e verificar se realmente houve a atualização das informações.

-- Execute o Script 1 e depois o 3.
-- Execute o Script 2 e depois o 3.

-- Script 1
USE DB_Projetos;

UPDATE DB_Projetos.filmes.movies
	SET nome_filme = 'Alterei o nome do filme do id (1)'
	WHERE nome_filme = 'Homem-Aranha'

-- Script 2
UPDATE DB_Projetos.filmes.movies
	SET nome_filme = 'Homem-Aranha'
	WHERE nome_filme = 'Alterei o nome do filme do id (1)'

-- Script 3
SELECT * FROM [DB_Projetos].[filmes].[movies]

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Abaixo comandos para selecionar os dados da tabela "movies" e também para selecionar os dados e filtra-lo pela coluna "id"

-- Script 1: Comando para selecionar os dados com as colunas.
-- Script 2: Comando para selecionar os dados com as colunas e com comando "WHERE" para filtrar os dados pela coluna "id".
-- Script 3: Comando para selecionar os dados, sem inserir as colunas, somente o comando direto e sem filtros por colunas com comando "WHERE".

-- Script 1
USE DB_Projetos

SELECT
	 [id]
	,[nome_filme]
	,[produtora_filme]
	,[nota_filme]

FROM [DB_Projetos].[filmes].[movies]

-- Script 2
SELECT
	 [id]
	,[nome_filme]
	,[produtora_filme]
	,[nota_filme]

FROM [DB_Projetos].[filmes].[movies]

WHERE [id] = 4

-- Script 3:
SELECT * FROM [DB_Projetos].[filmes].[movies]

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Haverá continuação em breve de mais comandos do SQL Server... : )

```

#### Aguarde que haverão novos comandos inseridos em breve :collision: