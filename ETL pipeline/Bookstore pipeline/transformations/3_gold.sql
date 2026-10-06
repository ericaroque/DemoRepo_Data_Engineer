CREATE OR REFRESH MATERIALIZED VIEW cn_daily_customers_books
COMMENT "Daily numbers of books per customer in China"

AS

SELECT
  customer_id,
  f_name, 
  l_name, 
  date_trunc("DD",order_timestamp) order_date, 
  sum(quantity) books_counts
FROM
  orders_cleaned
WHERE
  country = 'China'
GROUP BY customer_id, f_name, l_name, date_trunc("DD",order_timestamp) 