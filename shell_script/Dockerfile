# build environment
FROM alpine as postgres
COPY . ./
RUN apk add postgresql
RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.386 -O cloud_sql_proxy
RUN chmod +x cloud_sql_proxy

RUN ./cloud_sql_proxy -instances=refined-magpie-270710:europe-west4:ci-cd-db=tcp:5432 \
                  -credential_file=proxy.json &
RUN echo "done with config"