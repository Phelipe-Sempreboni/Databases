-- Comando para atualização de tabelas.
-- Vou basear-se no script de criação de insert na tabela abaixo.

-- Criando a tabela.
CREATE TABLE TBL_VENDEDORES (
     MATRICULA VARCHAR (30)
    ,NOME VARCHAR (150)
    ,PERCENTUAL_COMISSAO NUMBER
    ,DATA_ADMISSAO DATE
    ,ESTA_DE_FERIAS VARCHAR(4)

);

-- Inserindo dados na tabela. Selecione e rode o script abaixo inteiro.
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00875, 'Ricardo Barbosa', 8, TO_DATE('01/10/1980', 'DD/MM/YYYY'), 'Não');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00989, 'Rafael de Brito Nascimento', 8, TO_DATE('30/10/1980', 'DD/MM/YYYY'), 'Sim');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00108, 'Tabata Line de Souza', 8,TO_DATE('01/01/1980', 'DD/MM/YYYY'), 'Não');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00276, 'Nilson Ramos de Souza', 11,TO_DATE('04/02/1980', 'DD/MM/YYYY'), 'Não');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00785, 'Edgar Gerevini Carvalho', 8,TO_DATE('05/03/1980', 'DD/MM/YYYY'), 'Sim');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00324, 'Uilson Lima de Castro', 12,TO_DATE('04/06/1980', 'DD/MM/YYYY'), 'Não');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00235, 'Márcio Almeida Silva', 20,TO_DATE('28/10/1980', 'DD/MM/YYYY'), 'Sim');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00236, 'Cláudia Morais', 10,TO_DATE('22/12/1980', 'DD/MM/YYYY'), 'Sim');
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, ESTA_DE_FERIAS) VALUES (00233, 'José Geraldo da Fonseca', 11,TO_DATE('21/10/1980', 'DD/MM/YYYY'), 'Não');

-- Atualização de um registro que foi inserido nessa tabela, onde vamos utilizar a coluna (MATRICULA) como chave para alteração do registro.
UPDATE TBL_VENDEDORES -- Localização da tabela.
SET NOME = 'José Geraldo da Fonseca Junior' -- Registro a ser alterado.
WHERE MATRICULA = 233; -- Filtro pela coluna (MATRICULA) e registro, onde o nome será alterado de (José Geraldo da Fonseca) para (José Geraldo da Fonseca Junior). Podem ser inseridos mais filtros no comando WHERE.