-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Um administrador de banco de dados (DBA) Oracle pode executar consultas nas views DBA_SYS_PRIVS, DBA_TAB_PRIVS e DBA_ROLE_PRIVS para obter informações sobre os privilégios de usuário relacionados com ao sistema, tabelas e roles, respectivamente.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DBA_SYS_PRIVS : Privilégios de sistema concedidos a usuários e funções:

-- Por exemplo, um DBA que necessita exibir os privilégios de sistema concedidos a usuários e funções pode efetuar uma consulta na view DBA_SYS_PRIVS:

-- A view DBA_SYS_PRIVS contém três colunas de dados:

-- GRANTEE é o nome, função ou usuário ao qual foi atribuído o privilégio.
-- PRIVILEGE é o Privilégio do sistema que foi designado.
-- ADMIN_OPTION indica se o privilégio concedido estava com a opção ADMIN

SELECT * FROM DBA_SYS_PRIVS;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DBA_TAB_PRIVS : Privilégios concedidos em objetos no banco de dados

--Para determinar quais usuários têm acesso direto a uma tabela ou objeto de banco de dados, usamos a view DBA_TAB_PRIVS:

-- Você pode verificar a documentação oficial para obter mais informações sobre as colunas retornadas nesta consulta, mas as colunas importantes são:

-- GRANTEE – Nome do usuário com acesso concedido.
-- OWNER – Proprietário do objeto
-- TABLE_NAME –  Nome do objeto (tabela, índice, sequência etc.).
-- GRANTOR – Nome do usuário que executou a concessão
-- PRIVILEGE – Privilégio atribuído ao GRANTEE objeto associado.

SELECT * FROM DBA_ROLE_PRIVS;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Exemplos de consultas para verificar usuários, roles e privilégios no Oracle 

-- A seguir separamos algumas querys para serem utilizadas pelo DBA para para verificar usuários, permissões / papéis (roles) concedidos de um usuário

-- Query para consultar roles para um usuário


SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = '&NOMEDOUSUARIO';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Privilégios concedidos a um usuário

SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'NOMEDOUSUARIO';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Privilégios concedidos a objetos conforme privilégio concedido a uma role de um usuário

SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE IN (SELECT granted_role FROM DBA_ROLE_PRIVS WHERE GRANTEE = '&NOMEDOUSUARIO''') order by 3;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Consulta para verificar se o usuário possui privilégios de sistema

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = '&NOMEDOUSUARIO';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Verificar informações sobre o usuário e também verificar se o usuári existe.

SELECT * FROM DBA_USERS WHERE USERNAME = '&NOME_DO_USUARIO';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Consulta para verificar as permissões concedidas a uma role

SELECT * FROM ROLE_ROLE_PRIVS WHERE ROLE = '&NOME_DA_ROLE';
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE = '&NOME_DA_ROLE';
SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE = '&NOME_DA_ROLE';
SELECT * FROM DBA_USERS WHERE USERNAME = '&NOME_DO_USUARIO';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

