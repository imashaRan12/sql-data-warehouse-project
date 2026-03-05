/*
===========================================================
Create Database and Schemas
===========================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse'after checking if it already exits.
	If it does, it drops the existing database before creating a new one. Additionally, the script sets up three schemas 
	within the 'DataWarehouse' database: 'bronze', 'silver', and 'gold'. 

WARNING:
	Executing this script will result in the loss of all data in the 'DataWarehouse' database if it already exists. 
	Ensure that you have backed up any important data before running this script.
*/

USE master;
GO

--Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create schemas: bronze, silver, and gold
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
