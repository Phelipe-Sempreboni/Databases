-- Query para listar as functions, packages, procedures, trigger e type do banco de dados.

-- Lista todas as funções e procedimentos, junto com as propriedades associadas.
SELECT * FROM DBA_PROCEDURES;

-- Lista todas as funções e procedimentos, junto com as propriedades associadas. Não contém a coluna OWNER.
SELECT * FROM USER_PROCEDURES;

-- Lista todas as funções e procedimentos, junto com as propriedades associadas.
-- Neste caso abaixo, listamos o objeto do tipo (PROCEDURE) do usuário (SYS).
SELECT * FROM DBA_PROCEDURES
WHERE OBJECT_TYPE = 'PROCEDURE' AND OWNER = 'SYS'
ORDER BY OBJECT_NAME;

-- Agrupamento para verificar os tipos de objetos que é possível verificar com a (DBA_PROCEDURES).
SELECT
      OBJECT_TYPE
FROM DBA_PROCEDURES
GROUP BY
        OBJECT_TYPE
ORDER BY
        OBJECT_TYPE;