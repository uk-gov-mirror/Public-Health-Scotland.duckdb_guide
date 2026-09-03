library(duckdb)
# library(DBI)
library(dotenv)

# Load .env file
load_dot_env()

# Define file paths and encryption key
csv_path <- "data/beds.csv"
parquet_path <- "data/admissions.parquet"
db_path <- "data/encrypted_data.duckdb"

# Read password from environment variable
encryption_key <- Sys.getenv("PWD")

# Create/open encrypted database
con <- dbConnect(
  duckdb::duckdb(),
  dbdir = db_path,
  config = list(password = encryption_key)
)

# Import CSV into encrypted database
dbExecute(
  con,
  sprintf(
    "
    CREATE TABLE beds AS
    SELECT *
    FROM read_csv_auto('%s')
    ",
    csv_path
  )
)

# Import Parquet into encrypted database
dbExecute(
  con,
  sprintf(
    "
    CREATE TABLE admissions AS
    SELECT *
    FROM read_parquet('%s')
    ",
    parquet_path
  )
)

cat("Successfully created encrypted DuckDB file and imported data.\n")

# Close connection
dbDisconnect(con, shutdown = TRUE)

# -----------------------------------------------------------------------------
# Test reading the encrypted database
# -----------------------------------------------------------------------------

con <- dbConnect(
  duckdb::duckdb(),
  dbdir = db_path,
  read_only = TRUE,
  config = list(password = encryption_key)
)

df <- dbGetQuery(
  con,
  "
  SELECT
    QuarterQF,
    HB,
    HBQF,
    Location,
    LocationQF
  FROM beds
  "
)

dbDisconnect(con, shutdown = TRUE)

str(df)
print(df)