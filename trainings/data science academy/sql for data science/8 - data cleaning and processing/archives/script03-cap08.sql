 ------------------------------------------------------------------------------------------------------------- #
 
 -- Script 03

 ------------------------------------------------------------------------------------------------------------- #

 -- Cria a tabela
CREATE TABLE dsa_module_eight.tb_incidentes_dup (
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

 -- Carregue o dataset2.csv via MySQL Workbench

SELECT PdId, Category
FROM dsa_module_eight.tb_incidentes_dup
GROUP BY PdId, Category;

SELECT PdId, Category, COUNT(*)
FROM dsa_module_eight.tb_incidentes_dup
GROUP BY PdId, Category;

SELECT *
FROM dsa_module_eight.tb_incidentes_dup
WHERE PdId = 11082415274000;

------------------------------------------------------------------------------------------------------------- #

 -- Identificando os registros duplicados (e retornando uma linha para duplicidade)
SELECT PdId, Category, COUNT(*) AS numero
FROM dsa_module_eight.tb_incidentes_dup
GROUP BY PdId, Category
HAVING numero > 1;

------------------------------------------------------------------------------------------------------------- #

 -- Identificando os registros duplicados (e retornando cada linha em duplicidade)
SELECT PdId, Category
FROM dsa_module_eight.tb_incidentes_dup
WHERE PdId in (SELECT PdId FROM dsa_module_eight.tb_incidentes_dup GROUP BY PdId HAVING COUNT(*) > 1)
ORDER BY PdId;

------------------------------------------------------------------------------------------------------------- #

 -- Identificando os registros duplicados (e retornando uma linha para duplicidade) com função window
SELECT *
FROM (
 SELECT primeiro_resultado.*,      
        ROW_NUMBER() OVER (PARTITION BY PdId, Category ORDER BY PdId) AS numero
 FROM dsa_module_eight.tb_incidentes_dup AS primeiro_resultado) AS segundo_resultado
WHERE numero > 1;

------------------------------------------------------------------------------------------------------------- #

 -- Identificando os registros duplicados com CTE
WITH cte_table
AS
(
 SELECT PdId, Category, ROW_NUMBER() over(PARTITION BY PdId, Category ORDER BY PdId) AS contagem 
 FROM dsa_module_eight.tb_incidentes_dup
)
SELECT * FROM cte_table WHERE contagem > 1;

------------------------------------------------------------------------------------------------------------- #

 -- Deletando os registros duplicados com CTE
SET SQL_SAFE_UPDATES = 0;

WITH cte_table
AS
(
 SELECT PdId, Category, ROW_NUMBER() over(PARTITION BY PdId, Category ORDER BY PdId) AS contagem 
 FROM dsa_module_eight.tb_incidentes_dup
)
DELETE FROM dsa_module_eight.tb_incidentes_dup 
USING dsa_module_eight.tb_incidentes_dup 
JOIN cte_table ON dsa_module_eight.tb_incidentes_dup.PdId = cte_table.PdId
WHERE cte_table.contagem > 1; 

SET SQL_SAFE_UPDATES = 1;

------------------------------------------------------------------------------------------------------------- #

 -- Deletando os registros duplicados com subquery
SET SQL_SAFE_UPDATES = 0;

DELETE FROM dsa_module_eight.tb_incidentes_dup
WHERE 
    PdId IN (
    SELECT PdId 
    FROM (
        SELECT                         
            PdId, ROW_NUMBER() OVER (PARTITION BY PdId, Category ORDER BY PdId) AS row_num
        FROM dsa_module_eight.tb_incidentes_dup) alias
    WHERE row_num > 1
);

SET SQL_SAFE_UPDATES = 1;

------------------------------------------------------------------------------------------------------------- #

 -- Cria a tabela
CREATE TABLE dsa_module_eight.tb_alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL, 
    email VARCHAR(255) NOT NULL
);

------------------------------------------------------------------------------------------------------------- #

 -- Insere os dados
INSERT INTO dsa_module_eight.tb_alunos (nome, sobrenome, email) 
VALUES ('Carine ','Schmitt','carine.schmitt@verizon.net'),
       ('Jean','King','jean.king@me.com'),
       ('Peter','Ferguson','peter.ferguson@google.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Jonas ','Bergulfsen','jonas.bergulfsen@mac.com'),
       ('Janine ','Labrune','janine.labrune@aol.com'),
       ('Susan','Nelson','susan.nelson@comcast.net'),
       ('Zbyszek ','Piestrzeniewicz','zbyszek.piestrzeniewicz@att.net'),
       ('Roland','Keitel','roland.keitel@yahoo.com'),
       ('Julie','Murphy','julie.murphy@yahoo.com'),
       ('Kwai','Lee','kwai.lee@google.com'),
       ('Jean','King','jean.king@me.com'),
       ('Susan','Nelson','susan.nelson@comcast.net'),
       ('Roland','Keitel','roland.keitel@yahoo.com');

------------------------------------------------------------------------------------------------------------- #

-- Consultas

SELECT * FROM dsa_module_eight.tb_alunos
ORDER BY email;

SELECT email, COUNT(email) AS contagem
FROM dsa_module_eight.tb_alunos
GROUP BY email
HAVING contagem > 1;
    
SET SQL_SAFE_UPDATES = 0;

USE dsa_module_eight;
DELETE n1 
FROM tb_alunos n1, tb_alunos n2 
WHERE n1.id > n2.id 
AND n1.email = n2.email;

SET SQL_SAFE_UPDATES = 1;

SELECT email, COUNT(email) AS contagem
FROM dsa_module_eight.tb_alunos
GROUP BY email
HAVING contagem > 1;

------------------------------------------------------------------------------------------------------------- #
