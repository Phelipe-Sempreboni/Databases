--------------------------------------------------------------------------------------------------------------------------------------- #

-- Veja abaixo como utilizar o comando OVER(), onde esse é um comando extremamente útil.

-- Notar que em muitos casos podemos utilizar esse comando no lugar de uma subquerie, que muitas vezes pode causar problemas de performance.

-- Muitas vezes o comando OVER() faz a mesma função de uma subquerie, porém a subquerie pode ter problemas de performance dependendo do volume de dados, quantidade de colunas, entre outros.

-- Com o comando OVER() temos somente uma querie, e com subquerie temos mais de uma querie, logo exige mais processamento do banco de dados, assim causando problemas de performance.

--------------------------------------------------------------------------------------------------------------------------------------- #

-- Total de vendas por ano fiscal, funcionário e total de vendas geral dos anos.

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER () AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

--------------------------------------------------------------------------------------------------------------------------------------- #

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

--------------------------------------------------------------------------------------------------------------------------------------- #

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

--------------------------------------------------------------------------------------------------------------------------------------- #
