from pyspark import pipelines as dp
from pyspark.sql import functions as F

data_set_path = spark.conf.get("dataset_path")

@dp.table(
    name="orders_raw",
    comment="The raw books orders, ingested from orders-raw",
)
def process_order():
  orders_df = (spark.readStream
                    .format("cloudFiles")
                    .option("cloudFiles.format", "json")
                    .option("cloudFiles.inferColumnTypes", "true")
                    .load(f"{data_set_path}/orders-json-raw")
              )
  return orders_df

@dp.materialized_view
def customers():
  customers_df = (spark.read.json(f"{data_set_path}/customers-json"))
  return customers_df

