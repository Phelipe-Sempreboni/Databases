# Projeto de MySQL

---

### Abaixo um projeto em MySQL que foi feito anteriormente para faculdade e pode auxiliar as pessoas que se interessam pelo assunto, onde é possível analisar e/ou verificar e executar alguns comandos do MySQL.

---

Base dos principais comandos utilizados neste projeto:

* Comandos para criação -> CREATE
* Comandos para exclusão -> DROP
* Comandos para deletar -> DELETE
* Comandos para descrição -> DESCRIBE
* Comandos para alteração -> ALTER
* Comandos para criação de chaves primárias -> INT PRIMARY KEY NOT NULL AUTO_INCREMENT
* Comandos para criação de chaves estrangerias -> ADD FOREIGN KEY
* Comandos para inserção de dados -> INSERT INTO
* Comandos para atualização de dados -> UPDATE
* Comandos para seleção de dados - SELECT
* Comandos para relação entre dados - JOIN

---

_Observação: A pártir deste ponto, é possível copiar os comentários e códigos inteiros e inseri-los direto no MySQL e executado, onde todos os comandos seguirão normalmente. Todos os comandos e demais informações estão comentadas neste projeto._

---

```

-- Á partir deste ponto os comentários e comandos abaixo podem ser copiados e inseridos direto no SQL Server para análises, estudos, testes, etc.
-- Nota: Temos temos esse arquivo na pasta em formato (.sql)

-- Este projeto tem o seguinte cenário, do questionamento abaixo:

-- Início dos scripts:

/*
Responsável: Projetista/Analista de Dados;
Empresa contratante: RH_SOLUTIONS;
Tipo do trabalho: Construção de modelo relacional;
*/

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

/*
Ata de reunião:
“A empresa organiza o seu trabalho em projetos que possuem um número identificador como código, uma abreviatura do projeto e um texto descritivo. Por exemplo, um projeto pode ser de código 2134, com abreviatura de “TOPAZIO” e com breve descrição de “Construção do condomínio predial Topázio”. Em cada projeto, são alocados os empregados que possuem um código e um nome; se um projeto possui seu conjunto de empregados, um empregado pode atuar junto a vários projetos. Além disso, o sistema tem um cadastro de cargos e um cadastro dos setores da empresa. O registro de um cargo possui um código, uma descrição e o valor do salário, e o de um setor possui um código e uma descrição. Cada empregado deve estar associado ao seu cargo e alocado ao seu setor”.
/*

/*
Atividades:

Diante desse cenário, responda às questões a seguir.

1.Construa o modelo relacional que representa o cenário exposto, contemplando tabelas, campos, chaves primárias e chaves estrangeiras no modelo.
2.Apresente o comando de DDL (Data Definition Language) para a criação da tabela de CARGOS, contemplando os campos, seus tipos de dados, a obrigatoriedade e a chave primária.
*/

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco extra: Caso seja necessário dropar o database e as tabelas.

-- Comandos para dropar o database e/ou dropar as tabelas:
DROP TABLE projetos;
DROP TABLE funcionarios;
DROP TABLE cargos;
DROP TABLE setores;
DROP DATABASE rh_solutions;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 1: Criar database e setar para utiliza-lo.

-- Comando para criação de database para o cliente: rh_solutions:
CREATE DATABASE rh_solutions;

-- Comando para setar/utilizar o database como principal, para não utilziar outro banco, como o sys sem querer:
USE rh_solutions;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 2: Criação das tabelas.

-- Comando para setar/utilizar o database como principal, para não utilziar outro banco, como o sys sem querer:
USE rh_solutions;

-- Comando para criação das tabelas:
CREATE TABLE projetos(
cod_projeto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_projeto VARCHAR (20) NOT NULL,
breve_descricao VARCHAR (150)
) ENGINE = innodb;

CREATE TABLE funcionarios(
cod_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_funcionario VARCHAR (50) NOT NULL
) ENGINE = innodb;

CREATE TABLE cargos(
cod_cargo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_cargo VARCHAR (50) NOT NULL,
salario_cargo INT NOT NULL
) ENGINE = innodb;

CREATE TABLE setores(
cod_setor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_setor VARCHAR (50) NOT NULL
) ENGINE = innodb;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 3: verificação das estruturas das tabelas depois de criadas.

-- Comando para setar/utilizar o database como principal, para não utilziar outro banco, como o sys sem querer:
USE rh_solutions;

-- Comando para verificar estrutura das tabelas:
DESCRIBE projetos;
DESCRIBE funcionarios;
DESCRIBE cargos;
DESCRIBE setores;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 4: Alterar tabelas com inserção de colunas e chaves estrangeiras e também verificar a estrutura das tabelas depois de alteradas.

-- Comando para setar/utilizar o database como principal, para não utilziar outro banco, como o sys sem querer:
USE rh_solutions;

-- Comandos para alteração de tabela e adição de colunas:
ALTER TABLE projetos ADD COLUMN id_funcionario INT;
ALTER TABLE funcionarios ADD COLUMN id_cargo INT;
ALTER TABLE funcionarios ADD COLUMN id_setor INT;

-- Comandos para alterar tabelas e inserir chave estrangeira (FOREIGN KEY):
ALTER TABLE funcionarios
ADD FOREIGN KEY (id_cargo)
REFERENCES funcionarios (cod_funcionario);

-- Comandos para alterar tabelas e inserir chave estrangeira (FOREIGN KEY):
ALTER TABLE funcionarios
ADD FOREIGN KEY (id_setor)
REFERENCES funcionarios (cod_funcionario);

-- Comando para verificar estrutura das tabelas:
DESCRIBE projetos;
DESCRIBE funcionarios;
DESCRIBE cargos;
DESCRIBE setores;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 5: Inserir dados nas tabelas e atualizar as tabelas de acordo com codigos e ids. Inserção de dados para testes.

-- Comando para setar/utilizar o database como principal, para não utilziar outro banco, como o sys sem querer:
USE rh_solutions;

INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('ArmazemMagazine', 'Modernizacao do armazem da Magazine Luiza');
INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('Ecovias', 'Reestruturacao de Data Warehouse (DW)');
INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('ProjetoNet', 'Construção do novo Data lake da NET em Perdizes');
INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('ProjetoClaro', 'Construção do novo Data lake da Claro em Guarulhos');


-- Comando para inserir dados na tabela:
INSERT INTO funcionarios (nome_funcionario) VALUES ('Henrique Castilho');
INSERT INTO funcionarios (nome_funcionario) VALUES ('Grazielle Azevedo');

-- Comando para inserir dados na tabela:
INSERT INTO cargos (nome_cargo, salario_cargo) VALUES ('Analista de Negócios', 10000);
INSERT INTO cargos (nome_cargo, salario_cargo) VALUES ('Analista de Planejamento e Controle', 10000);

-- Comando para inserir dados na tabela:
INSERT INTO setores (nome_setor) VALUES ('Network Global');
INSERT INTO setores (nome_setor) VALUES ('Commercial and Faturing Global');

-- Comando para atualizar informação na tabela:
UPDATE projetos SET id_funcionario = 1 WHERE cod_projeto = 2;
UPDATE projetos SET id_funcionario = 2 WHERE cod_projeto = 1;
UPDATE projetos SET id_funcionario = 2 WHERE cod_projeto = 3;
UPDATE projetos SET id_funcionario = 1 WHERE cod_projeto = 4;


-- Comando para atualizar informação na tabela:
UPDATE funcionarios SET id_cargo = 1 WHERE cod_funcionario = 1;
UPDATE funcionarios SET id_setor = 1 WHERE cod_funcionario = 1;

-- Comando para atualizar informação na tabela:
UPDATE funcionarios SET id_cargo = 2 WHERE cod_funcionario = 2;
UPDATE funcionarios SET id_setor = 2 WHERE cod_funcionario = 2;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 6: Verificar dados da tabelas e relações (JOIN) realizados para verificar a confiabildiade e assertividade das tabelas relacionadas.

-- Comando para setar/utilizar o database como principal, para não utilziar outro banco, como o sys sem querer:
USE rh_solutions;

-- Comandos para verificar dados alocados/gravados na tabela:
SELECT * FROM projetos;
SELECT * FROM funcionarios;
SELECT * FROM cargos;
SELECT * FROM setores;

-- Teste com join para verificar ligação das tabelas e chaves estrangeiras:
SELECT 
	 A.cod_funcionario 
    ,A.nome_funcionario
    ,B.nome_cargo
    ,B.salario_cargo
    ,C.nome_setor
    ,A.id_cargo
    ,A.id_setor
FROM funcionarios AS A
LEFT JOIN cargos AS B ON A.id_cargo = B.cod_cargo
LEFT JOIN setores AS C ON A.id_setor = C.cod_setor;

-- Seguindo a regra, podemos ter um funcionários em diversos projetos:
-- Também verificado a ligação com as demais tabelas, onde todas tabelas foram utilizadas (projetos, funcionarios, cargos e setores)
SELECT
	 A.cod_projeto
    ,A.nome_projeto
    ,A.breve_descricao
    ,B.nome_funcionario
    ,C.nome_cargo
    ,D.nome_setor
    ,A.id_funcionario

FROM projetos AS A
LEFT JOIN funcionarios AS B ON A.id_funcionario = B.cod_funcionario
LEFT JOIN cargos AS C ON B.id_cargo = cod_cargo
LEFT JOIN setores AS D ON B.id_setor = D.cod_setor;

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Bloco 7: Verificação se é possível excluir ou não uma informação de um campo com chave estrangeira.

-- Comando para deletar uma valor do campo nome_cargo, porém, não é possível prosseguir devido a colunas com chaves.
DELETE FROM cargos WHERE nome_cargo = 'Analista de Negócios'

/*
---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X---------------X
*/

-- Projeto finalizado.

```
