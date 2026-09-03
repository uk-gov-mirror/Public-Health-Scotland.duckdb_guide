import duckdb # package to manage duckdb files
import os # package to read os settings (e.g. OS environment variables)
from dotenv import load_dotenv # package to read a .env file (which may contain sensitive data)

load_dotenv()

# Define your file(s) paths and encryption key
csv_path = "data/beds.csv"
parquet_path = "data/admissions.parquet"
db_path = "data/encrypted_data.duckdb"
encryption_key = str(os.getenv('PWD'))

# Create an encrypted database, if you want a non encrypted file then exclude config argument
con = duckdb.connect(db_path, config={"password": encryption_key})

# Import the CSV file into an encrypted table within the attached database
con.execute(f"""
    CREATE TABLE beds AS 
    SELECT * FROM read_csv_auto('{csv_path}');
""")

# Import the parquet file into an encrypted table within the attached database
con.execute(f"""
    CREATE TABLE admissions AS 
    SELECT * FROM read_csv_auto('{parquet_path}');
""")

print("Successfully created encrypted DuckDB file and imported CSV data.")

# Close the connection
con.close()

# test data
con = duckdb.connect(db_path, read_only=True, config={"password": encryption_key})
df = con.execute('SELECT QuarterQF,HB,HBQF,Location,LocationQF FROM beds').fetchdf()
con.close()
print(df.dtypes)
print(df)
