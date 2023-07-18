------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas

SELECT
	SUM(valor_venda)
FROM dsa_module_six.tb_vendas;

------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas por ano fiscal

SELECT
	 ano_fiscal
    ,SUM(valor_venda)
    
FROM dsa_module_six.tb_vendas

GROUP BY
	ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas por funcionário

SELECT
	 nome_funcionario
    ,SUM(valor_venda)
    
FROM dsa_module_six.tb_vendas

GROUP BY
	nome_funcionario
;

------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas por ano fiscal e funcionário

SELECT
	 ano_fiscal
	,nome_funcionario
    ,SUM(valor_venda)
    
FROM dsa_module_six.tb_vendas

GROUP BY
	 ano_fiscal
    ,nome_funcionario
;

------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas por ano fiscal e funcionário

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER (PARTITION BY ano_fiscal) AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #



------------------------------------------------------------------------------------------------------------------------ #




------------------------------------------------------------------------------------------------------------------------ #



------------------------------------------------------------------------------------------------------------------------ #