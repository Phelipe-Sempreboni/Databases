-- Exemplo de criação de tabela temporária global.
-- Nota: No item (I) temos o comando de (CREATE TABLE) para criação da tabela temporária.
-- Nota2: No item (II) temos o comando de (INSERT INTO) e alguns dados para inserir nessa tabela e testa-la com os dados. Feito com dados ficticios.
-- Nota3: No item (III) temos um comando (SELECT) para verificar a tabela e seus dados inseridos no item (II).
-- Nota4: No item (IV) temos um comando de (DROP TABLE) caso queira dropar a tabela em algum momento e refazer os testes.

-- Explicação sobre tabela temporária global:
-- As tabelas temporárias globais são visíveis para qualquer usuário e qualquer conexão após a criação e são excluídas quando todos os usuários que fazem referência à tabela se desconectam da instância do SQL Server.
-- As tabelas temporárias globais tem como símbolo para diferencia-la na criação de uma tabela convencional o (##), conforme o exemplo do item (I).

-- Recomendo ao fim de um processo com tabela temporária, utilizar o (DROP TABLE) e exclui-la para não ficar no HD e/ou em memória.

-- I:
BEGIN
CREATE TABLE ##TabelaTemporariaFuncionarios
(
    [matricula] VARCHAR (20),
    [nome do funcionario] VARCHAR (50),
    [idade] INT,
    [tipo da contratação] VARCHAR (15),
    [situacao] VARCHAR (15),
    [cargo] VARCHAR (70),
    [diretoria] VARCHAR (50),
    [setor] VARCHAR (50),
    [salario] FLOAT,
);
END

-- II:
BEGIN
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208080','Leticia Guimares','50','CLT','Ativo','Técnico Eletricista Especialista','Operaçao e Manutenção','Operacional do Polo Leste','7980')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208081','Renan Nogueira','49','CLT','Ativo','Técnico Eletricista Especialista','Operaçao e Manutenção','Operacional do Polo Leste','7980')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208082','Marcelo Angelo','48','CLT','Ativo','Técnico Eletricista Especialista','Operaçao e Manutenção','Operacional do Polo Norte','7980')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208083','Caio Ivando','47','CLT','Ativo','Técnico Eletricista Senior','Operaçao e Manutenção','Operacional do Polo Oeste','6800')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208084','Renato Nogueira','46','CLT','Ativo','Analista Especialista de Desenvolvimento de Rede ','Operaçao e Manutenção','Planejamento e Controle','9000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208085','Rafael Nascimento','45','CLT','Ativo','Especialista em Logistica','Logistica e Materiais','Logistica','8850')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208086','Ricardo Barbosa','44','CLT','Inativo','Especialista em Dados','Gestão de Dados','Dados e Relatórios','9580')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208087','Phelipe Sempreboni','43','CLT','Ativo','Analista Especialista de Big Data','Gestão de Dados','Dados e Relatórios','9850')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208088','Natalia Silva','42','CLT','Ativo','Analista Especialista de Dados','Gestão de Dados','Dados e Relatórios','9000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208089','Amanda Nogueira','41','CLT','Ativo','Analista Senior de Planejamento','Engenharia','Investimentos e Relatórios','7200')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208090','Renato Silva','40','CLT','Ativo','Analista Senior de Controle','Engenharia','Investimentos e Relatórios','7500')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208091','João Paulo Nobre','39','CLT','Ativo','Técnico Pleno de Rede Primária','Operaçao e Manutenção','Operacional do Polo Sul','4500')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208092','Felipe Regis','38','CLT','Inativo','Técnico Pleno de Rede Secundária','Operaçao e Manutenção','Operacional do Polo Sul','4500')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208093','Ivan de Lima','37','CLT','Ativo','Assistente Senior de Departamento Pessoal','Recusros Humanos','Pessoas e Seleção','2585')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208094','Gabriel Beto','36','CLT','Ativo','Business Partner da Engenharia','Engenharia','Gestão de pessoas','10000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208095','Carol Angelina','35','CLT','Inativo','Especialista de Departamento Pessoal','Recusros Humanos','Pessoas e Seleção','9000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208096','Rodrigo Henrique','34','CLT','Ativo','Analista Senior de Recursos Humanos','Recusros Humanos','Recrutamento','7450')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208097','Akio Yokohama','33','CLT','Ativo','Analista Junior de Materiais','Logistica e Materiais','Materiais','4550')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208098','Marcio Garcia','32','CLT','Ativo','Business Partner da Logistica','Logistica e Materiais','Gestão de pessoas','10000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208099','Aline Castro','31','PJ','Ativo','Recrutador Especialista em Tech e TI','Tecnologia e Infraestrutura','Recrutamento','8000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208100','Tabata Silva','30','CLT','Ativo','Business Partner da Dados','Gestão de Dados','Gestão de pessoas','10000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208101','Daniel Silva','29','PJ','Ativo','Consultor Pleno em SAP GUI','Tecnologia e Infraestrutura','Desenvolvimento e Teste','15000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208102','Daniel Moreira','28','PJ','Inativo','Consultor Senior em banco de dados','Gestão de Dados','Desenvolvimento e Relatórios','12500')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208103','Felipe Abreu','27','CLT','Ativo','Especialista em banco de dados','Gestão de Dados','Desenvolvimento e Relatórios','9550')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208104','Bruno Henrique','26','PJ','Inativo','Consultor Pleno em Python','Tecnologia e Infraestrutura','Desenvolvimento e Teste','12000')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208105','Ernesto Silva','25','CLT','Ativo','Analista Senior Desenvolvedor Java','Tecnologia e Infraestrutura','Desenvolvimento e Teste','7400')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208106','Henrique Benedito','24','PJ','Ativo','Programador de JavaScript','Tecnologia e Infraestrutura','Desenvolvimento e Teste','8500')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208107','Karine Abreu','23','PJ','Ativo','Programador de Java','Tecnologia e Infraestrutura','Desenvolvimento e Teste','8500')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208108','Paulo Rodrigues','22','CLT','Inativo','Especialista em Dados','Gestão de Dados','Desenvolvimento e Teste','9580')
INSERT INTO ##TabelaTemporariaFuncionarios VALUES ('BR208109','Savio Silva','21','Estágio','Ativo','Estagiário de Business Intelligence','Gestão de Dados','Dados e Relatórios','2000')
END

-- III:
BEGIN
SELECT * FROM ##TabelaTemporariaFuncionarios
END

-- IV:
BEGIN
DROP TABLE ##TabelaTemporariaFuncionarios
END
GO