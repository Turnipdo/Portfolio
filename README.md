# PyODBC Data Import Into SSMS :atom:
Using Python's pyodbc module to connect to Microsoft SQL Server and import data into SSMS.

## Additional info :warning:
This mini project offers an alternative method to importing data into SSMS compared to the process shown in "Alex The Analyst's" Data Analyst Portfolio Project | SQL Data Exploration | Project 1/4 video.<br>
[Link to his video](https://www.youtube.com/watch?v=qfyynHBFOsM)

* Initially, I was unable to import the data into SSMS directly from Excel as a data source.

* Instead, I utilized the pyodbc package in Python to create my tables, which allowed me to insert my data afterward.

* You'll notice that I had to use the `fillna()` function in order to convert them to an acceptable `NULL` value for SSMS.

* The benefit of doing this is that it avoids the need for us to use a `CAST()` or any type of `CONVERT()` to an int datatype because the tables created initially are of float datatypes.

***Note***: *While I fully agree that I could have simply imported a flat file source in SSMS, I opted to explore something different, hence my use of pyodbc as an alternative.* :trollface:

## Requirements :basecamp:
* `SQL Server`
* `SSMS`
* `ODBC Driver For SQL Server`
* `VSCode`
* `PyODBC module`
* `pandas`
* `numpy`

## Instructions :page_with_curl:
* Configure SQL Server and ensure you have an ODBC Driver setup already.
* pip install the `pyodbc`, `pandas`, `numpy` module in VSCode's terminal.
* Use the code.
