./cloud_sql_proxy -instances=refined-magpie-270710:europe-west4:ci-cd-db=tcp:5432 \
                  -credential_file=./proxy.json &

sleep 5

PGPASSWORD=ikea123 psql -f ./data.sql "host=127.0.0.1 sslmode=disable dbname=sandy user=postgres"

