------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # 

SELECT * FROM dsa_module_three.tb_dados2;

------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # 

SELECT DISTINCT MENOPAUSA FROM dsa_module_three.tb_dados2;

SELECT DISTINCT DEG_MALIG FROM dsa_module_three.tb_dados2;

------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # 

SELECT 
	 *
	,
	 CASE
	 WHEN menopausa = 'ge40' THEN 1
     WHEN menopausa = 'lt40' THEN 2
     WHEN menopausa = 'premeno' THEN 3
     END AS MENOPAUSA_LABEL

FROM dsa_module_three.tb_dados2;

------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # 

SELECT 
	 CLASSE
	,IDADE
    ,MENOPAUSA
	,TAMANHO_TUMOR
    ,INV_NODES
    ,NODE_CAPS
    ,DEG_MALIG
    ,SEIO
    ,QUADRANTE
    ,IRRADIANDO
	,CONCAT(INV_NODES, QUADRANTE) AS posicao_tumor
	,
	CASE
	WHEN menopausa = 'ge40' THEN 1
	WHEN menopausa = 'lt40' THEN 2
	WHEN menopausa = 'premeno' THEN 3
	END AS menopausa_label

FROM dsa_module_three.tb_dados2;

------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # 

SELECT 
	 CLASSE
	,IDADE
    ,MENOPAUSA
	,TAMANHO_TUMOR
    ,INV_NODES
    ,NODE_CAPS
    ,DEG_MALIG
    ,SEIO
    ,QUADRANTE
    ,IRRADIANDO
	,CONCAT(INV_NODES, '-' ,QUADRANTE) AS POSICAO_TUMOR
	,
	CASE
	WHEN menopausa = 'ge40' THEN 1
	WHEN menopausa = 'lt40' THEN 2
	WHEN menopausa = 'premeno' THEN 3
	END AS MENOPAUSA_LABEL
    ,
    CASE
    WHEN DEG_MALIG = 1 THEN 1 ELSE DEG_MALIG = 0 END AS DEG_MALIG_LABEL_1
    ,
    CASE
    WHEN DEG_MALIG = 2 THEN 2 ELSE DEG_MALIG = 0 END AS DEG_MALIG_LABEL_2
    ,
    CASE
    WHEN DEG_MALIG = 3 THEN 3 ELSE DEG_MALIG = 0 END AS DEG_MALIG_LABEL_3

FROM dsa_module_three.tb_dados2;

------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # ------- # 