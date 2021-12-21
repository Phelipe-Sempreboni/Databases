-- Criação de uma function para geração de números.
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

CREATE SCHEMA GERADOR;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE PERSONAL;;
GO

--CREATE SCHEMA GERADOR;
--GO

 CREATE FUNCTION GERADOR.FN_GERADOR_NUMEROS

 (
	 @VALOR_INICIAL BIGINT
	,@VALOR_FINAL BIGINT
)
 RETURNS TABLE
 AS
 RETURN
(
 SELECT TOP (@VALOR_FINAL - @VALOR_INICIAL + 1) @VALOR_INICIAL - 1 + ROW_NUMBER() OVER(ORDER BY T1.NUMBER) as [VALOR]
 FROM master..spt_values T1 
    CROSS JOIN master..spt_values T2
)
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Selecionar a function e utilizar os valores para retorno.
-- Realize um select * from da function conforme abaixo e insira os valores conforme abaixo.
-- O mais indicado é utilizar o modelo abaixo.
-- insira o valor mais apropriado para sua necessidade, neste caso, o exemplo a geração do número 1 ao 100.

SELECT * FROM [PERSONAL].[GERADOR].[FN_GERADOR_NUMEROS] (1, 100)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------