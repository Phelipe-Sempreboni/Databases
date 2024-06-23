--------------------------------------------------------------------------------------------------------------------------------------- #

-- Veja abaixo como utilizar o comando OVER (PARTITION BY), onde esse é um comando extremamente útil.

-- Notar que em muitos casos podemos utilizar esse comando no lugar de uma subquerie, que muitas vezes pode causar problemas de performance.

-- Muitas vezes o comando OVER (PARTITION BY) faz a mesma função de uma subquerie, porém a subquerie pode ter problemas de performance dependendo do volume de dados, quantidade de colunas, entre outros.

-- Com o comando OVER (PARTITION BY) temos somente uma querie, e com subquerie temos mais de uma querie, logo exige mais processamento do banco de dados, assim causando problemas de performance.

--------------------------------------------------------------------------------------------------------------------------------------- #

-- Total de vendas por ano fiscal, funcionário e total de vendas particionado pelo ano fiscal.

-- Notar que neste caso o OVER (PARTITION BY) é realizado pelo campo (ano_fiscal).

-- Quando realizamos esse comando pelo (ano_fiscal) haverá a soma total por ano, onde será criado uma nova coluna e esses valores serão calculados.

-- Isso pode ser útil, por exemplo, para uma comparação visual de valores e performance, ou até como um campo auxiliar para cálculo de porcetagem ou outras ações.

-- Notar que quando utilizamos esse comando, não é necessário utilizar um GROUP BY, visto que o comando em si já basta.

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER (PARTITION BY ano_fiscal) AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

--------------------------------------------------------------------------------------------------------------------------------------- #

-- Total de vendas por ano fiscal, funcionário e total de vendas particionado pelo funcionário.

-- Aqui em vez de utilizarmos o campo (ano_fiscal) utilizamos o campo (nome_funcionario), mas o conceito é o mesmo.

SELECT
	 ano_fiscal
	,nome_funcionario
    ,valor_venda
    ,SUM(valor_venda) OVER (PARTITION BY nome_funcionario) AS total_vendas_ano
    
FROM dsa_module_six.tb_vendas

ORDER BY ano_fiscal
;

--------------------------------------------------------------------------------------------------------------------------------------- #
