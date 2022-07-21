------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x 

SELECT * FROM dsa_module_two.tb_navios;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT nome_navio FROM dsa_module_two.tb_navios;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT nome_navio, temporada FROM dsa_module_two.tb_navios WHERE classificacao_risco = 'D';

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT COUNT(*) FROM dsa_module_two.tb_navios WHERE classificacao_risco = 'D';

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT
	 nome_navio
    ,classificacao_risco
    ,pontuacao_risco

FROM dsa_module_two.tb_navios 

WHERE classificacao_risco = 'D' AND pontuacao_risco > 1000

ORDER BY nome_navio;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT
	 nome_navio
    ,classificacao_risco
    ,pontuacao_risco

FROM dsa_module_two.tb_navios 

WHERE classificacao_risco = 'D' OR pontuacao_risco > 3000

ORDER BY nome_navio;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT
	 nome_navio
    ,classificacao_risco
    ,pontuacao_risco

FROM dsa_module_two.tb_navios 

WHERE classificacao_risco = 'E' AND pontuacao_risco > 3000

ORDER BY nome_navio;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT
	 nome_navio
    ,classificacao_risco
    ,indice_conformidade
    ,temporada

FROM dsa_module_two.tb_navios 

WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 98

ORDER BY nome_navio;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x

SELECT
	 nome_navio
    ,classificacao_risco
    ,indice_conformidade
    ,temporada

FROM dsa_module_two.tb_navios 

WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 90

ORDER BY 
	indice_conformidade ASC
    
LIMIT 10;

------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x ------- x