# -------------------------------------------------------------------------------------------------------------------------------------- #

-- Você pode ordenar uma base pelo nome da coluna ou pelo número da coluna.

-- Em alguns casos que você não souber o nome da coluna e ela não aparecer de forma explicia no SGDBD, você pode fazer a ordenação pelo número.

-- Veja exemplos abaixo de como realizar essa operação.

# -------------------------------------------------------------------------------------------------------------------------------------- #

-- Nesse exemplo utilizamos o nome da coluna (location e date), onde a tabela será organizada com essa duas colunas.

-- Notar que neste caso utilizamos o nome das colunas.

SELECT * FROM dsa_module_seven.covid_mortes ORDER BY location, date;

# -------------------------------------------------------------------------------------------------------------------------------------- #

-- Nesse exemplo utilizamos o número da coluna (3 e 4) que são as colunas (location e date), onde a tabela será organizada com essa duas colunas.

-- Notar que neste caso utilizamos o número das colunas.


SELECT * FROM dsa_module_seven.covid_mortes ORDER BY 3, 4;

# -------------------------------------------------------------------------------------------------------------------------------------- #


