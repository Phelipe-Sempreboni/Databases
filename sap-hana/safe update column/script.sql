# -------------------------------------------------------------------------------------------------------------------------------------- #

-- Em algum momento ao realizar um UPDATE de uma tabela no banco de dados, pode ser que você esqueça ou não se atende na utilização do WHERE no comando.

-- Essa ação pode realizar a atualização de campos indevidos, onde pode trazer um grande risco para seu negócio.

-- A maioria dos SGBDS hoje possuem uma trava, ou seja, se você tantar realizar um comando UPDATE sem o WHERE, ele não irá deixar você prosseguir com essa ação.

-- Para conseguir realizar essa ação, você pode utilizar o comando SAFE UPDATE.

-- O comando SAFE UPDATE libera a atualização dos registros sem o WHERE, onde você deve ter absolutar certeza do que está fazendo antes de liberar o comando. 

-- Lembre-se e como boas práticas, ao finalizar a ação de UPDATE, retorne a restrição do SAFE UPDATE para garantir a integridade de suas tabelas.

# -------------------------------------------------------------------------------------------------------------------------------------- #

UPDATE dsa_module_seven.covid_mortes
SET date = str_to_date(date, '%d/%m/%y');

# -------------------------------------------------------------------------------------------------------------------------------------- #

-- Libera a ação no banco de dados.
-- Por padrão do banco de dados e na maioria dos casos, esse é o DEFAULT (padrão) do sistema.
SET SQL_SAFE_UPDATES = 0;

-- Restringe a ação no banco de dados.
SET SQL_SAFE_UPDATES = 1;

# -------------------------------------------------------------------------------------------------------------------------------------- #