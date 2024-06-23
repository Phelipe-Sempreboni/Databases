------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre as funções de data, acesse o link da aula abaixo.

-- Youtube: SQL SERVER - 16 - Funções de Data (getdate, datediff, dateadd e Datepart): https://www.youtube.com/watch?v=WYdZhR1V99Q

-- Documentação de referência do MySQL sobre (Funções de data e hora): https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html

------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação dos comandos EXTRACT, DATE_ADD, DATE_SUB e DATEDIFF com SQL.

------------------------------------------------------------------------------------------------------------------ #

-- Veja o exemplo abaixo:

-- Extraindo itens especificos de data.
-- Utiliamos DATE, TIMESTAMP, YEAR, MONTH e DAY.
SELECT
	 data_inicio
    ,DATE(data_inicio)
    ,TIMESTAMP(data_inicio)
    ,YEAR(data_inicio)
    ,MONTH(data_inicio)
    ,DAY(data_inicio)

FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Extraindo o mês da data.
-- Aqui utilizamos duas funções, a EXTRACT(MONTH FROM) e MONTH.
-- Notar que o SQL tem o padrão ANSI, ou seja, comandos globais da linguagem, mas os forncedores de banco de dados (Oracle, MySQL, SQL Server, entre outros) normalmente tem padrões especificos para seus bancos de Dados.
-- Por exemplo, no Oracle temos o PL/SQL, no SQL Server temos o T-SQL, e assim por diante.

SELECT
	 EXTRACT(MONTH FROM data_inicio) AS mes
	,MONTH(data_inicio) as mes_2
    ,duracao_segundos

FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Adicionando 10 dias a data de início.

SELECT
	 data_inicio
    ,DATE_ADD(data_inicio, INTERVAL 10 DAY) as data_inicio
    ,duracao_segundos

FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Retornando dados de 10 dias anteriores à data de início do aluguel da bike.

SELECT
	 data_inicio
    ,duracao_segundos

FROM dsa_module_six.tb_bikes

WHERE DATE_SUB("2012-03-31", INTERVAL 10 DAY) <= data_inicio

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Diferença entre a data inicio e a data fim.
-- Aqui vamos utilizar a data realmente e no exemplo abaixo vamos utilizar horas.
-- Notar que tem que haver a diferença de pelo menos 1 dia para que o campo (diff_data) retorne um resultado diferente de zero.

SELECT
	 DATE_FORMAT(data_inicio, "%d") AS data_inicio
	,DATE_FORMAT(data_fim, "%d") AS data_fim
    ,(DATE_FORMAT(data_fim, "%d") - DATE_FORMAT(data_inicio, "%d")) AS diff_data

FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Diferença entre a data inicio e a data fim.
-- Aqui vamos utilizar as horas.

SELECT
	 DATE_FORMAT(data_inicio, "%H") AS hora_inicio
	,DATE_FORMAT(data_fim, "%H") AS hora_fim
    ,(DATE_FORMAT(data_fim, "%H") - DATE_FORMAT(data_inicio, "%H")) AS diff_horas

FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #