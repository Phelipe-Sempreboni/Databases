-- Script para verificar se algum usuário está bloqueado na sessão atual.

SELECT
   (SELECT USERNAME FROM V$SESSION WHERE SID=A.SID) BLOCKER,
   A.SID,
  'IS BLOCKING',
   (SELECT USERNAME FROM V$SESSION where sid=b.sid) blockee,
   B.SID
FROM
  V$LOCK A,
   V$LOCK B
WHERE
   A.BLOCK = 1
AND
   B.REQUEST > 0
AND
   A.ID1 = B.ID1
AND
   A.ID2 = B.ID2;
