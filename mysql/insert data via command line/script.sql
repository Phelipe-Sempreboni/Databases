----------------------------------------------------------------------------------------------------------------------------------- #

-- Podemos realizar um (INSERT INTO) diretamente pelo banco de dados ou ferramentas externas de ETL ou ELT, mas também podemos fazer isso via linha de comando do (CMD) ou do próprio (MySQL).

-- Se vocÊ tiver feito a instalação completa do MySQL, virá com um assistente direto de linha de comando, facilitando o uso.

-- 1º: Conecte no MySQL via linha de comando
/usr/local/mysql/bin/mysql -u root -p

-- 2º: Execute o comando abaixo para habilitar o carregamento de dados via linha de comando
SET GLOBAL local_infile = true;
exit;

-- 3º: Conecte novamente no MySQL com o comando abaixo, onde devemos notar que foi adicionado um comando para conexão.
/usr/local/mysql/bin/mysql --local-infile=1 -u root -p

-- Todos os comandos do (4º passo) são para carregar dados em tabelas e arquivos diferentes.
-- 4º: Execute os comandos abaixo para carregar os dados
LOAD DATA LOCAL INFILE '/Users/dmpm/Dropbox/DSA/SQL-Para-Data-Science/Cap05/Exercicio3/Athletes.csv' INTO TABLE `exec3`.`TB_ATLETAS` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

-- 4º: Execute os comandos abaixo para carregar os dados
LOAD DATA LOCAL INFILE '/Users/dmpm/Dropbox/DSA/SQL-Para-Data-Science/Cap05/Exercicio3/Coaches.csv' INTO TABLE `exec3`.`TB_COACHES` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

-- 4º: Execute os comandos abaixo para carregar os dados
LOAD DATA LOCAL INFILE '/Users/dmpm/Dropbox/DSA/SQL-Para-Data-Science/Cap05/Exercicio3/Medals.csv' INTO TABLE `exec3`.`TB_MEDALS` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

-- 4º: Execute os comandos abaixo para carregar os dados
LOAD DATA LOCAL INFILE '/Users/dmpm/Dropbox/DSA/SQL-Para-Data-Science/Cap05/Exercicio3/EntriesGender.csv' INTO TABLE `exec3`.`TB_ENTRIESGENDER` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

-- 4º: Execute os comandos abaixo para carregar os dados
LOAD DATA LOCAL INFILE '/Users/dmpm/Dropbox/DSA/SQL-Para-Data-Science/Cap05/Exercicio3/Teams.csv' INTO TABLE `exec3`.`TB_TEAMS` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

----------------------------------------------------------------------------------------------------------------------------------- #