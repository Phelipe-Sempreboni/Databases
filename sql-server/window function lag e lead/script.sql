------------------------------------------------------------------------------------------------------------------ #

-- Para saber mais sobre o LAG E LEAD, acesse o link da aula abaixo.

-- Youtube: PL SQL, ORACLE Para Iniciantes, aprendendo funções analíticas LAG e LEAD: https://www.youtube.com/watch?v=tQLrNvEbrig

-- Artigo de LEAG(): https://www.sqltutorial.org/sql-window-functions/sql-lag/

-- Artigo de LEAD(): https://www.sqltutorial.org/sql-window-functions/sql-lead/

------------------------------------------------------------------------------------------------------------------ #

-- Script para aplicação do comando LEAG e LEAD com SQL.

-- LAG: SQL LAG()é uma função de janela que fornece acesso a uma linha em um deslocamento físico especificado que vem antes da linha atual. 
-- LAG: Em outras palavras, usando a LAG()função, da linha atual, você pode acessar os dados da linha anterior, ou da segunda linha antes da linha atual, ou da terceira linha antes da linha atual e assim por diante.
-- LAG: A LAG()função pode ser muito útil para calcular a diferença entre a linha atual e a linha anterior.

-- LEAD: SQL LEAD()é uma função de janela que fornece acesso a uma linha em um deslocamento físico especificado que segue a linha atual.
-- LEAD: Por exemplo, usando a LEAD()função, da linha atual, você pode acessar os dados da próxima linha, ou a segunda linha que segue a linha atual, ou a terceira linha que segue a linha atual e assim por diante.
-- LEAD: A LEAD()função pode ser muito útil para calcular a diferença entre o valor da linha atual e o valor da linha seguinte.

------------------------------------------------------------------------------------------------------------------ #

-- Sintaxe abaixo para a função LEAG:
LAG(return_value [,offset[, default_value ]]) OVER (
    PARTITION BY expr1, expr2,...
	ORDER BY expr1 [ASC | DESC], expr2,...
);

-- Sintaxe abaixo para a função LEAD:
LEAD(return_value [,offset[, default ]]) OVER (
    PARTITION BY expr1, expr2,...
	ORDER BY expr1 [ASC | DESC], expr2,...
);

------------------------------------------------------------------------------------------------------------------ #

-- Veja o exemplo abaixo:

-- LAG E LEAD
-- Neste primeiro caso, quando utilizamos (LAG(duracao_segundos, 1)), quer dizer que vamos consultar somente uma linha anterior referente ao valor atual.
-- Neste primeiro caso, quando utilizamos (LEAD(duracao_segundos, 1)), quer dizer que vamos consultar somente uma linha posterior referente ao valor atual.
SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lag
    ,LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lead

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

------------------------------------------------------------------------------------------------------------------ #

-- LAG E LEAD
-- Neste primeiro caso, quando utilizamos (LAG(duracao_segundos, 2)), quer dizer que vamos consultar duas linhas anteriores referente ao valor atual.
-- Neste primeiro caso, quando utilizamos (LEAD(duracao_segundos, 2)), quer dizer que vamos consultar duas linhas posteriores referente ao valor atual.
SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lag
    ,LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS registro_lead

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

------------------------------------------------------------------------------------------------------------------ #

-- LAG E LEAD
-- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para o outro ?

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS diferenca

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

------------------------------------------------------------------------------------------------------------------ #

-- LAG E LEAD
-- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para o outro ?
-- Notar que aqui conseguimos retirar o valor (NULL) utilizando o segundo parâmetro (default_value) da função, onde aqui ele torna-se 0.
-- Realize testes para validar como a função funciona corretamente.

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,duracao_segundos - LAG(duracao_segundos, 1, duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS diferenca

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000;

------------------------------------------------------------------------------------------------------------------ #

-- LAG E LEAD
-- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para o outro ?
-- Outra maneira de resolver o valor (NULL) é como uma subquery, que realiza um filtro e retirar os valores nulos.
-- Sempre avalie a melhor alternativa para aplicar no seu cenário.
SELECT * FROM (

SELECT
	 estacao_inicio
    ,CAST(data_inicio AS date) AS data_inicio
    ,duracao_segundos
    ,duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS date)) AS diferenca

FROM dsa_module_six.tb_bikes

WHERE data_inicio < '2012-01-08'

AND numero_estacao_inicio = 31000

) AS tb_resultado

WHERE diferenca IS NOT NULL;

------------------------------------------------------------------------------------------------------------------ #