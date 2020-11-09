-- Comandos na extensão em (.sql).
-- Elaborado por: Luiz Phelipe Utiama Sempreboni.

-- Comando: Criação de banco de dados com (CREATE DATABASE).
-- Nota: Temos mais maneiras de criar um banco de dados, tanto pelo assistente ou comandos com "CREATE DATABASE" com mais parâmetros, porém, irei focar somente em algumas maneiras.

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 1 - Mais simples de criar o banco de dados.
-- Nota: Quando usamos esse comando mais simples, o SQL Server se baseia no banco de dados padrão do sistema para definir os parâmetros.
-- Nota2: Os arquivos serão criados de acordo com a pasta que foi definida em sistema para o SQL Server Management Studio.

USE master;
CREATE DATABASE TESTE;

USE master;
DROP DATABASE TESTE;

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 2 - Criação de um database com arquivos de dados, ou seja, parâmetro.

USE master;
DROP DATABASE TESTE;

USE master;
CREATE DATABASE TESTE
ON
( 
    NAME = TESTE_DATABASE,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 20, -- Tamanho inicial
    MAXSIZE = 80, -- Tamanho máximo
    FILEGROWTH = 10 -- Taxa de crescimento do arquivo do database
);
GO

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 3 - Criação de um database com arquivos de dados e de logs, ou seja, parâmetros.

USE master;
DROP DATABASE TESTE;

USE master;
CREATE DATABASE TESTE
ON
( 
    NAME = TESTE_DATABASE,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 20, -- Tamanho inicial
    MAXSIZE = 80, -- Tamanho máximo
    FILEGROWTH = 10 -- Taxa de crescimento do arquivo do database
)
LOG ON
( 
    NAME = TESTE_LOG,
    FILENAME = 'C:\DataBase\LogFiles\teste_log.ldf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 10MB, -- Tamanho inicial
    MAXSIZE = 40MB, -- Tamanho máximo
    FILEGROWTH = 5MB -- Taxa de crescimento do arquivo de log
);
GO

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 4 - Criação de um database com diversos arquivos de dados.

USE master;
DROP DATABASE TESTE;

USE master;
CREATE DATABASE TESTE
ON
PRIMARY
(
    NAME = teste_dados_1,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_1.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
),
(   NAME = teste_dados_2,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_2.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
),
(   NAME = teste_dados_3,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_3.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
),
(   NAME = teste_dados_4,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_4.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
);
GO

-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x-------x

-- Maneira 5 - Criação de um database com diversos arquivos de dados e de logs.

USE master;
DROP DATABASE TESTE;

USE master;
CREATE DATABASE TESTE
ON
PRIMARY
(
    NAME = teste_dados_1,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_1.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
),
(   NAME = teste_dados_2,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_2.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
),
(   NAME = teste_dados_3,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_3.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
),
(   NAME = teste_dados_4,
    FILENAME = 'C:\DataBase\DataBaseFiles\teste_dados_4.mdf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo do database
)
LOG ON
(
    NAME = teste_log_1,
    FILENAME = 'C:\DataBase\LogFiles\teste_log_1.ldf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo de log
),
(   
    NAME = teste_log_2,
    FILENAME = 'C:\DataBase\LogFiles\teste_log_2.ldf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo de log
),
(
    NAME = teste_log_3,
    FILENAME = 'C:\DataBase\LogFiles\teste_log_3.ldf', -- Altere para o caminho que foi especificado para o SQL Server, que seria o mais recomendado.
    SIZE = 200MB, -- Tamanho inicial
    MAXSIZE = 300, -- Tamanho máximo
    FILEGROWTH = 20 -- Taxa de crescimento do arquivo de log
);
GO