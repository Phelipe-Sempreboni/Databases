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

SELECT * 
,
	CASE
		WHEN tamanho_tumor = "10-14" THEN "Tumor de tamanho entre 10 à 14"
        WHEN tamanho_tumor = "15-19" THEN "Tumor de tamanho entre 15 à 19"
        WHEN tamanho_tumor = "20-24" THEN "Tumor de tamanho entre 20 à 24"
        WHEN tamanho_tumor = "25-29" THEN "Tumor de tamanho entre 25 à 29"
        WHEN tamanho_tumor = "30-34" THEN "Tumor de tamanho entre 30 à 34"
        WHEN tamanho_tumor = "35-39" THEN "Tumor de tamanho entre 35 à 39"

	END AS tamanho_tumor_cat

FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT *
,
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
        
	END AS tamanho_tumor_cat

FROM dsa_module_three.tb_dados;

---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x ---- x 

SELECT DISTINCT quadrante FROM dsa_module_three.tb_dados;

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