------------------------------------------------------------------------------------------------------------------- #

-- Exemplo de script (INSERT INTO), ou seja, para adicionar dados em uma tabela existente no MySQL.

INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('ArmazemMagazine', 'Modernizacao do armazem da Magazine Luiza');
INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('Ecovias', 'Reestruturacao de Data Warehouse (DW)');
INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('ProjetoNet', 'Construção do novo Data lake da NET em Perdizes');
INSERT INTO projetos (nome_projeto, breve_descricao) VALUES ('ProjetoClaro', 'Construção do novo Data lake da Claro em Guarulhos');

------------------------------------------------------------------------------------------------------------------- #

INSERT INTO funcionarios (nome_funcionario) VALUES ('Henrique Castilho');
INSERT INTO funcionarios (nome_funcionario) VALUES ('Grazielle Azevedo');

------------------------------------------------------------------------------------------------------------------- #

INSERT INTO cargos (nome_cargo, salario_cargo) VALUES ('Analista de Negócios', 10000);
INSERT INTO cargos (nome_cargo, salario_cargo) VALUES ('Analista de Planejamento e Controle', 10000);

------------------------------------------------------------------------------------------------------------------- #

INSERT INTO setores (nome_setor) VALUES ('Network Global');
INSERT INTO setores (nome_setor) VALUES ('Commercial and Faturing Global');

------------------------------------------------------------------------------------------------------------------- #

INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (6, "Madona", "Rua 45", "Campos", "RJ");

INSERT INTO dsa_module_four.tb_clientes (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (7, "Carlos Messias", "Rua Alberto Cassio", "Osasco", "SP");

INSERT INTO dsa_module_four.tb_clientes (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (8, "Richarlyson Alberto", "Rua Carlos Almeida Brandao", "Varginha", "MG");

INSERT INTO dsa_module_four.tb_clientes (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (9, "Abib Pastore", "Avenida Josias III", "Vargem Grande", "MG");

INSERT INTO dsa_module_four.tb_clientes (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (10, "Jose Paulo Almeida", "Travessa Portfolio dos Andes", "Camboriu", "RS");

------------------------------------------------------------------------------------------------------------------- #