------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação do comando WINDOW com SQL.

------------------------------------------------------------------------------------------------------------------ #

-- Com a função (WINDOW), é como se estivessemos realizando o particionamento encima de outro particionamento.
-- É como se estivessemos abrindo uma janela a partir de outra janela.
-- É como o comando (WITH), conseguimos realizar ações em uma tabela por um novo comando SQL.
-- Esses casos são mais atipicos, mas é importante saber da existência dessa função.

SELECT
	 estacao_inicio
	,CAST(data_inicio AS DATE) AS data_inicio
    ,duracao_segundos
    ,ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_alugueis
    ,NTILE(2) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_2
    ,NTILE(4) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_4
    ,NTILE(5) OVER (PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_5
	
FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000

WINDOW ntile_window AS (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE))

ORDER BY estacao_inicio;

------------------------------------------------------------------------------------------------------------------ #