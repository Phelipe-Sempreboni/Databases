-- Criação de uma function para criação de um calendário em português.
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
 
 CREATE FUNCTION CALENDARIO.FN_CALENDARIO_PADRÃO_PT_BR
 (
	 @DATA1 DATE
	,@DATA2 DATE
 )
 RETURNS TABLE
 AS
 RETURN
 (
 WITH 
	[Calendario1] AS (
 SELECT 
	CONVERT(DATE, DATEADD(DAY, NUMBER + 1, @DATA1), 103) AS [data]
	,
	CASE
		WHEN CONVERT(DATE, DATEADD(DAY, NUMBER + 1, @DATA1), 103) NOT IN (' ') THEN DATENAME(DW,CONVERT(DATE, DATEADD(DAY, NUMBER + 1, @DATA1), 103))
	END AS [DIA_DA_SEMANA_PORTUGUES]

	FROM master..spt_values AS A

	WHERE type = 'P' AND DATEADD(DAY, NUMBER + 1, @DATA1) < @DATA2
),
	[Calendario2] AS (
 SELECT
	[data]
   ,

   CASE
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Monday' THEN 'Segunda-feira'
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Tuesday' THEN 'Terça-feira'
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Wednesday' THEN 'Quarta-feira'
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Thursday' THEN 'Quinta-feira'
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Friday' THEN 'Sexta-feira'
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Saturday' THEN 'Sábado'
		WHEN [DIA_DA_SEMANA_PORTUGUES] = 'Sunday' THEN 'Domingo'
   END AS [DIA_DA_SEMANA_PORTUGUÊS]

 FROM [Calendario1]
)
SELECT * FROM [Calendario2]
);
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar a function e utilizar os valores para retorno.
-- Realize um select * from da function conforme abaixo e insira os valores de datas conforme abaixo.
-- O mais indicado é utilizar o modelo abaixo.

SELECT * FROM [PERSONAL].[CALENDARIO].[FN_CALENDARIO_PADRÃO_ES_US] ('20191231' , '20220101')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------