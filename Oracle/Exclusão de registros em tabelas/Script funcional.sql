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

-- Exclusão de registros da tabela com DELETE FROM, DELETE FROM WHERE e TRUNCATE TABLE.

-- 1º - Excluir registros com DELETE FROM, onde todos os registros serão deletados da tabela.
DELETE FROM TBL_VENDEDORES;

-- 2º - Excluir regstros da tabela com DELETE FROM WHERE, onde usaremos o campo (MATRICULA) com o registro(00233) para exclusão.
DELETE FROM TBL_VENDEDORES WHERE MATRICULA = 00233;

-- 3º - Excluir registros da tabela TRUNCATE TABLE, onde todos dados serão truncados/apagados.
TRUNCATE TABLE TBL_VENDEDORES;