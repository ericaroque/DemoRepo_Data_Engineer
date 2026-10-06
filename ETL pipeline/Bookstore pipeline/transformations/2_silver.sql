CREATE OR REFRESH STREAMING TABLE  orders_cleaned (
    CONSTRAINT prositive_quantity EXPECT(quantity > 0) ON VIOLATION DROP ROW,
    CONSTRAINT valid_customer EXPECT(f_name is not null and l_name is not null) ON VIOLATION FAIL UPDATE,
    CONSTRAINT recent_order EXPECT(order_timestamp >= '2022-07-15')
)

COMMENT "The cleaned books orders with valid order_id"

AS SELECT 
    o.order_id,
    o.quantity,
    o.customer_id,
    c.profile:first_name AS f_name,
    c.profile:last_name AS l_name,
    from_unixtime(o.order_timestamp, 'yyyy-MM-dd HH:mm:ss') AS order_timestamp,
    o.books,
    c.profile:address:country AS country
FROM STREAM orders_raw o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id

