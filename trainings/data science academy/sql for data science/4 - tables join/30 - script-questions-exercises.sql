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

-- Também é possível resolver com as querys abaixo, de uma maneira bem simples.
SELECT name FROM exec3.TB_COACHES WHERE discipline = 'Handball';
SELECT name FROM exec3.TB_ATLETAS WHERE discipline = 'Handball';

------------------------------------------------------------------------------------------------------------------------------ #

-- 2 - Quem são os técnicos (coaches) dos atletas da Austrália que receberam medalhas de Ouro?
-- Até podemos tentar chegar em um resultado, mas ainda não está correto
-- Não pode ser respondido
SELECT A.name, B.gold
FROM dsa_module_four.tb_coaches AS A, dsa_module_four.tb_medals AS B
WHERE A.noc = B.team_noc
AND A.noc = 'Australia'
AND gold > 0
ORDER BY gold DESC;

------------------------------------------------------------------------------------------------------------------------------ #

-- 3 - Quais países tiveram mulheres conquistando medalhas de Ouro?
-- Não pode ser respondido

------------------------------------------------------------------------------------------------------------------------------ #

-- 4 - Quais atletas da Noruega receberam medalhas de Ouro ou Prata?
-- Até podemos tentar chegar em um resultado, mas ainda não está correto
-- Não pode ser respondido
SELECT A.noc, gold, silver 
FROM exec3.TB_ATLETAS A, exec3.TB_MEDALS B
WHERE A.noc = B.noc
AND a.noc = 'Norway'

------------------------------------------------------------------------------------------------------------------------------ #

-- 5 - Quais atletas Brasileiros não receberam medalhas?
-- Não pode ser respondido

------------------------------------------------------------------------------------------------------------------------------ #
