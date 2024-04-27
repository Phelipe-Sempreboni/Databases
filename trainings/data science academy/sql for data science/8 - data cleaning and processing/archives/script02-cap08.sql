------------------------------------------------------------------------------------------------------------- #

 -- Script 02

 ------------------------------------------------------------------------------------------------------------- #

 -- Cria a tabela
CREATE TABLE dsa_module_eight.tb_criancas(nome varchar(20), idade int, peso float);

------------------------------------------------------------------------------------------------------------- #

 -- Insere os dados
INSERT INTO dsa_module_eight.tb_criancas 
VALUES ('Bob', 3, 15), ('Maria', 42, 98), ('Julia', 3, 16), ('Maximiliano', 2, 12), ('Roberto', 1, 11), ('Jamil', 2, 14), ('Alberto', 3, 17);

SELECT * FROM dsa_module_eight.tb_criancas;

------------------------------------------------------------------------------------------------------------- #

-- Cálcula médias

SELECT AVG(idade) AS media_idade, STDDEV(idade) AS desvio_padrao_idade
FROM dsa_module_eight.tb_criancas;

SELECT AVG(idade) AS media_idade, STDDEV(idade) AS desvio_padrao_idade 
FROM dsa_module_eight.tb_criancas 
WHERE idade < 5;

SELECT AVG(peso) AS media_peso, STDDEV(peso) AS desvio_padrao_peso
FROM dsa_module_eight.tb_criancas;

SELECT AVG(peso) AS media_peso, STDDEV(peso) AS desvio_padrao_peso 
FROM dsa_module_eight.tb_criancas 
WHERE idade < 5;

SELECT * FROM dsa_module_eight.tb_criancas ORDER BY idade;

------------------------------------------------------------------------------------------------------------- #

 -- Calcula a mediana da variável idade
SET @rowindex := -1;
 
SELECT
   AVG(idade) AS mediana 
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex, dsa_module_eight.tb_criancas.idade AS idade
    FROM dsa_module_eight.tb_criancas
    ORDER BY dsa_module_eight.tb_criancas.idade) AS d
WHERE d.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));

SELECT * FROM dsa_module_eight.tb_criancas ORDER BY peso;

------------------------------------------------------------------------------------------------------------- #

 -- Calcula a mediana da variável peso
SET @rowindex := -1;
 
SELECT
   AVG(peso) AS mediana 
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex, dsa_module_eight.tb_criancas.peso AS peso
    FROM dsa_module_eight.tb_criancas
    ORDER BY dsa_module_eight.tb_criancas.peso) AS d
WHERE d.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));

------------------------------------------------------------------------------------------------------------- #

 -- Resolve o problema do outlier com imputação da mediana
SET SQL_SAFE_UPDATES = 0;

UPDATE dsa_module_eight.tb_criancas
SET idade = 3
WHERE idade = 42;

UPDATE dsa_module_eight.tb_criancas
SET peso = 15
WHERE peso = 98;

SET SQL_SAFE_UPDATES = 1;

SELECT AVG(idade) AS media_idade, STDDEV(idade) AS desvio_padrao_idade
FROM dsa_module_eight.tb_criancas;

SELECT AVG(peso) AS media_peso, STDDEV(peso) AS desvio_padrao_peso
FROM dsa_module_eight.tb_criancas;

------------------------------------------------------------------------------------------------------------- #
