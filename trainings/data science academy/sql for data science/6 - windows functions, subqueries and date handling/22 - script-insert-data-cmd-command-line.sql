------------------------------------------------------------------------------------------------------------------------------------------------- #

-- Podemos realizar um (INSERT INTO) diretamente pelo banco de dados ou ferramentas externas de ETL ou ELT, mas também podemos fazer isso via linha de comando do (CMD) ou do próprio (MySQL).

-- Se vocÊ tiver feito a instalação completa do MySQL, virá com um assistente direto de linha de comando, facilitando o uso.

-- 1º: Conecte no MySQL via linha de comando
/mysql -u root -p

------------------------------------------------------------------------------------------------------------------------------------------------- #

-- 2º: Execute o comando abaixo para habilitar o carregamento de dados via linha de comando
SET GLOBAL local_infile = true;
exit;

------------------------------------------------------------------------------------------------------------------------------------------------- #

-- 3º: Conecte novamente no MySQL com o comando abaixo, onde devemos notar que foi adicionado um comando para conexão.
/mysql --local-infile=1 -u root -p

------------------------------------------------------------------------------------------------------------------------------------------------- #

-- 4º: Execute os comandos abaixo para carregar os dados
LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/2012Q1-capitalbikeshare-tripdata.csv' INTO TABLE `dsa_module_six`.`tb_bikes` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #
