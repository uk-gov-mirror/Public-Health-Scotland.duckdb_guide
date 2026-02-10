# DuckDB user interface

This directory contains the user interface components for DuckDB, a high-performance database management system. The UI is designed to provide an intuitive and user-friendly experience for interacting with DuckDB databases.

# Pre requirements

-   You need to install DuckDB. Please, follow the instructions in the main README.md file.
-   Make sure you have copied the file .duckdbrc in your user folder (C:\Users\your_user_name). This file contains the proxy configuration for duckdb. If you don't copy this file, you won't be able to install extensions and use the user interface.
-   You need to install ui extension if you want to use the UI functionalities.

```         
INSTALL ui;
LOAD ui;
```

-   You can execute DuckDB UI with the following command (set HTTP_PROXY will be needed if you are behind a firewall/VPN):

```         
CALL start_ui();
```

-   You will see this result in your PowerShell/terminal:

![Terminal with commands results](img/image.png)

-   This command will open a new tab in your default web browser. You can start using DuckDB UI. You will see a blank Notebook.

## How to read a csv file
You can run the following command in a cell:

```
select * from 'C:\Users\<Your_user>\OneDrive - NHS Scotland\Documents\\beds.csv';
```

![alt text](img/image-2.png)

Since you are using DuckDB on Windows you need to use double backslashes (\\) in the path.
