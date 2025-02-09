------------------------------------------------------------------------------------------------------------- #

-- Script 01

------------------------------------------------------------------------------------------------------------- #

-- Cria a tabela
CREATE TABLE dsa_module_eight.tb_incidentes (
  `PdId` bigint DEFAULT NULL,
  `IncidntNum` text,
  `Incident Code` text,
  `Category` text,
  `Descript` text,
  `DayOfWeek` text,
  `Date` text,
  `Time` text,
  `PdDistrict` text,
  `Resolution` text,
  `Address` text,
  `X` double DEFAULT NULL,
  `Y` double DEFAULT NULL,
  `location` text,
  `SF Find Neighborhoods 2 2` text,
  `Current Police Districts 2 2` text,
  `Current Supervisor Districts 2 2` text,
  `Analysis Neighborhoods 2 2` text,
  `DELETE - Fire Prevention Districts 2 2` text,
  `DELETE - Police Districts 2 2` text,
  `DELETE - Supervisor Districts 2 2` text,
  `DELETE - Zip Codes 2 2` text,
  `DELETE - Neighborhoods 2 2` text,
  `DELETE - 2017 Fix It Zones 2 2` text,
  `Civic Center Harm Reduction Project Boundary 2 2` text,
  `Fix It Zones as of 2017-11-06  2 2` text,
  `DELETE - HSOC Zones 2 2` text,
  `Fix It Zones as of 2018-02-07 2 2` text,
  `CBD, BID and GBD Boundaries as of 2017 2 2` text,
  `Areas of Vulnerability, 2016 2 2` text,
  `Central Market/Tenderloin Boundary 2 2` text,
  `Central Market/Tenderloin Boundary Polygon - Updated 2 2` text,
  `HSOC Zones as of 2018-06-05 2 2` text,
  `OWED Public Spaces 2 2` text,
  `Neighborhoods 2` text
);

------------------------------------------------------------------------------------------------------------- #

-- Carregue o dataset1.csv via MySQL Workbench

------------------------------------------------------------------------------------------------------------- #

-- Tratamento de valor ausente

SELECT * 
FROM dsa_module_eight.tb_incidentes;

SELECT DISTINCT Resolution
FROM dsa_module_eight.tb_incidentes;

SELECT Resolution, COUNT(*) AS total
FROM dsa_module_eight.tb_incidentes
GROUP BY Resolution;

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes
WHERE Resolution IS NULL;

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes
WHERE Resolution = ' ';

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes
WHERE Resolution = '';

------------------------------------------------------------------------------------------------------------- #

-- Null é o tipo unknown no banco de dados e empty (vazio) é o nulo em uma coluna do tipo string.
-- empty também é chamado de blank.

-- A principal diferença entre nulo e vazio é que o nulo é usado para se referir a nada, enquanto o vazio é usado para
-- se referir a uma string única com comprimento zero.

------------------------------------------------------------------------------------------------------------- #

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes
WHERE Resolution = '';

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes
WHERE NULLIF(Resolution, '') IS NULL;

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes
WHERE TRIM(COALESCE(Resolution, '')) = '';

SELECT COUNT(*) 
FROM dsa_module_eight.tb_incidentes 
WHERE LENGTH(RTRIM(LTRIM(Resolution))) = 0;

SELECT ISNULL(NULLIF(Resolution,''))  
FROM dsa_module_eight.tb_incidentes;

SELECT 
    CASE 
     WHEN Resolution = '' THEN 'OTHER'
     ELSE Resolution
    END AS Resolution
FROM dsa_module_eight.tb_incidentes;

SET SQL_SAFE_UPDATES = 0;

UPDATE dsa_module_eight.tb_incidentes
SET Resolution = 'OTHER'
WHERE Resolution = '';

SET SQL_SAFE_UPDATES = 1;

------------------------------------------------------------------------------------------------------------- #
