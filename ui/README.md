# Duck db user interface
This directory contains the user interface components for DuckDB, a high-performance database management system. The UI is designed to provide an intuitive and user-friendly experience for interacting with DuckDB databases.

# pre-requisites
- You need to install DuckDB first. Please follow the instructions in the main README.md file.
- You need to install ui extension if you want to use the UI functionalities.
```
INSTALL ui;
LOAD ui;
```

- Set your proxy if you are behind a firewall or VPN.
```
set HTTP_PROXY='http://proxy.nss.scot.nhs.uk:3128';
```
- You can execute DuckDB UI with the following command:
```
CALL ui_start();
```

- You will see this result in your PowerShell/terminal:

![Terminal with commands results](img/image.png)
