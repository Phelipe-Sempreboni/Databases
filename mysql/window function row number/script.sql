------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o ROW NUMBER, acesse o link da aula abaixo.

-- Youtube: SQL - ROW_NUMBER e Window Functions (Funções de Janela) - Curso Introdução ao SQL Pt.8: https://www.youtube.com/watch?v=uxR7xyHMR0A

-- Youtube: SQL SERVER | 2 | Obter o número da linha do resultset com ROW_NUMBER(): https://www.youtube.com/watch?v=fAuN-jho0kc

-- Artigo de SQL ROW_NUMBER: https://www.sqltutorial.org/sql-window-functions/sql-row_number/

------------------------------------------------------------------------------------------------------------------ #

-- Scripa para aplicação do comando ROW_NUMBER com SQL.

-- O ROW_NUMBER() é uma função de janela que atribui um número inteiro sequencial a cada linha no conjunto de resultados da consulta. Você pode, por exemplo, criar um ranking com esse comando.

-- Notar que no exemplo abaixo usaremos a solução 1 com um comando (COUNT) e a solução com um (ROW_NUMBER), onde você irá notar que podemos realizar esse tipo de operação.

-- Muitas vezes o (ROW_NUMBER) pode ter uma performance melhor que um comando de (COUNT).

------------------------------------------------------------------------------------------------------------------ #

-- Veja o exemplo abaixo:

-- Estação de início, data de início de cada aluguel de bike e duração de cada aluguel em segundos.
-- Número de aluguéis de bikes (independente da estação) ao longo do tempo.
-- Somente os registros quando a data de início for inferior a '2012-01-08'.

-- Solutação 1:
-- Nessa utilizamos o COUNT.
SELECT
	 estacao_inicio
    ,data_inicio
    ,duracao_segundos
	,COUNT(duracao_segundos/60/60) OVER (ORDER BY data_inicio) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08';

-- Solutação 2:
-- Nessa utilizamos o ROW_NUMBER().
SELECT
	 estacao_inicio
    ,data_inicio
    ,duracao_segundos
	,ROW_NUMBER() OVER (ORDER BY data_inicio) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08';

------------------------------------------------------------------------------------------------------------------ #

-- E se quisessemos o mesmo resultado anterior, mas a contagem por estação ?

SELECT
	 estacao_inicio
    ,data_inicio
    ,duracao_segundos
	,ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08';

------------------------------------------------------------------------------------------------------------------ #

-- Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo.
-- Filtrar para a estação de id 31000.
-- Aqui é utilizado o ROW_NUMBER().

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
	,ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

------------------------------------------------------------------------------------------------------------------ #
