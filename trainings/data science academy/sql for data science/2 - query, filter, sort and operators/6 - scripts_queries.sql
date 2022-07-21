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