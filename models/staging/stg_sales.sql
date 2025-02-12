 
{{ config(materialized='table') }}

SELECT 
    invoicedate::DATE AS transaction_date,
    stockcode AS product_id,
    description AS product_name,
    customerid AS customer_id,
    country,
    quantity,
    unitprice,
    quantity * unitprice AS revenue
FROM {{ source('public', 'ecommerce_sales') }}
