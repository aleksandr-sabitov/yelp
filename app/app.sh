#!/bin/bash
date
mkdir /tmp/yelp
echo "Exctracting JSONs from Yelp tar file (few minutes)..."
tar -C /tmp/yelp -xvf /tmp/yelp.tar
echo "Converting JSONs to Parquet (few minutes...) and opening Spark SQL session..."
spark/bin/spark-sql -S -f /tmp/convert_to_parquet.sql
spark/bin/spark-sql -S -i /tmp/sql_examples.sql