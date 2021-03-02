import logging
import os
import io
import db_create_insert_fetch_data
from google.cloud import bigquery

logger = logging.getLogger()

# Construct a BigQuery client object.
client = bigquery.Client()

table_id = "taxirides.taxi"

job_config = bigquery.LoadJobConfig(
    schema=[
        bigquery.SchemaField("name", "STRING"),
        bigquery.SchemaField("age", "INTEGER"),
        bigquery.SchemaField("date", "DATETIME"),
    ],
    source_format=bigquery.SourceFormat.NEWLINE_DELIMITED_JSON,
)

try:
    json_object = db_create_insert_fetch_data.fetch_db_data()
    print(json_object)
    load_job = client.load_table_from_json(
        json_object,
        table_id,
        location="US",  # Must match the destination dataset location.
        job_config=job_config,
    )  # Make an API request.

    load_job.result()  # Waits for the job to complete.

except Exception as e:
        logger.exception(e)        
        print("***************************************************")
        print(e)
        print("***************************************************")

destination_table = client.get_table(table_id)
print("Loaded {} rows.".format(destination_table.num_rows))