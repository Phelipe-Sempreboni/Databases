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

-- Total de vendas por ano fiscal, funcionário e total de vendas particionado pelo ano fiscal.

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER (PARTITION BY ano_fiscal) AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas por ano fiscal, funcionário e total de vendas particionado pelo funcionário.

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER (PARTITION BY nome_funcionario) AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #

-- Total de vendas por ano fiscal, funcionário e total de vendas geral dos anos.

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER () AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #

-- Número de vendas por ano, por funcionário e número total de vendas em todos os anos.

SELECT
	 ano_fiscal
	,nome_funcionario
	,COUNT(*) AS numero_vendas_ano
    ,COUNT(*) OVER () numero_vendas_geral
    
FROM dsa_module_six.tb_vendas

GROUP BY
	 ano_fiscal
	,nome_funcionario

ORDER BY ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #

-- Número de vendas por ano, por funcionário e número total de vendas em todos os anos.

-- Este é o mesmo cenário logo acima, porém escrito como uma subquerie

SELECT
	 ano_fiscal
	,nome_funcionario
	,COUNT(*) AS numero_vendas_ano
    ,(SELECT COUNT(*) FROM dsa_module_six.tb_vendas) AS numero_vendas_geral

FROM dsa_module_six.tb_vendas

GROUP BY
	 ano_fiscal
	,nome_funcionario

ORDER BY ano_fiscal
;

------------------------------------------------------------------------------------------------------------------------ #
