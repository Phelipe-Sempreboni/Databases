-- Comando para atualização de tabelas.
-- Vou basear-se no script de criação de insert na tabela abaixo.

-- Criando a tabela.
CREATE TABLE TBL_VENDEDORES (
     MATRICULA VARCHAR (30)
    ,NOME VARCHAR (150)
    ,PERCENTUAL_COMISSAO NUMBER

);

-- Inserindo dados na tabela. Selecione e rode o script abaixo inteiro.
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00875, 'Ricardo Barbosa', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00989, 'Rafael de Brito Nascimento', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00108, 'Tabata Line de Souza', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00276, 'Nilson Ramos de Souza', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00785, 'Edgar Gerevini Carvalho', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00324, 'Uilson Lima de Castro', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00235, 'Márcio Almeida Silva', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00236, 'Cláudia Morais', 8);
INSERT INTO TBL_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES (00233, 'José Geraldo da Fonseca', 8);

-- Atualização de um registro que foi inserido nessa tabela, onde vamos utilizar a coluna (MATRICULA) como chave para alteração do registro.
UPDATE TBL_VENDEDORES -- Localização da tabela.
SET NOME = 'José Geraldo da Fonseca Junior' -- Registro a ser alterado.
WHERE MATRICULA = 233; -- Filtro pela coluna (MATRICULA) e registro, onde o nome será alterado de (José Geraldo da Fonseca) para (José Geraldo da Fonseca Junior). Podem ser inseridos mais filtros no comando WHERE.