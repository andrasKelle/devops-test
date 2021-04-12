import psycopg2
import boto3
import json


def get_ssm_parameter_value(ssm_parameter):
    """Returns the value of the ssm parameter object"""
    return ssm_parameter['Parameter']['Value']


# Initialize a boto3 session and create service client to access AWS SSM
session = boto3.Session(region_name='eu-west-3')
ssm = session.client('ssm')

# get values from AWS System Manager parameter store
endpoint_obj = ssm.get_parameter(Name="rds_endpoint", WithDecryption=True)
port_obj = ssm.get_parameter(Name="rds_port", WithDecryption=True)
username_obj = ssm.get_parameter(Name="rds_username", WithDecryption=True)
region_obj = ssm.get_parameter(Name="rds_region", WithDecryption=True)
dbname_obj = ssm.get_parameter(Name="rds_db_name", WithDecryption=True)
password_obj = ssm.get_parameter(Name="rds_password", WithDecryption=True)


ENDPOINT = get_ssm_parameter_value(endpoint_obj)
PORT = get_ssm_parameter_value(port_obj)
USR = get_ssm_parameter_value(username_obj)
REGION = get_ssm_parameter_value(region_obj)
DBNAME = get_ssm_parameter_value(dbname_obj)
PASSWORD = get_ssm_parameter_value(password_obj)


try:
    conn = psycopg2.connect(host=ENDPOINT, port=PORT, database=DBNAME, user=USR, password=PASSWORD)
    # Initialize connection cursor
    cur = conn.cursor()
    print("PostgreSQL server information")
    # Serialize object to print returned data organized
    print(json.dumps(conn.get_dsn_parameters(), sort_keys=True, indent=4))
    # Executing a SQL query
    cur.execute("SELECT version();")
    # Fetch result
    record = cur.fetchone()
    print("You are connected to - ", record, "\n")
except Exception as e:
    print("Database connection failed due to {}".format(e))
