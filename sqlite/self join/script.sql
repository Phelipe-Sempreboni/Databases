------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o SELF JOIN, acesse o link da aula abaixo.

-- Youtube: Ligando uma tabela a ela mesma (Self Join) - Curso de SQL - Aula 32: https://www.youtube.com/watch?v=SKGiv_xLdVw

------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação de um relacionamento na própria tabela, ou seja, um SELF JOIN.

-- O SELF JOIN aplica recursividade, ou seja, o relacionamento de uma tabela com ela mesma. A recursividade é utilizado na programação de computadores.

-- Veja o exemplo abaixo:

-- Retornar clientes que sejam da mesma cidade.
-- Aqui colocamos o comando de diferente (<>), pois caso colocassemos o comando de igual (=), iria retornar todos os registros dos clientes, visto que é a mesma tabela, logo tem a mesma quantidade de registros, clientes e identificadores dos clientes.
-- Colocando o comando de diferente (<>) no identificador e o comando de (=) na cidade, queremos dizer que precisamos dos clientes diferentes entre si, mas que estão na mesma cidade.
SELECT
	 A.nome_cliente
    ,A.cidade_cliente

FROM dsa_module_four.tb_clientes AS A
	,dsa_module_four.tb_clientes AS B

WHERE A.id_cliente <> B.id_cliente
AND A.cidade_cliente = B.cidade_cliente;

-- Você deve estar se perguntando do porquê não podemos utilizar a query abaixo para expressar (aparentemente) o mesmo resultado ?
-- Simples, aqui você já sabe o que procurar e o filtro a se utilizar.
-- Caso você esteja fazendo um discovery (descoberta) ou precise dessa informação, mas não sabe o que procura ou o filtro, o SELF JOIN pode ser uma boa alternativa.
SELECT A.nome_cliente, A.cidade_cliente FROM dsa_module_four.tb_clientes AS A WHERE A.cidade_cliente = 'Campos';

------------------------------------------------------------------------------------------------------------------ #