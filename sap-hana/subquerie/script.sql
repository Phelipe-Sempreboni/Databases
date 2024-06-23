--------------------------------------------------------------------------------------------------------------------------------------- #

-- Número de vendas por ano, por funcionário e número total de vendas em todos os anos.

-- NEste caso temos uma subquerie para formar o campo (numero_vendas_geral) que conta a quantidade do número de vendas.

-- Notar que também é possível usar um comando OVER() para chegar ao mesmo resultado, onde pode melhorar a performance da query e do banco de dados.

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

--------------------------------------------------------------------------------------------------------------------------------------- #