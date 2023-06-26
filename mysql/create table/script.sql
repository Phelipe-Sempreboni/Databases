---------------------------------------------------------------------------------------------------------------------------------------- #

-- Exemplo de script de criação de uma tabela no MySQL.

CREATE TABLE `dsa_module_two`.`tb_navios` (
  `nome_navio` VARCHAR(50) NULL,
  `mes_ano` VARCHAR(10) NULL,
  `classificacao_risco` VARCHAR(15) NULL,
  `indice_conformidade` VARCHAR(15) NULL,
  `pontuacao_risco` INT NULL,
  `temporada` VARCHAR(200) NULL);

---------------------------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE projetos(
cod_projeto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_projeto VARCHAR (20) NOT NULL,
breve_descricao VARCHAR (150)
) ENGINE = innodb;

---------------------------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE funcionarios(
cod_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_funcionario VARCHAR (50) NOT NULL
) ENGINE = innodb;

---------------------------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE cargos(
cod_cargo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_cargo VARCHAR (50) NOT NULL,
salario_cargo INT NOT NULL
) ENGINE = innodb;

---------------------------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE setores(
cod_setor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_setor VARCHAR (50) NOT NULL
) ENGINE = innodb;

---------------------------------------------------------------------------------------------------------------------------------------- #