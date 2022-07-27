---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT * FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT COUNT(*) FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT DISTINCT node_caps FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

# Binarização da variável classe (0/1)

SELECT * 
,
	CASE
		WHEN classe = "no-recurrence-events" THEN 0
		WHEN classe = "recurrence-events" THEN 1
	END AS classe_bin

FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

# Binarização da variável irradiano (0/1)

SELECT * 
,
	CASE
		WHEN irradiando = "no" THEN 0
		WHEN irradiando = "yes" THEN 1
	END AS irradiando_bin

FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT DISTINCT node_caps FROM dsa_module_three.tb_dados;

SELECT * FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

# Binarização da variável node_caps (0/1)

SELECT * 
,
	CASE
		WHEN node_caps = "no" THEN 0
		WHEN node_caps = "yes" THEN 1
        ELSE 2
	END AS node_caps_bin

FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT DISTINCT seio FROM dsa_module_three.tb_dados;

SELECT * FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT * 
,
	CASE
		WHEN seio = "left" THEN "E"
		WHEN seio = "right" THEN "D"
	END AS seio_cat

FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT DISTINCT tamanho_tumor FROM dsa_module_three.tb_dados ORDER BY tamanho_tumor;

SELECT * FROM dsa_module_three.tb_dados;

-- 10-14
-- 15-19
-- 20-24
-- 25-29
-- 30-34
-- 35-39

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 