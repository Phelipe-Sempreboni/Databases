-- Exericicios de sql do módulo 1 do curso de SQL Para Data Science.

-- 1. Quais embarcações possuem pontuação de risco igual a 310 ?
SELECT * FROM dsa_module_two.tb_navios WHERE pontuacao_risco = 310;

-- 2. Quais emabarcações têm classificaçã de risco A e índice de conformidade maior ou igual à 95% ?
SELECT * FROM dsa_module_two.tb_navios WHERE classificacao_risco = "A" AND indice_conformidade >= 95;

-- 3. Quaia embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual à 95% ?
SELECT * FROM dsa_module_two.tb_navios WHERE classificacao_risco = "C" OR classificacao_risco = "D" AND indice_conformidade <= 95;
SELECT * FROM dsa_module_two.tb_navios WHERE classificacao_risco IN ("C", "D") AND indice_conformidade <= 95;

-- 4. Quais embarcações têm classificação de risco A ou pontuação de risco igual à 0 ?
SELECT * FROM dsa_module_two.tb_navios WHERE classificacao_risco = "A" OR pontuacao_risco = 0;

-- 5. [DESAFIO] Quais embarcações foram inspecionadas em Dezembro de 2016 ?
SELECT * FROM dsa_module_two.tb_navios WHERE temporada LIKE '%Dezembro 2016%';