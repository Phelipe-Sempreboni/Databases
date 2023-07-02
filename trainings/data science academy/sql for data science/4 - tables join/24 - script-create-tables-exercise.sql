------------------------------------------------------------------------------------------------------------ #

-- Criação de tabelas para o exericio do capítulo 4.

CREATE TABLE dsa_module_four.tb_athletes 
(
	 name VARCHAR(250)
	,noc VARCHAR(250)
	,discipline VARCHAR(250)
);

------------------------------------------------------------------------------------------------------------ #

-- Criação de tabelas para o exericio do capítulo 4.

CREATE TABLE dsa_module_four.tb_coaches 
(
	 name VARCHAR(250)
	,noc VARCHAR(250)
	,discipline VARCHAR(250)
    ,event VARCHAR(250)
);

------------------------------------------------------------------------------------------------------------ #

-- Criação de tabelas para o exericio do capítulo 4.

CREATE TABLE dsa_module_four.tb_endries_gender 
(
	 discipline VARCHAR(250)
	,female INT
	,male INT
    ,total INT
);

------------------------------------------------------------------------------------------------------------ #

-- Criação de tabelas para o exericio do capítulo 4.

CREATE TABLE dsa_module_four.tb_medals
(
	 ranking INT
	,team_noc VARCHAR(250)
	,gold INT
    ,silver INT
    ,bronze INT
    ,total INT
    ,ranking_by_total INT
);

------------------------------------------------------------------------------------------------------------ #

-- Criação de tabelas para o exericio do capítulo 4.

CREATE TABLE dsa_module_four.tb_teams
(
	 name VARCHAR(250)
	,discipline VARCHAR(250)
	,noc VARCHAR(250)
	,event VARCHAR(250)
);

------------------------------------------------------------------------------------------------------------ #