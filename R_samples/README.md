# Installation
- Run the following R code: `install.packages("duckdb")`

# DUCKDB ways to work
- In memory: when you don't load a duckdb file
- From a duckdb file: when you have a duckdb file or you want to create one

# SQL statements
- Duckdb work with sql statements. If you have a 500 MB csv file and you only want a specify part of the data. You will reduce memory consumption. For example you can run this statement `select id, name from my_data.csv where city = 'New York';`

# DuckDB can perform better than parquet files with partitioning
= Hundreds of small parquet files (less than 5 MB) can slow down when reading those files. Consider migration to duckdb
- You can store more than 1 table in a duckdb file
- You can add a password to encrypt your duckdb file
- If you have very large files (10 GB each), you can create a master metadata file (in DuckDB or CSV format) because it is a powerful way to track, organize, and query your distributed DuckDB files. It acts like a catalog or index, helping you manage and access your data efficiently. See metadata.csv
