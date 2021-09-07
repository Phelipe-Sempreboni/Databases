--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Declaração de variáveis:

DECLARE @IDADE INT
DECLARE @NOME VARCHAR (200)
DECLARE @DATA DATE

DECLARE @IDADE2 INT, @NOME2 VARCHAR(200), @DATA2 DATE

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Setar/atribuir valor para variável e printar na tela.

SET @IDADE = 20
PRINT @IDADE

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Setar/atribuir valor para variável e printar na tela.

SET @NOME = 'João da Silva'
PRINT @NOME

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Setar/atribuir valor para variável e printar na tela.

SET @DATA = '20180517'
PRINT @DATA

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Setar/atribuir valor para variável e printar na tela.

DECLARE @CPF VARCHAR (12)
SET @CPF = '1471156710'
PRINT @CPF

-- Realizar um comando SELECT com WHERE, porém o comando WHERE fará o filtro baseado no valor da variável @CPF.
-- Isso seria em vez de colocar o valor diretamente no campo, declaramos uma variável e inserimos esse valor na variável.

SELECT NOME, [DATA DE NASCIMENTO], IDADE FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Utilizando a variável com valor baseado diretamente no campo da própria tabela que está sendo consultada, onde o comando WHERE fará o filtro baseado no valor da variável @CPF.
-- Em vez de atribuirmos um valor para variável, igualamos ela a alguma coluna da tabela, onde o valor da coluna assumirá o valor da variável.
-- Podemos dizer que este seria um script mais dinâmico.

DECLARE @NOME3 VARCHAR (200)
DECLARE @DATA3 DATE
DECLARE @IDADE3 INT
DECLARE @CPF3 VARCHAR (12)

SET @CPF3 = '1471156710'

SELECT @NOME3 = NOME, @DATA3 = [DATA DE NASCIMENTO], @IDADE3 = IDADE FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF3

PRINT @NOME3
PRINT @DATA3
PRINT @IDADE3
PRINT @CPF3

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE @MATRICULA4 VARCHAR(5)
DECLARE @NOME4 VARCHAR(100)
DECLARE @PERCENTUAL4 FLOAT
DECLARE @DATA4 DATE
DECLARE @FERIAS4 BIT
DECLARE @BAIRRO VARCHAR(100)

SET @MATRICULA4 = '00239'
SET @NOME4 = 'José Mattos'
SET @PERCENTUAL4 = 0.10
SET @DATA4 = '20100120'
SET @FERIAS4 = 1
SET @BAIRRO = 'Meier'

INSERT INTO [TABELA DE VENDEDORES] ([MATRICULA], [NOME], [PERCENTUAL COMISSÃO], [DATA ADMISSÃO], [DE FERIAS], [BAIRRO])
VALUES
(@MATRICULA4, @NOME4, @PERCENTUAL4, @DATA4, @FERIAS4, @BAIRRO)

SELECT * FROM [TABELA DE VENDEDORES]

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
