-- Script para verificar o nome da tabela e os indexes que a tabela possuí.

-- Script para retornar todas as colunas dessa relação.
SELECT 
           *
           
FROM DBA_TABLES T INNER JOIN DBA_INDEXES I ON T.TABLE_NAME = I.TABLE_NAME

WHERE I.TABLE_NAME = 'INSIRA AQUI SUA TABELA'

ORDER BY 1,2;

-- Script para retornar somente o nome da tabela e o index da tabela.
SELECT 
           I.TABLE_NAME, I.INDEX_NAME
           
FROM DBA_TABLES T INNER JOIN DBA_INDEXES I ON T.TABLE_NAME = I.TABLE_NAME

WHERE I.TABLE_NAME = 'INSIRA AQUI SUA TABELA'

ORDER BY 1,2;