------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.channels
(
	 channel_id INT
	,channel_name VARCHAR(150)
    ,channel_type VARCHAR(150)
);

------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.tb_deliveries
(
	 delivery_id INT
	,delivery_order_id INT
    ,driver_id INT
    ,delivery_distance_meters INT
    ,delivery_status VARCHAR(150)
);

------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.tb_drivers
(
	 driver_id INT
	,driver_modal VARCHAR(150)
    ,driver_type VARCHAR(150)
);

------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.tb_hubs
(
	 hub_id INT
	,hub_name VARCHAR(150)
    ,hub_city VARCHAR(150)
    ,hub_state VARCHAR(150)
    ,hub_latitude VARCHAR(150)
    ,hub_longitude VARCHAR(150)
);

------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.tb_orders
(
	 order_id INT
    ,store_id INT
    ,channel_id INT
    ,payment_order_id INT
    ,delivery_order_id INT
    ,order_status VARCHAR(150)
    ,order_amount FLOAT
    ,order_delivery_fee FLOAT
    ,order_delivery_cost FLOAT
    ,order_created_hour INT
    ,order_created_minute INT
    ,order_created_day INT
    ,order_created_month INT
    ,order_created_year INT
    ,order_moment_created TIMESTAMP
    ,order_moment_accepted TIMESTAMP
    ,order_moment_ready TIMESTAMP
    ,order_moment_collected TIMESTAMP
    ,order_moment_in_expedition TIMESTAMP
    ,order_moment_delivering TIMESTAMP
    ,order_moment_delivered TIMESTAMP
    ,order_moment_finished TIMESTAMP
    ,order_metric_collected_time FLOAT
    ,order_metric_paused_time FLOAT
    ,order_metric_production_time FLOAT
    ,order_metric_walking_time FLOAT
    ,order_metric_expediton_speed_time FLOAT
    ,order_metric_transit_time FLOAT
    ,order_metric_cycle_time FLOAT
);

------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.tb_payments
(
 payment_id	INT
,payment_order_id INT
,payment_amount	FLOAT
,payment_fee FLOAT
,payment_method	VARCHAR(150)
,payment_status	VARCHAR(150)
);

------------------------------------------------------------------------------------------------------------------- #

CREATE TABLE dsa_module_five.tb_stores
(
	 store_id INT
	,hub_id	INT
	,store_name VARCHAR(250)	
	,store_segment VARCHAR(250)
	,store_plan_price FLOAT
	,store_latitude	VARCHAR(250)
	,store_longitude VARCHAR(250)
);

------------------------------------------------------------------------------------------------------------------- #