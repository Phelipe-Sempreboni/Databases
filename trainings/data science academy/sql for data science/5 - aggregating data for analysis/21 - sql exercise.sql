------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 1 - Qual o número de hubs por cidade?
SELECT
	 COUNT(*) AS qtd_hub_cidade
    ,hub_city

FROM dsa_module_five.tb_hubs

GROUP BY
	hub_city
    
ORDER BY 
	qtd_hub_cidade
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 2 - Qual o número de pedidos (orders) por status?

SELECT
	 COUNT(*) AS qtd_pedidos
    ,order_Status AS status
    
FROM dsa_module_five.tb_orders

GROUP BY
	order_status
    
ORDER BY
	qtd_pedidos
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 3 - Qual o número de lojas (stores) por cidade dos hubs?
SELECT
	 COUNT(*) AS qtd_lojas
    ,B.hub_city

FROM dsa_module_five.tb_stores AS A, dsa_module_five.tb_hubs AS B

WHERE A.hub_id = B.hub_id

GROUP BY
	B.hub_city
    
ORDER BY
	qtd_lojas
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 4 - Qual o maior e o menor valor de pagamento (payment_amount) registrado?
SELECT 
	 MIN(payment_amount) AS payment_amount_min
    ,MAX(payment_amount) AS payment_amount_max
    
FROM dsa_module_five.tb_payments;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 5 - Qual tipo de driver (driver_type) fez o maior número de entregas?
SELECT
	 COUNT(*) AS qtd_entregas
    ,B.driver_type

FROM dsa_module_five.tb_deliveries AS A, dsa_module_five.tb_drivers AS B

WHERE A.driver_id = B.driver_id

GROUP BY
	B.driver_type
    
ORDER BY
	qtd_entregas
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 6 - Qual a distância média das entregas por tipo de driver (driver_modal)?
SELECT
	 ROUND(AVG(A.delivery_distance_meters), 2) AS distancia_media
    ,B.driver_modal

FROM dsa_module_five.tb_deliveries AS A, dsa_module_five.tb_drivers AS B

WHERE A.driver_id = B.driver_id

GROUP BY
	B.driver_modal
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 7 - Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?
SELECT
     B.store_name
	,ROUND(AVG(A.order_amount), 2) AS valor_pedido_medio


FROM dsa_module_five.tb_orders AS A

LEFT JOIN dsa_module_five.tb_stores AS B ON A.store_id = B.store_id

GROUP BY
	B.store_name

ORDER BY
	valor_pedido_medio DESC
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 8 - Existem pedidos que não estão associados a lojas? Se caso positivo, quantos? Não existem.
SELECT
*
FROM dsa_module_five.tb_orders AS A

LEFT JOIN dsa_module_five.tb_stores AS B ON A.store_id = B.store_id

WHERE B.store_name IS NULL OR B.store_name = ''

;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 9 - Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
SELECT
     B.channel_name
	,ROUND(SUM(A.order_amount), 2) AS total_valor_pedidos


FROM dsa_module_five.tb_orders AS A

LEFT JOIN dsa_module_five.tb_channels AS B ON A.channel_id = B.channel_id

GROUP BY
	B.channel_name

HAVING B.channel_name = 'FOOD PLACE'

ORDER BY
	total_valor_pedidos
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 10 - Quantos pagamentos foram cancelados (chargeback)?
SELECT 
	 payment_status
    ,COUNT(*) AS qtd_pedido_cancelado
    
FROM dsa_module_five.tb_payments

GROUP BY 
	payment_status
    
HAVING payment_status = 'CHARGEBACK';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 11 - Qual foi o valor médio dos pagamentos cancelados (chargeback)?
SELECT 
	 payment_status
    ,ROUND(AVG(payment_amount),2) AS valor_medio_cancelado
    
FROM dsa_module_five.tb_payments

GROUP BY 
	payment_status
    
HAVING payment_status = 'CHARGEBACK';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 12 - Qual a média do valor de pagamento por método de pagamento (payment_method) em ordem decrescente?
SELECT 
	 payment_method
    ,ROUND(AVG(payment_amount),2) AS valor_medio_por_metodo
    
FROM dsa_module_five.tb_payments

GROUP BY 
	payment_method
    
ORDER BY
	valor_medio_por_metodo DESC
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 13 - Quais métodos de pagamento tiveram valor médio superior a 100?
SELECT 
	 payment_method
    ,ROUND(AVG(payment_amount),2) AS valor_medio_por_metodo
    
FROM dsa_module_five.tb_payments

GROUP BY 
	payment_method
    
HAVING valor_medio_por_metodo > 100
    
ORDER BY
	valor_medio_por_metodo DESC
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 14 - Qual a média de valor de pedido (order_amount) por estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?
SELECT
	 ROUND(AVG(A.order_amount), 2) AS valor_medio_pedido
    ,C.hub_state
    ,B.store_segment
    ,D.channel_type

FROM dsa_module_five.tb_orders AS A
	,dsa_module_five.tb_stores AS B
    ,dsa_module_five.tb_hubs AS C
    ,dsa_module_five.tb_channels AS D

WHERE A.store_id = B.store_id 
AND A.channel_id = D.channel_id
AND B.hub_id = C.hub_id

GROUP BY
     C.hub_state
    ,B.store_segment
    ,D.channel_type
    
ORDER BY
	valor_medio_pedido
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 15 - Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
SELECT
	 ROUND(AVG(A.order_amount), 2) AS valor_medio_pedido
    ,C.hub_state
    ,B.store_segment
    ,D.channel_type

FROM dsa_module_five.tb_orders AS A
	,dsa_module_five.tb_stores AS B
    ,dsa_module_five.tb_hubs AS C
    ,dsa_module_five.tb_channels AS D

WHERE A.store_id = B.store_id 
AND A.channel_id = D.channel_id
AND B.hub_id = C.hub_id

GROUP BY
     C.hub_state
    ,B.store_segment
    ,D.channel_type
    
HAVING valor_medio_pedido > 450
    
ORDER BY
	valor_medio_pedido
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 16 - Qual  o  valor  total  de  pedido  (order_amount)  por  estado  do  hub  (hub_state), segmento  da  loja  (store_segment)  e  tipo  de  canal  (channel_type)?  Demonstre  os  totais intermediários eformate o resultado.
SELECT
	 ROUND(SUM(A.order_amount), 2) AS valor_medio_pedido
    ,IF(GROUPING(C.hub_state), 'Total de Todos os Estados', C.hub_state) AS hub_state
    ,IF(GROUPING(B.store_segment), 'Total de Todos os Segmentos', B.store_segment) AS store_segment
    ,IF(GROUPING(D.channel_type), 'Total de Todos os Canais', D.channel_type) AS channel_type

FROM dsa_module_five.tb_orders AS A
	,dsa_module_five.tb_stores AS B
    ,dsa_module_five.tb_hubs AS C
    ,dsa_module_five.tb_channels AS D

WHERE A.store_id = B.store_id 
AND A.channel_id = D.channel_id
AND B.hub_id = C.hub_id

GROUP BY
     C.hub_state
    ,B.store_segment
    ,D.channel_type
    WITH ROLLUP
    
HAVING valor_medio_pedido > 450
    
ORDER BY
	valor_medio_pedido
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 17 - Quando  o  pedido  era  do  Hub  do  Rio  de  Janeiro  (hub_state),  segmento  de  loja 'FOOD',  tipo  de  canal  Marketplace  e  foi  cancelado,  qual  foi  a  média  de  valor  do  pedido (order_amount)?
SELECT
	 ROUND(SUM(A.order_amount), 2) AS valor_medio_pedido
    ,C.hub_state
    ,B.store_segment
    ,D.channel_type

FROM dsa_module_five.tb_orders AS A
	,dsa_module_five.tb_stores AS B
    ,dsa_module_five.tb_hubs AS C
    ,dsa_module_five.tb_channels AS D

WHERE A.store_id = B.store_id 
AND A.channel_id = D.channel_id
AND B.hub_id = C.hub_id
AND A.order_status = 'CANCELED'
AND hub_state = 'RJ' 
AND store_segment = 'FOOD' 
AND channel_type = 'MARKETPLACE' 

GROUP BY
     C.hub_state
    ,B.store_segment
    ,D.channel_type

ORDER BY
	valor_medio_pedido
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 18 - Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
SELECT
	 ROUND(SUM(A.order_amount), 2) AS valor_medio_pedido
    ,C.hub_state
    ,B.store_segment
    ,D.channel_type

FROM dsa_module_five.tb_orders AS A
	,dsa_module_five.tb_stores AS B
    ,dsa_module_five.tb_hubs AS C
    ,dsa_module_five.tb_channels AS D

WHERE A.store_id = B.store_id 
AND A.channel_id = D.channel_id
AND B.hub_id = C.hub_id
AND A.order_status = 'CANCELED'
AND store_segment = 'GOOD' 
AND channel_type = 'MARKETPLACE' 

GROUP BY
     C.hub_state
    ,B.store_segment
    ,D.channel_type
    
HAVING valor_medio_pedido > 100000

ORDER BY
	valor_medio_pedido
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 19 - Em  que  data  houve  a  maior  média  de  valor  do  pedido  (order_amount)?  Dica: Pesquise e use a função SUBSTRING().
SELECT 
	 ROUND(AVG(order_amount),2) AS order_amount_median
    ,SUBSTRING(order_moment_created, 1, 9) AS order_moment_created
    
FROM dsa_module_five.tb_orders

GROUP BY
	SUBSTRING(order_moment_created, 1, 9)
    
ORDER BY
	AVG(order_amount) DESC
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #

-- 20 - Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)? Dica: Use a função SUBSTRING().
SELECT 
	 MIN(order_amount) AS order_amount_min
    ,SUBSTRING(order_moment_created, 1, 9) AS order_moment_created
    
FROM dsa_module_five.tb_orders

GROUP BY
	SUBSTRING(order_moment_created, 1, 9)
    
ORDER BY
	MIN(order_amount)
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ #
