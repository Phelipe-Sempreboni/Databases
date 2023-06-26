------------------------------------------------------------------------------------------------------------ #

-- Script para atualizar dados em uma tabela existente no MySQL.

UPDATE projetos SET id_funcionario = 1 WHERE cod_projeto = 2;
UPDATE projetos SET id_funcionario = 2 WHERE cod_projeto = 1;
UPDATE projetos SET id_funcionario = 2 WHERE cod_projeto = 3;
UPDATE projetos SET id_funcionario = 1 WHERE cod_projeto = 4;

------------------------------------------------------------------------------------------------------------ #

UPDATE funcionarios SET id_cargo = 1 WHERE cod_funcionario = 1;
UPDATE funcionarios SET id_setor = 1 WHERE cod_funcionario = 1;

------------------------------------------------------------------------------------------------------------ #

UPDATE funcionarios SET id_cargo = 2 WHERE cod_funcionario = 2;
UPDATE funcionarios SET id_setor = 2 WHERE cod_funcionario = 2;

------------------------------------------------------------------------------------------------------------ #