FROM bde2020/spark-python-template:2.4.0-hadoop2.7
MAINTAINER alksndr.sbtv@gmail.com


ENV SPARK_APPLICATION_PYTHON_LOCATION /app/entrypoint.py
ENV SPARK_APPLICATION_ARGS "foo bar baz"
