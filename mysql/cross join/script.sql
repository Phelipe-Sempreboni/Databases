------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o CROSS JOIN, acesse o link da aula abaixo.

-- Youtube: Cross Join: https://www.youtube.com/watch?v=rLB2580b3g8

------------------------------------------------------------------------------------------------------------------ #

-- Antes de tudo, quais casos, por exemplo, podemos utilizar um CROSS JOIN ?

-- Quando tivermos tabelas com grande volume de dados, em vez de realizar um filtro (WHERE), as vezes é melhor realiar um CROSS JOIN, retornar todos os dados e aplicar o filtro na sua aplicação, principalmente se o filtro tiver muitas cláusulas ou cláusulas complexas.

------------------------------------------------------------------------------------------------------------------ #

-- O CROSS JOIN retorna todos os dados, de todas as tabelas na query aplicada com esse comando.

-- No exemplo abaixo, que dizer que para cada registro de uma tabela, nesse caso a (tb_clientes), retorne todos os registros da outra tabela, nesse caso a (tb_pedidos).

-- Caso você execute essa query, você vai notar que para cada nome de cliente, será retornado um pedido. Daí vem a pergunta, mas um cliente fez todos esses pedidos ? A resposta é NÃO.

-- Se a resposta é NÃO, nota-se que o CROSS JOIN retorna todos os dados de ambas as tabelas.

-- Notar que um CROSS JOIN quase nunca é o resultado final de trabalho de uma query, normalmente será um resultado intermediário, que levará a outra query ou análise de dados para um resultado final.

SELECT
	 A.nome_cliente
    ,B.id_pedido
    
FROM dsa_module_four.tb_clientes AS A
CROSS JOIN dsa_module_four.tb_pedidos AS B;

-- Outra maneira de simular um CROSS JOIN e não precisar usar a sua sintaxe, é a maneira abaixo, realizando somente um (SELECT * FROM) entre as duas tabelas.

SELECT
	 A.nome_cliente
    ,B.id_pedido
    
FROM dsa_module_four.tb_clientes AS A, dsa_module_four.tb_pedidos AS B;

------------------------------------------------------------------------------------------------------------------ #

-- CROOS JOIN para listar os dados de todas as combinações possíveis de empregados com departamentos.

-- Notar que aqui não temos um relacionamento, mas sim uma possível combinação.

-- Nesse caso temos 7 registros na tabela (Empregado), e temos 6 registros na tabela (Departamento), onde ocorrerá o retorno de todos os registros, resultando em 42 resultados possíveis.

-- Por exemplo, aqui podemos simular uma tabela onde cada colaborador presta serviço a 6 áreas diferentes da empresa.

SELECT *

FROM Empregado
CROSS JOIN Departamento;

-- Outra maneira de simular um CROSS JOIN e não precisar usar a sua sintaxe, é a maneira abaixo, realizando somente um (SELECT * FROM) entre as duas tabelas.

SELECT *

FROM Empregado, Departamento;

------------------------------------------------------------------------------------------------------------------ #