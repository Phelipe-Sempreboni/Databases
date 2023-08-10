# ----------------------------------------------------------------------------------------------------------------- #

-- Query normal.
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

# ----------------------------------------------------------------------------------------------------------------- #

-- Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo.
-- Filtrar para a estação de id 31000.
-- Aqui é utilizado o DENSE_RANK(), que faz uma classificação dos dados. Só faz sentido usar essa função ao longo do tempo.

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
	,DENSE_RANK() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo.
-- Filtrar para a estação de id 31000.
-- Aqui é utilizado o RANK(), que faz uma classificação dos dadosm mas diferente do DENSE_RANK(). Só faz sentido usar essa função ao longo do tempo.
-- Nesse caso ele pula a posição, por exemplo, se tiver a posição 2 repetido por duas vezes, ficará, (1, 2, 2, 4), pois o comando entende que mesmo que seja uma posição 2 repetida, a ocupação ainda é pela posição 3.
-- DENSE_RANK: Classifica sem pular posições.
-- RANK: Classifica pulando posições.

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
	,RANK() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo.
-- Filtrar para a estação de id 31000.
-- Query com todos os comandos unificados.

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis_rn
    ,DENSE_RANK() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis_dr
	,RANK() OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS numero_alugueis_r

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

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

# ----------------------------------------------------------------------------------------------------------------- #

-- LAG E LEAD
-- Neste primeiro caso, quando utilizamos (LAG(duracao_segundos, 1)), quer dizer que vamos consultar somente uma linha anterior referente ao valor atual.
-- Neste primeiro caso, quando utilizamos (LEAD(duracao_segundos, 1)), quer dizer que vamos consultar somente uma linha posterior referente ao valor atual.
SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lag
    ,LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lead

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- LAG E LEAD
-- Neste primeiro caso, quando utilizamos (LAG(duracao_segundos, 2)), quer dizer que vamos consultar duas linhas anteriores referente ao valor atual.
-- Neste primeiro caso, quando utilizamos (LEAD(duracao_segundos, 2)), quer dizer que vamos consultar duas linhas posteriores referente ao valor atual.
SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lag
    ,LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lead

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- LAG E LEAD
-- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para o outro ?

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS diferenca

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- LAG E LEAD
-- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para o outro ?
-- Notar que aqui conseguimos retirar o valor (NULL) utilizando o segundo parâmetro (default_value) da função, onde aqui ele torna-se 0.
-- Realize testes para validar como a função funciona corretamente.

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,duracao_segundos - LAG(duracao_segundos, 1, duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS diferenca

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

# ----------------------------------------------------------------------------------------------------------------- #

-- LAG E LEAD
-- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para o outro ?
-- Outra maneira de resolver o valor (NULL) é como uma subquery, que realiza um filtro e retirar os valores nulos.
-- Sempre avalie a melhor alternativa para aplicar no seu cenário.
SELECT * FROM (

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS diferenca

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000

) AS tb_resultado

WHERE diferenca IS NOT NULL;

# ----------------------------------------------------------------------------------------------------------------- #

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
