# ----------------------------------------------------------------------------------------------------------------- #

-- QUery normal.
SELECT * FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Duração total do aluguel das bikes em horas.
SELECT
	SUM(duracao_segundos/60/60) AS duracao_total_horas
FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Duração total do aluguel das bikes em horas e ao longo do tempo (soma acumulada).
-- Inserindo a (data_inicio) fica mais claro o que o comando SQL está fazendo.
-- Cada vez que se passa um dia, e nesse caso mais especifico minutos, você vai notar que que é realizado uma soma do resultado da data e minuto anterior com a data e minuto da próxima linha.
-- Dessa maneira, nota-se que é sempre uma soma acumulada com o dia, e sendo mais especifico, com o minuto anterior.
SELECT
	 duracao_segundos
	,SUM(duracao_segundos/60/60) OVER (ORDER BY data_inicio) AS duracao_total_horas
    ,data_inicio
FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Se executarmos essa query, você irá notar que o resultado é TOTALMENTE diferente.
-- Notar que estamos querendo calcular o aluguem das bikes em horas e AO LONGO DO TEMPO.
-- Garanta sempre que cálculos ao longo do tempo utilizem um campo de tempo, por exemplo, data, horas, minutos, entre outros.
-- No nosso caso o campo de tempo é a (data_inicio).
SELECT
	 duracao_segundos
	,SUM(duracao_segundos/60/60) OVER () AS duracao_total_horas
FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Duração total do aluguel das bikes em horas e ao longo do tempo (soma acumulada), por estação de inicio do aluguel da bike.
-- Realize um filtro para a data de inicio for inferior a 2012-01-08'.
-- Notar que você pode utilizar ambos os filtros abaixo, tanto o não comentado quanto o comentado, que chegará no mesmo resultado.
SELECT
	 duracao_segundos
	,estacao_inicio
	,SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS duracao_total_horas
    ,data_inicio
FROM dsa_module_six.tb_bikes
WHERE data_inicio < '2012-01-08';
-- WHERE SUBSTRING(data_inicio, 1, 10) < '2012-01-08';

# ----------------------------------------------------------------------------------------------------------------- #

-- Qual a média de tempo (em horas) de aluguel de bike da estação de início 31017 ?

SELECT
	 estacao_inicio
	,AVG(duracao_segundos/60/60) AS media_tempo_aluguel
    
FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = '31017'

ORDER BY
	estacao_inicio;
    
# ----------------------------------------------------------------------------------------------------------------- #

-- Qual a média de tempo (em horas) de aluguel de bike da estação de início 31017, ao longo do tempo (média móvel) ?

SELECT
	 estacao_inicio
	,AVG(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS media_tempo_aluguel
    
FROM dsa_module_six.tb_bikes

WHERE numero_estacao_inicio = '31017';
;

# ----------------------------------------------------------------------------------------------------------------- #

-- Qual a média de tempo (em horas) de aluguel de bike de todas as estações, ao longo do tempo (média móvel) ?

SELECT
	 estacao_inicio
	,AVG(duracao_segundos/60/60) OVER (ORDER BY data_inicio) AS media_tempo_aluguel
    
FROM dsa_module_six.tb_bikes
;

# ----------------------------------------------------------------------------------------------------------------- #

-- Estação de início, data de início e duração de cada aluguel de bike em segundos.
SELECT
	 estacao_inicio
	,data_inicio
	,duracao_segundos
    
FROM dsa_module_six.tb_bikes

ORDER BY duracao_segundos;

# ----------------------------------------------------------------------------------------------------------------- #

-- Duração total de aluguel das bikes ao longo do tempo por estação de início.
SELECT
	 data_inicio
	,SUM(duracao_segundos) OVER (ORDER BY data_inicio) as duracao_total
    
FROM dsa_module_six.tb_bikes;

SELECT
	 data_inicio
	,SUM(duracao_segundos) OVER () as duracao_total
    
FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Duração média do aluguel de bikes ao longo do tempo por estação de início.

SELECT
	 data_inicio
	,AVG(duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) as duracao_total
    
FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Número de aluguéis de bikes por estação ao longo do tempo.

SELECT
	 data_inicio
	,COUNT(*) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) as duracao_total
    
FROM dsa_module_six.tb_bikes;

# ----------------------------------------------------------------------------------------------------------------- #

-- Somente os registros quando a data de início for inferior a '2012-01-08'.

SELECT *
    
FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08';

# ----------------------------------------------------------------------------------------------------------------- #

-- Query totalmente unificada.
SELECT
	 estacao_inicio
    ,data_inicio
    ,duracao_segundos
	,SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS tempo_total
	,AVG(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS media_tempo_total
	,COUNT(duracao_segundos/60/60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08';

# ----------------------------------------------------------------------------------------------------------------- #

-- Estação de início, data de início de cada aluguel de bike e duração de cada aluguel em segundos.
-- Número de aluguéis de bikes (independente da estação) ao longo do tempo.
-- Somente os registros quando a data de início for inferior a '2012-01-08'.

-- Solutação 1:
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

# ----------------------------------------------------------------------------------------------------------------- #

-- E se quisessemos o mesmo resultado anterior, mas a contagem por estação ?

SELECT
	 estacao_inicio
    ,data_inicio
    ,duracao_segundos
	,ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08';

# ----------------------------------------------------------------------------------------------------------------- #
