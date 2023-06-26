# -------------------------------------------------------------------------------------------------------------------------------------- #

# Retornar a data do pedido, o nome do cliente, todos os vendedores, com ou sem pedido associado, e ordenar o resultado pelo nome do cliente.

SELECT
	 CASE WHEN C.nome_cliente IS NULL THEN 'Sem pedido' ELSE C.nome_cliente END AS nome_cliente
	,A.nome_vendedor 
	,CASE WHEN B.data_pedido IS NULL THEN 'Sem pedido' ELSE B.data_pedido END AS data_pedido
    
FROM dsa_module_four.tb_vendedor AS A 

LEFT JOIN dsa_module_four.tb_pedidos AS B USING (id_vendedor)

LEFT JOIN dsa_module_four.tb_clientes AS C ON B.id_cliente = C.id_cliente

ORDER BY
	C.nome_cliente DESC
;

# -------------------------------------------------------------------------------------------------------------------------------------- #