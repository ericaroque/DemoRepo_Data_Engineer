Bookstore Data Engineering Lab

Hands-on Databricks repository exploring incremental ingestion, streaming, data quality and the Bronze–Silver–Gold architecture using a bookstore dataset.

Overview

This repository contains a declarative bookstore pipeline implemented in SQL and Python, alongside notebooks covering core Data Engineering concepts. It documents practical learning and experimentation in Databricks.

The main pipeline reads order files, enriches orders with customer information, applies quality rules and produces daily book quantities per customer in China.

Status: learning project under development. The code contains workspace-specific configuration and requires adaptation and execution checks before reuse. This repository is separate from the planned Olist portfolio project.

Technologies

* Databricks
* Python, PySpark and SQL
* Auto Loader and Spark Structured Streaming
* Delta Lake
* Lakeflow Spark Declarative Pipelines (pyspark.pipelines)
* Unity Catalog concepts: catalogs, schemas, volumes and column masking
