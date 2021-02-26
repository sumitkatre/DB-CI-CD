import datetime
import logging
import os
import io
import json 
import random_names 
import db_connection 
import sqlalchemy
import six
from google.cloud import bigquery

from flask import Flask, render_template, request, Response

logger = logging.getLogger()

# This global variable is declared with a value of `None`, instead of calling
# `init_connection_engine()` immediately, to simplify testing. In general, it
# is safe to initialize your database connection pool when your script starts
# -- there is no need to wait for the first request.
db = None

def create_tables():
    global db
    db = db_connection.init_connection_engine()
    # Create tables (if they don't already exist)
    with db.connect() as conn:
        conn.execute(
            "CREATE TABLE IF NOT EXISTS votes "
            "( vote_id SERIAL NOT NULL, time_cast timestamp NOT NULL, "
            "candidate VARCHAR(16) NOT NULL, PRIMARY KEY (vote_id) );"
        )
    # os.system("ls -lrt")
    # os.system("echo conn")

team = "sumit"
time_cast = "katre"
candidate = "win"
stmt = "jeeto"
ct = datetime.datetime.now() 
#name_id = random.getrandbits(1)
name_id = random_names.First() 

def save_vote():
    stmt = sqlalchemy.text(
        "INSERT INTO votes (time_cast, candidate)"
        " VALUES (:time_cast, :candidate)"
    )
    try:
        # Using a with statement ensures that the connection is always released
        # back into the pool at the end of statement (even if an error occurs)
        with db.connect() as conn:
            conn.execute(stmt, time_cast=ct, candidate=name_id)
    except Exception as e:
        # If something goes wrong, handle the error in this section. This might
        # involve retrying or adjusting parameters depending on the situation.
        # [START_EXCLUDE]
        logger.exception(e)
        os.system("e")
        print("***************************************************")
        print(e)
        print("***************************************************")
#json_object = 0
votes = []
def get_index_context():
    
    try:
        with db.connect() as conn:
            # Execute the query and fetch all results
            recent_votes = conn.execute(
                "SELECT * FROM votes ")                
            #).fetchall()
            for row in recent_votes:
                #votes.append({'name': row[2]})
                votes.append({'age': row[0], 'date': row[1], 'name': row[2]})
                #print(row)
            
            json_string = json.dumps(votes, indent=4, sort_keys=True, default=str)
            print("**************")
            print(json_string)
            json_object = json.loads(json_string)
            print("**************")
            #print(json_object)
            #print("**************")
            #return json_object
            return json_object
        #f = open("demofile2.txt", "w")
        #f.write( "%s\n" % sumit_1 )
        #f.close()


            #for rows in votes:
                #print( rows )
                #f.write( "%s\n" % rows )
            #f.write( "%s\n" % votes )
            
    except Exception as e:
        # If something goes wrong, handle the error in this section. This might
        # involve retrying or adjusting parameters depending on the situation.
        # [START_EXCLUDE]
        logger.exception(e)
        os.system("e")
        print("***************************************************")
        print(e)
        print("***************************************************")
       
create_tables()
save_vote()


# Construct a BigQuery client object.
client = bigquery.Client()

# TODO(developer): Set table_id to the ID of the table to create.
table_id = "taxirides.taxi"

job_config = bigquery.LoadJobConfig(
    schema=[
        bigquery.SchemaField("name", "STRING"),
        bigquery.SchemaField("age", "INTEGER"),
        bigquery.SchemaField("date", "DATETIME"),
    ],
    source_format=bigquery.SourceFormat.NEWLINE_DELIMITED_JSON,
)
#uri = "gs://cloud-samples-data/bigquery/us-states/us-states.json"

#print(uri)
try:
    json_object = get_index_context()
    print(json_object)
    f = open("demofile2.txt", "rb")
    load_job = client.load_table_from_json(
        json_object,
        table_id,
        location="US",  # Must match the destination dataset location.
        job_config=job_config,
    )  # Make an API request.

    load_job.result()  # Waits for the job to complete.

    dml_statement = (
    "UPDATE taxirides.taxi "
    "SET age = 101 "
    "WHERE name like '%Aditya%'")
    query_job = client.query(dml_statement)  # API request
    query_job.result()  # Waits for statement to finish

except Exception as e:
        # If something goes wrong, handle the error in this section. This might
        # involve retrying or adjusting parameters depending on the situation.
        # [START_EXCLUDE]
        logger.exception(e)
        os.system("e")
        print("***************************************************")
        print(e)
        print("***************************************************")

destination_table = client.get_table(table_id)
print("Loaded {} rows.".format(destination_table.num_rows))

f.close()