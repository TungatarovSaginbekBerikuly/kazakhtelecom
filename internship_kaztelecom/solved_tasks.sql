-- Задачи стажерам
-- Задача 1:
-- задача по абонентам ,выгрузить всех абонентов с некорректными именами в системе в сегменте B2C(не должен содержат символы ) 

-- используемые таблицы : 
-- crm2.crm2_crm_customer_account 
-- crm2.crm2_crm_customer 
-- dataw.dataw_rep_isb_filial_server 
-- dataw.dataw_rep_mview_abonent_contract 
-- dataw.DATAW_nsi_server 
-- dataw.DATAW_nsi_department 
-- dataw.DATAW_nsi_rdt

-- Мое решение: 
DESCRIBE crm2.crm2_crm_customer_account;
DESCRIBE crm2.crm2_crm_customer;
DESCRIBE dataw.dataw_rep_isb_filial_server;
DESCRIBE dataw.dataw_rep_mview_abonent_contract;
DESCRIBE dataw.DATAW_nsi_server;
DESCRIBE dataw.DATAW_nsi_department;
DESCRIBE dataw.DATAW_nsi_rdt;


SELECT
	ac.local_id AS abonent_id,
	ab.name AS abonent_name,
	ab.segment, ac.filial_id, c.customer_id
FROM
	(SELECT abonent_id, name, segment
	FROM dataw.dataw_rep_mview_abonent_contract
	WHERE segment = 'B2C'
		AND name IS NOT NULL
		AND name RLIKE '[^А-Яа-яЁё -]') ab
JOIN crm2.crm2_crm_customer_account ac ON ab.abonent_id = ac.local_id
JOIN crm2.crm2_crm_customer c ON ac.customer_id = c.customer_id
LIMIT 5;


CREATE INDEX idx_local_id ON crm2_crm_customer_account(local_id);
CREATE INDEX idx_customer_id ON crm2_crm_customer_account(customer_id);
CREATE INDEX idx_abonent_id ON dataw_rep_mview_abonent_contract(abonent_id);	

-- Я оптимизировал код так как получение всех данных или же заход в каждый файл грузиться бесконечно 

-- Задача 2:
-- Cобрать за 2022 год  'F11-102' всех абонентов у которых есть этот сап код 
-- Вытащить по месяцам количество абонентов ,сумму начилении 

-- используемые таблицы : 

-- dataw.dataw_rep_main_2spec_detail2_v2
-- dataw.dataw_rep_main_2spec_detail2_v2_tm
-- dataw.dataw_rep_2spec_main_volume_cnt2_v2_tm 
--  DATAW.DATAW_ISB_SERVICE_CLASS_ELEM_GROUP_
--   DATAW.DATAW_ISB_SERVICE_CLASS_ELEM  
--   DATAW.DATAW_BITTL_TOWN t 
--   DATAW.DATAW_NSI_SERVER 
--   DATAW.DATAW_NSI_DEPARTMENT 
--   DATAW.DATAW_NSI_RDT 

-- Мое решение: 
SELECT
   NOW() AS executed_at,
   CONCAT(SUBSTR(r.event_date, 1, 4), '-', SUBSTR(r.event_date, 5, 2)) AS month,
   COUNT(DISTINCT r.payer_abonent_id) AS abonent_count,
   SUM(r.sum_debit) AS total_sum_debit
FROM dataw.dataw_rep_main_2spec_detail2_v2 r
JOIN dataw.dataw_isb_service_class_elem e
   ON r.service_class_elem_id = e.id
WHERE e.code = 'F11-102'
 AND e.create_date LIKE '2022%'
 AND r.event_date LIKE '2022%'
GROUP BY CONCAT(SUBSTR(r.event_date, 1, 4), '-', SUBSTR(r.event_date, 5, 2))
ORDER BY month;


-- Задача 3:
-- шаблон по выгрузке :
--  filial_name ,filial_id,local_id ,abonent_name,identification_number ,mobile_phone
-- (таблицы этими данными находятся в схеме crm2, попробуйте поискать)

-- Мое решение:
SELECT
   cca.filial_id,
   cca.local_id,
   c.name AS abonent_name,
   c.identification_number,
   c.mobile_phone
FROM crm2.crm2_crm_customer_account cca
JOIN crm2.crm2_crm_customer c
   ON cca.customer_id = c.customer_id
WHERE c.is_deleted = 0

-- Задача 4:
-- Попробуйте собрать витрину где будут полные данные про адресов абонента

-- используемые таблицы : 
-- crm2.crm2_crm_customer_account 
-- crm2.crm2_crm_ADDRESS 
-- crm_isb.crm2_isb_street 
-- crm_isb.crm2_isb_town_state 
-- crm_isb.crm2_isb_STREET_TYPE 
-- dataw.dataw_rep_isb_filial_server 
-- crm_isb.crm2_isb_town_type 
-- crm_isb.crm2_isb_state_district  

-- Мое решение:
DESCRIBE crm2.crm2_crm_customer_account;
DESCRIBE crm2.crm2_crm_ADDRESS;
DESCRIBE crm_isb.crm2_isb_street;
DESCRIBE crm_isb.crm2_isb_town_state;
DESCRIBE crm_isb.crm2_isb_STREET_TYPE;
DESCRIBE dataw.dataw_rep_isb_filial_server;
DESCRIBE crm_isb.crm2_isb_town_type;
DESCRIBE crm_isb.crm2_isb_state_district;

SELECT
   acc.customer_account_id,
   acc.local_id AS abonent_code,
   addr.house,
   addr.sub_house,
   addr.flat,
   addr.sub_flat,
   st_type.name AS street_type,
   st.rus_name AS street_name,
   tt.name AS town_type,
   ts.rus_name AS town_name,
   sd.rus_name AS district_name,
   addr.zip_code
FROM crm2.crm2_crm_customer_account acc
JOIN crm2.crm2_crm_address addr
   ON acc.address_id = addr.address_id
JOIN crm_isb.crm2_isb_street st
   ON addr.street_id = st.street_id
LEFT JOIN crm_isb.crm2_isb_street_type st_type
   ON st.street_type_id = st_type.street_type_id
LEFT JOIN crm_isb.crm2_isb_town_state ts
   ON st.town_state_id = ts.id
LEFT JOIN crm_isb.crm2_isb_town_type tt
   ON ts.town_type_id = tt.id
LEFT JOIN crm_isb.crm2_isb_state_district sd
   ON ts.state_district_id = sd.id;

-- Задача 5:
-- Выгрузи абонетов service_id in (110714), узнай сколько абонетов было там за последние 3 месяца и начисления ,так же за год 
-- используемые таблицы : 
-- DATAW.DATAW_REP_MAIN_2SPEC_DETAIL2_V2 
-- DATAW.DATAW_REP_ISB_FILIAL_SERVER 
-- DATAW.DATAW_NSI_TARIFF_PLAN 
-- DATAW.DATAW_NSI_SERVICE

-- Мое решение:
DESCRIBE DATAW.DATAW_REP_MAIN_2SPEC_DETAIL2_V2;
DESCRIBE DATAW.DATAW_REP_ISB_FILIAL_SERVER;
DESCRIBE DATAW.DATAW_NSI_TARIFF_PLAN;
DESCRIBE DATAW.DATAW_NSI_SERVICE;
SELECT
   period_range,
   COUNT(DISTINCT payer_abonent_id) AS abonent_count,
   SUM(sum_debit) AS total_sum_debit
FROM (
   SELECT
       payer_abonent_id,
       sum_debit,
       CASE
           WHEN event_date >= '202503' THEN 'last_3_months'
           WHEN event_date >= '202404' THEN 'last_12_months'
           ELSE NULL
       END AS period_range
   FROM dataw.dataw_rep_main_2spec_detail2_v2
   WHERE service_id = 110714
     AND event_date BETWEEN '202404' AND '202506'
) AS filtered
WHERE period_range IS NOT NULL
GROUP BY period_range;

-- Задача 6:
-- Выгрузить абонентов которые обращались 165 за последние 3 месяца 

-- используемые таблицы : 
-- Asr_union.asr_union_db_tdr_ddt_2023

-- Мое решение: 
SELECT
 abonent_id,
 detail_type_id,
 code_detail,
 service_date,
 debit,
 service_count
FROM asr_union.asr_union_db_tdr_ddt_2023
WHERE service_date >= '2025-03-01'
 AND service_date < '2025-06-01'
LIMIT 100;
-- В базе нету такой записи

-- Задача 7:
-- Собрать все заказы c установкой продуктового предложения Bereket,отдельно вытащить сколько заказов потвердились и сколько отменилось ,так же найти топ 10 городов в котором чаще всего его установливают 

-- используемые таблицы : 
-- drb.drb_aidar_cust_order_full

-- Мое решение: 
SELECT COUNT(*) AS total_orders
FROM drb.drb_aidar_cust_order_full
WHERE LOWER(new_product_offer_name) LIKE '%bereket%';

SELECT COUNT(*) AS confirmed_orders
FROM drb.drb_aidar_cust_order_full
WHERE LOWER(new_product_offer_name) LIKE '%bereket%'
 AND LOWER(status_name) IN ('подтвержден', 'завершен', 'выполнен');


SELECT COUNT(*) AS cancelled_orders
FROM drb.drb_aidar_cust_order_full
WHERE LOWER(new_product_offer_name) LIKE '%bereket%'
 AND LOWER(status_name) IN ('отменен', 'отказ', 'отказан');

SELECT
   town_name_new AS town,
   COUNT(*) AS order_count
FROM drb.drb_aidar_cust_order_full
WHERE LOWER(new_product_offer_name) LIKE '%bereket%'
GROUP BY town_name_new
ORDER BY order_count DESC
LIMIT 10;

-- Задача 8:
-- Собрать все заказы на снятие продуктового предложения Silver,отдельно вытащить сколько заказов потвердились и сколько отменилось ,так же найти топ 10 городов в котором чаще всего снимают эту услугу (для выгрузки адресов используй справочник,который было сделано на 4 задаче )
 
-- используемые таблицы : 
-- crm2.CRM2_CRM_CUST_ORDER
-- crm2.crm2_crm_customer_account
-- crm2.CRM2_CRM_CUST_ORDER_TYPE 
-- crm2.CRM2_crm_Cust_Order_Status 
-- crm_isb.CRM2_ISB_CANCEL_REASON 
-- crm_isb.CRM2_isb_Sales_Channel
-- crm_isb.CRM2_ISB_SALES_CHANNEL_GROUP 
-- crm_isb.CRM2_ISB_MS_SEGMENT_GROUP 
-- crm2.CRM2_CRM_SYS_USER 
-- crm_isb.CRM2_isb_Po_Reject_Reason 
-- crm_isb.CRM2_ISB_RESOURCE_SPECIFICATION 
-- crm_isb.CRM2_ISB_RESOURCE_SPEC_GROUP 
-- crm_isb.CRM2_ISB_NRI_REJECT_REASON
-- bimeg_isb.bimeg_isb_product_offer 
-- bimeg_isb.bimeg_isb_product_offer 
-- dataw.dataw_rep_isb_filial_server 
-- drb.DRB_AIDAR_SERVER_RDT_ODT 
-- dataw.dataw_rep_mview_abonent_contract 
-- crm2.crm2_crm_customer 

-- Мое решение: 
DESCRIBE crm2.CRM2_CRM_CUST_ORDER;
DESCRIBE crm2.crm2_crm_customer_account;
DESCRIBE crm2.CRM2_CRM_CUST_ORDER_TYPE;
DESCRIBE crm2.CRM2_crm_Cust_Order_Status;
DESCRIBE crm_isb.CRM2_ISB_CANCEL_REASON;
DESCRIBE crm_isb.CRM2_isb_Sales_Channel;
DESCRIBE crm_isb.CRM2_ISB_SALES_CHANNEL_GROUP;
DESCRIBE crm_isb.CRM2_ISB_MS_SEGMENT_GROUP;
DESCRIBE crm2.CRM2_CRM_SYS_USER;
DESCRIBE crm_isb.CRM2_isb_Po_Reject_Reason;
DESCRIBE crm_isb.CRM2_ISB_RESOURCE_SPECIFICATION;
DESCRIBE crm_isb.CRM2_ISB_RESOURCE_SPEC_GROUP;
DESCRIBE crm_isb.CRM2_ISB_NRI_REJECT_REASON;
DESCRIBE bimeg_isb.bimeg_isb_product_offer;
DESCRIBE dataw.dataw_rep_isb_filial_server;
DESCRIBE drb.DRB_AIDAR_SERVER_RDT_ODT;
DESCRIBE dataw.dataw_rep_mview_abonent_contract;
DESCRIBE crm2.crm2_crm_customer;
SELECT
   SUBSTR(main.event_date, 1, 7) AS month,
   COUNT(DISTINCT main.payer_abonent_id) AS abonent_count,
   SUM(main.sum_debit) AS total_charge
FROM
   dataw.dataw_rep_main_2spec_detail2_v2 main
JOIN
   dataw.dataw_isb_service_class_elem sce
   ON main.service_class_elem_id = sce.id
WHERE
   main.event_date LIKE '2022%'
   AND sce.code = 'F11-102'     
GROUP BY
   SUBSTR(main.event_date, 1, 7)
ORDER BY
   Month;
  
SELECT
   SUM(CASE WHEN OrderStatus.name = 'Подтвержден' THEN 1 ELSE 0 END) AS Confirmed_Orders_Count,
   SUM(CASE WHEN OrderStatus.name = 'Отменен' THEN 1 ELSE 0 END) AS Cancelled_Orders_Count,
   AddressReference.town_type_name AS City_Name,
   COUNT(CustOrder.id) AS Total_Orders_Per_City
FROM
   crm2.CRM2_CRM_CUST_ORDER CustOrder
JOIN
   bimeg_isb.bimeg_isb_product_offer ProductOffer
   ON CustOrder.old_product_offer_id = ProductOffer.id
JOIN
   crm2.CRM2_CRM_CUST_ORDER_TYPE OrderType
   ON CustOrder.cust_order_type_id = OrderType.id
JOIN
   crm2.CRM2_crm_Cust_Order_Status OrderStatus
   ON CustOrder.status_id = OrderStatus.cust_order_status_id
LEFT JOIN
   (
       SELECT DISTINCT
           ca.customer_account_id,
           tt.name AS town_type_name
       FROM crm2.crm2_crm_customer_account ca
       JOIN crm2.crm2_crm_ADDRESS a
           ON ca.address_id = a.address_id
       LEFT JOIN crm_isb.crm2_isb_street s
           ON a.street_id = s.street_id
       LEFT JOIN crm_isb.crm2_isb_town_state ts
           ON s.town_state_id = ts.town_state_id
       LEFT JOIN crm_isb.crm2_isb_town_type tt
           ON ts.town_type_id = tt.id
   ) AS AddressReference
   ON CustOrder.customer_account_id = AddressReference.customer_account_id
WHERE
   ProductOffer.name LIKE '%Silver%'
   AND OrderType.name = 'Снятие'
GROUP BY
   AddressReference.town_type_name
ORDER BY
   Total_Orders_Per_City DESC
LIMIT 10;