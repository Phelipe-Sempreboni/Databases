------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o RANK, acesse o link da aula abaixo.

-- Youtube: DIFERENÇAS ENTRE RANK, DENSE RANK E ROW NUMBER NO FIREBIRD 3.0: https://www.youtube.com/watch?v=v5Se6oYIA_s

-- Artigo de RANK(): https://www.sqltutorial.org/sql-window-functions/sql-rank/

------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação do comando RANK com SQL.

-- A RANK()função é uma função de janela que atribui uma classificação a cada linha na partição de um conjunto de resultados.

-- A classificação de uma linha é determinada por um mais o número de classificações que vêm antes dela.

------------------------------------------------------------------------------------------------------------------ #

-- Sintaxe abaixo:

RANK() OVER (
	PARTITION BY <expr1>[{,<expr2>...}]
	ORDER BY <expr1> [ASC|DESC], [{,<expr2>...}]
);

------------------------------------------------------------------------------------------------------------------ #

-- Veja o exemplo abaixo:

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

------------------------------------------------------------------------------------------------------------------ #

-- Exemplo unificado dos comandos de janela (ROW_NUMBER, DENSE_RANK e RANK).

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

------------------------------------------------------------------------------------------------------------------ #