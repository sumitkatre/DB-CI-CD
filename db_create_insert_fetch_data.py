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

#To Create Table 
def create_tables():
    db = db_connection.init_connection_engine()
    # Create tables (if they don't already exist)
    with db.connect() as conn:
        conn.execute(
            "CREATE TABLE IF NOT EXISTS votes "
            "( vote_id SERIAL NOT NULL, time_cast timestamp NOT NULL, "
            "candidate VARCHAR(16) NOT NULL, PRIMARY KEY (vote_id) );"
        )

ct = datetime.datetime.now() 
name_id = random_names.First() 
# To Udate Table 
def insert_db_data():
    stmt = sqlalchemy.text(
        "INSERT INTO votes (time_cast, candidate)"
        " VALUES (:time_cast, :candidate)"
    )
    try:
        # Using a with statement ensures that the connection is always released
        # back into the pool at the end of statement (even if an error occurs)
        db = db_connection.init_connection_engine()
        with db.connect() as conn:
            conn.execute(stmt, time_cast=ct, candidate=name_id)
    except Exception as e:
        logger.exception(e)
        os.system("e")
        print("***************************************************")
        print(e)
        print("***************************************************")

db_data = []
#To Read Data From DB
def fetch_db_data():
    
    try:
        db = db_connection.init_connection_engine()
        with db.connect() as conn:
            # Execute the query and fetch all results
            raw_db_data = conn.execute(
                "SELECT * FROM votes ")                
            #).fetchall()
            for row in raw_db_data:
                db_data.append({'age': row[0], 'date': row[1], 'name': row[2]})                
            
            json_string = json.dumps(db_data, indent=4, sort_keys=True, default=str)
            #print("**************")
            #print(json_string)    
            #print("**************")        
            #print(db_data)            
            print("**************")
            json_object = json.loads(json_string)
            #print(json_object)
            print("**************")

            return json_object
            
        
            #f = open("demofile2.txt", "w")
            #f.write( "%s\n" % json_string )
            #f.close()
            #for rows in votes:
                    #print( rows )
                    #f.write( "%s\n" % rows )
                #f.write( "%s\n" % votes )
            
    except Exception as e:
        logger.exception(e)
        os.system("e")
        print("***************************************************")
        print(e)
        print("***************************************************")
       
# create_tables()
#insert_db_data()
#fetch_db_data()