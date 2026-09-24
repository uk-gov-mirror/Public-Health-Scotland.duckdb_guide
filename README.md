# DuckDB guide

DuckDB is an in-process SQL OLAP database management system. It is simple, feature-rich, fast, and open source. The recommended version is 1.4.4 (February 2026). If you only want to code in R, check the `R_samples` folder.

## DuckDB ecosystem
1. DuckDB programming language packages: These packages allow users to easily integrate DuckDB into R and Python projects.
2. DuckDB OS tooling: This software can be installed at the operating system level (for example, Windows or Linux). It includes extensions for reading Excel files and PostgreSQL databases, a web-based user interface, and other useful features.

Note: The DuckDB packages for R and Python can be installed directly from CRAN and PyPI, respectively. Installation of the DuckDB command-line (OS) tooling is optional and is only required if you intend to use DuckDB outside Posit Workbench.

## Use cases
1. DuckDB in R/Python projects: If you work with multiple Parquet files, DuckDB is worth considering because it can manage multiple tables within a single database file. It also makes it easy to update data using SQL, and DuckDB 1.4 and later includes support for database encryption.
2. DuckDB OS tooling: Provides a lightweight local alternative for ad hoc data exploration and analysis. There is no need to open a Posit Workbench session for simple tasks such as reading supported file formats (for example, Parquet and CSV), transforming data, or exporting it to a different format.

## Guide by topic

| Topic            | More info                                          |
|------------------|----------------------------------------------------|
| R/Python package | [View script examples README](./scripts/README.md) |
| OS tool          | [View OS tool README](./OS_tool/README.md)         |
| UI (OS tool)     | [View UI README](./ui/README.md)                   |
| Common queries   | [View common queries README](./common_queries/)    |
| DuckDB views     | [View views README](./view/README.md)              |

## Resources

-   [Official website](https://duckdb.org/)
-   [R functions and DuckDB performance](https://gsandrof66.github.io/Rperformance/Basic_perf.html)
