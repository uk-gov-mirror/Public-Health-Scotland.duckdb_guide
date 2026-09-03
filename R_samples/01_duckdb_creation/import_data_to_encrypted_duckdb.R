library(duckdb)
library(dotenv)
library(glue)

# Load .env file
load_dot_env()

# Define file paths and encryption key
csv_path <- "data/beds.csv"
parquet_path <- "data/admissions.parquet"
db_path <- "data/encrypted_data.duckdb"
encryption_key <- Sys.getenv("DUCKDB_KEY")

# 1. Start an in-memory DuckDB
con <- dbConnect(duckdb::duckdb())

# 2. Attach the encrypted database
dbExecute(
  con,
  glue("INSTALL httpfs;
  LOAD httpfs;
  ATTACH '{db_path}' AS enc (
      ENCRYPTION_KEY '{encryption_key}',
      ENCRYPTION_CIPHER 'GCM'
  );
  USE enc;")
)

# 3. Import CSV into encrypted database 
# you can modify the select statement to specify which columns yo want to import
dbExecute(
  con,
  glue("
    CREATE TABLE beds AS
    SELECT *
    FROM read_csv_auto('{csv_path}')
    ")
)

# Import Parquet into encrypted database
# you can modify the select statement to specify which columns yo want to import
dbExecute(
  con,
  glue("
    CREATE TABLE admissions AS
    SELECT *
    FROM read_parquet('{parquet_path}')
    ")
)

print("Successfully created encrypted DuckDB file and imported data.\n")

# 4. Disconnect
dbDisconnect(con, shutdown = TRUE)


# -----------------------------------------------------------------------------
# Test reading the encrypted database
# -----------------------------------------------------------------------------

con <- dbConnect(
  duckdb::duckdb(),
  read_only = TRUE
)

dbExecute(
  con,
  glue("
  ATTACH '{db_path}' AS enc (
      ENCRYPTION_KEY '{encryption_key}',
      ENCRYPTION_CIPHER 'GCM'
  );
  USE enc;")
)

df <- dbGetQuery(
  con, "
  SELECT
    QuarterQF,
    HB,
    HBQF,
    Location,
    LocationQF
  FROM beds")

dbDisconnect(con, shutdown = TRUE)

str(df)
print(df)
