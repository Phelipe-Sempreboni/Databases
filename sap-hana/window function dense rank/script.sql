------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o DENSE RANK, acesse o link da aula abaixo.

-- Youtube: DIFERENÇAS ENTRE RANK, DENSE RANK E ROW NUMBER NO FIREBIRD 3.0: https://www.youtube.com/watch?v=v5Se6oYIA_s

-- Artigo de DENSE_RANK(): https://www.sqltutorial.org/sql-window-functions/sql-dense_rank/ 

------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação do comando DENSE_RANK com SQL.

-- A DENSE_RANK()é uma função de janela que atribui classificações a linhas em partições sem lacunas nos valores de classificação.

-- Se duas ou mais linhas em cada partição tiverem os mesmos valores, elas receberão a mesma classificação. A próxima linha tem a classificação aumentada em um.

-- Diferente da RANK()função, a DENSE_RANK()função sempre gera valores de rank consecutivos.

------------------------------------------------------------------------------------------------------------------ #

-- Sintaxe abaixo:

DENSE_RANK() OVER (
	PARTITION BY expr1[{,expr2...}]
	ORDER BY expr1 [ASC|DESC], [{,expr2...}]
);
------------------------------------------------------------------------------------------------------------------ #

-- Veja o exemplo abaixo:

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