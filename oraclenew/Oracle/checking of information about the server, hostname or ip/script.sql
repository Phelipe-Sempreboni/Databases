-- Comando para conseguir verificar qual o servidor e/ou hostname e/ou ip que você está logado no Oracle Database.

SELECT UPPER(SYS_CONTEXT('USERENV','SERVER_HOST')) AS "HOSTNAME / IP" FROM DUAL;