-- Criação de uma function para criaçaõ de um calendário em inglês.
-- Teremos os comandos:
-- Criação de um database.
-- Criação de um schema.
-- Criação da function.
-- Selecionar a function e utilizar os valores para retorno.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Criação de um database.

CREATE DATABASE PERSONAL;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Criação de um schema.

CREATE SCHEMA CALENDÁRIO;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE PERSONAL;
GO

--CREATE SCHEMA CALENDARIO;
--GO
 
 CREATE FUNCTION CALENDARIO.FN_CALENDARIO_PADRÃO_ES_US
 (
	 @DATA1 DATE
	,@DATA2 DATE
 )
 RETURNS TABLE
 AS
 RETURN
 (
 SELECT 
	CONVERT(DATE, DATEADD(DAY, NUMBER + 1, @DATA1), 103) AS [DATA]
	,
	CASE
		WHEN CONVERT(DATE, DATEADD(DAY, NUMBER + 1, @DATA1), 103) NOT IN (' ') THEN DATENAME(DW,CONVERT(DATE, DATEADD(DAY, NUMBER + 1, @DATA1), 103))
	END AS [DIA_DA_SEMANA_INGLES]

	FROM master..spt_values AS A

	WHERE type = 'P' AND DATEADD(DAY, NUMBER + 1, @DATA1) < @DATA2
 );
 GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar a function e utilizar os valores para retorno.
-- Realize um select * from da function conforme abaixo e insira os valores de datas conforme abaixo.
-- O mais indicado é utilizar o modelo abaixo.

SELECT * FROM [PERSONAL].[CALENDARIO].[FN_CALENDARIO_PADRÃO_ES_US] ('20191231' , '20220101')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------