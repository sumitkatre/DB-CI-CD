import datetime
import logging
import os
import io
import db_create_insert_fetch_data
from google.cloud import bigquery

from flask import Flask, render_template, request, Response

logger = logging.getLogger()

# Construct a BigQuery client object.
client = bigquery.Client()

# TODO(developer): Set table_id to the ID of the table to create.
table_id = "taxirides.taxi"

try:
    json_object = db_create_insert_fetch_data.fetch_db_data()
    #print("**************")
    print(json_object)
    #print("**************")
    for list in json_object:
        dict = list
        # print(dict)
        name = dict['name']         
        date = dict['date']
        age = str(dict['age'])
        #str(age)
        # 
        dml_statement1 = (
            "UPDATE taxirides.taxi "
            "SET age = 100 "
            "WHERE name like '%Olivie%'")  
        print(dml_statement1)
        
        dml_statement = (
        "UPDATE taxirides.taxi"
        " SET age = "
        + age + 
        " , date = "
        '\'' + date + '\''
        " WHERE name like "
        '\'%' + name + '%\''
        )

        print(dml_statement)
        query_job = client.query(dml_statement)  # API request
        query_job.result()  # Waits for statement to finish


            #     MERGE taxirides.taxi d
            # USING (select * from "postgres".get_votes_data_func()) s
            # ON
            # s.candidate = s.name
            # WHEN MATCHED THEN
            # UPDATE SET
            #     age = s.vote_id,
            #     date = s.time_cast
            # WHEN NOT MATCHED BY TARGET THEN
            # INSERT (
            #     name,
            #     date,
            #     age)
            # VALUES (
            #     s.candidate,
            #     s.time_cast,
            #     s.vote_id);



except Exception as e:
        logger.exception(e)
        print("***************************************************")
        print(e)
        print("***************************************************")

destination_table = client.get_table(table_id)
print("Loaded {} rows.".format(destination_table.num_rows))
