-- Script para verificar informações sobre sessões ativas, inativas e etc.

SELECT * FROM V$SESSION;

SELECT * FROM V$SESSION WHERE USERNAME = 'NOME_DO_USUARIO';