------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/channels.csv' INTO TABLE `dsa_module_five`.`tb_channels` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/deliveries.csv' INTO TABLE `dsa_module_five`.`tb_deliveries` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/drivers.csv' INTO TABLE `dsa_module_five`.`tb_drivers` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/hubs.csv' INTO TABLE `dsa_module_five`.`tb_hubs` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/orders.csv' INTO TABLE `dsa_module_five`.`tb_orders` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/payments.csv' INTO TABLE `dsa_module_five`.`tb_payments` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #

LOAD DATA LOCAL INFILE 'C:/Users/pheli/Downloads/stores.csv' INTO TABLE `dsa_module_five`.`tb_stores` CHARACTER SET UTF8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

------------------------------------------------------------------------------------------------------------------------------------------------- #