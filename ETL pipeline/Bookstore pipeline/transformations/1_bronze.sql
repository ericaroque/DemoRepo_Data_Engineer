CREATE OR REFRESH STREAMING TABLE orders_raw
COMMENT "The raw books orders, ingested from orders"
AS SELECT * 
FROM STREAM read_files(
  "${dataset_path}/orders-json-raw",
  format => "json"
);

CREATE OR REFRESH MATERIALIZED VIEW customers
COMMENT "The customers lookup table, ingested from customers"
AS SELECT * FROM read_files(
  "${dataset_path}/customers-json",
  format => "json"
);