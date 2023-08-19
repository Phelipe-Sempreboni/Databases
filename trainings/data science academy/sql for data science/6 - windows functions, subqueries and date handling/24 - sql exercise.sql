------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 1-Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?

SELECT DISTINCT
     tipo_membro
	,AVG(duracao_segundos) OVER (PARTITION BY tipo_membro) AS media_aluguel_tip_membro
    
FROM dsa_module_six.tb_bikes;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 2-Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e por estação fim (onde as bikes são entregues após o aluguel)?

SELECT DISTINCT
     tipo_membro
	,estacao_fim
	,AVG(duracao_segundos) OVER (PARTITION BY tipo_membro, estacao_fim) AS media_aluguel_tip_membro
    
FROM dsa_module_six.tb_bikes;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 3-Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e por estação fim (onde as bikes são entregues após o aluguel) ao longo do tempo?

SELECT
     tipo_membro
	,estacao_fim
    ,data_fim
	,AVG(duracao_segundos) OVER (PARTITION BY tipo_membro, estacao_fim ORDER BY data_fim) AS media_aluguel_tip_membro
    
FROM dsa_module_six.tb_bikes;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 4-Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de aluguéis considerando a data de início?

SELECT
	 numero_bike
    ,CONCAT(HOUR(data_inicio), 'h') as hora_inicio
    ,COUNT(*) AS qtd_alugueis
	,DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) as rank_qtd_alugueis
    
FROM dsa_module_six.tb_bikes

WHERE numero_bike = 'W01182'

GROUP BY
	 numero_bike
    ,HOUR(data_inicio);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 5-Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a data de início?

SELECT
	 numero_bike
    ,data_inicio
    ,COUNT(*) OVER (ORDER BY data_inicio) as qtd_alugueis

FROM dsa_module_six.tb_bikes

WHERE numero_bike = 'W01182';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 6-Retornar:
-- Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos.
-- Número de aluguéis de bikes (independente da estação) ao longo do tempo.
-- Somente os registros quando a data fim foi no mês de Abril.

SELECT
	 numero_bike
	,estacao_fim
    ,data_fim
    ,duracao_segundos

FROM dsa_module_six.tb_bikes;

SELECT
	 numero_bike
	,estacao_fim
    ,data_fim
    ,duracao_segundos
	,COUNT(*) OVER (ORDER BY data_fim) AS qtd_alugueis
    
FROM dsa_module_six.tb_bikes;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 7-Retornar:
-- Estação fim, data fim e duração em segundos do aluguel.
-- A data fim deve ser retornada no formato: 01/January/2012 00:00:00.
-- Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo.
-- Retornar os dados para os aluguéis entre 7 e 11 da manhã.



------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 8-Qual a diferença da duração do aluguel de bikesao longo do tempo, de um registro para outro, considerando data de início do aluguel e estação de início?
-- A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana abreviado e Jan igual mês abreviado). Retornar os dados para os aluguéis entre 01 e 03 da manhã.



------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 9-Retornar:
-- Estação fim, data fim e duração em segundos do aluguel.
-- A data fim deve ser retornada no formato: 01/January/2012 00:00:00.
-- Queremos os registros divididos em 4 grupos ao longo do tempo por partição.
-- Retornar os dados para os aluguéis entre 8 e 10 da manhã.
-- Qual critério usado pela função NTILE para dividir os grupos ?.



------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 10-Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do tempo considerando a data fim e estação fim?
-- Retorne os dados entre os dias '2012-04-01' e '2012-04-02.
-- Dica: Use função window e subquery.



------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #
