------------------------------------------------------------------------------------------------------------------------------ #

-- 1 - Quem são os técnicos (coaches) eatletas das equipes de Handball?

-- Execute a query abaixo para ter o retorno da questão:

SELECT
	 A.name AS nome_atleta
    ,A.noc AS noc_atleta
    ,A.discipline AS discipline_atleta
    ,B.name AS name_coach
    ,B.noc AS noc_coach
    ,B.discipline AS discipline_coach
    ,B.event AS event_coach
    
FROM dsa_module_four.tb_athletes AS A
LEFT JOIN dsa_module_four.tb_coaches AS B
ON TRIM(UPPER(A.noc)) = TRIM(UPPER(B.noc))
AND TRIM(UPPER(A.discipline)) = TRIM(UPPER(B.discipline))

WHERE A.discipline = 'Handball' AND B.discipline = 'Handball'

ORDER BY B.name;

------------------------------------------------------------------------------------------------------------------------------ #

-- Isso não pode ser feito, visto que a tabela (tb_medals) agrupa os valores e não estão com uma granularidade menor com mais detalhes para a análise.



------------------------------------------------------------------------------------------------------------------------------ #