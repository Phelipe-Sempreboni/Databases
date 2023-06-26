------------------------------------------------------------------------------------------------------------ #

-- Script para alterar uma tabela e adicionar uma chave estrangeira em uma base existente no MySQL.

ALTER TABLE funcionarios ADD FOREIGN KEY (id_cargo) REFERENCES funcionarios (cod_funcionario);

------------------------------------------------------------------------------------------------------------ #

ALTER TABLE funcionarios ADD FOREIGN KEY (id_setor) REFERENCES funcionarios (cod_funcionario);

------------------------------------------------------------------------------------------------------------ #