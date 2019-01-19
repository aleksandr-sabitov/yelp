FROM registry.opensource.zalan.do/stups/ubuntu:latest
MAINTAINER alksndr.sbtv@gmail.com


# all APIs, clients, ...
COPY scripts/prepare.sh /tmp/prepare.sh
RUN /tmp/prepare.sh

# Spark envs
ENV SPARK_HOME=/usr/lib/Spark
ENV PATH=$PATH:/usr/lib/Spark/bin

# startup script
COPY scripts/entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["entrypoint.sh"]
