------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o NTILE, acesse o link da aula abaixo.

-- Youtube: NTILE function in SQL Server: https://www.youtube.com/watch?v=lgzHoNK4X24

-- Artigo de NTILE(): https://www.sqltutorial.org/sql-window-functions/sql-ntile/

------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação do comando NTILE com SQL.

-- O SQL NTILE()é uma função de janela que permite dividir o conjunto de resultados em um número especificado de grupos ou depósitos aproximadamente iguais.

-- Ele atribui a cada grupo um número de balde começando em um. Para cada linha em um grupo, a NTILE()função atribui um número de bucket representando o grupo ao qual a linha pertence.

------------------------------------------------------------------------------------------------------------------ #

-- Sintaxe abaixo:

NTILE(buckets) OVER ( 
	PARTITION BY expr1, expr2,...
	ORDER BY expr1 [ASC|DESC], expr2 ...
);

------------------------------------------------------------------------------------------------------------------ #

-- Veja o exemplo abaixo:

-- NTILE
-- A função NTILE() é uma função de janela (windows) que distribui linhas de uma partição ordenada em um número predefinido de grupos aproximadamente iguais. A função atribui a cada grupo um número a partir de 1. 

SELECT
	 estacao_inicio
    ,duracao_segundos
    ,ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_alugueis
    ,NTILE(2) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_2
    ,NTILE(4) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_4
    ,NTILE(5) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_5
    ,NTILE(10) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_10
    ,NTILE(16) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_16

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

------------------------------------------------------------------------------------------------------------------ #