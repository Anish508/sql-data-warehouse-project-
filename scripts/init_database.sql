-- =====================================================
-- Data Warehouse Initialization Script
-- =====================================================

-- Use master database (SQL Server only)
USE master;
GO

-- Create Database (if it does not exist)
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    CREATE DATABASE DataWarehouse;
END
GO

-- Switch to Data Warehouse database
USE DataWarehouse;
GO

-- =====================================================
-- Schema Layers (Medallion Architecture)
-- =====================================================

-- Bronze Layer: Raw data ingestion
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
END
GO

-- Silver Layer: Cleaned and transformed data
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
END
GO

-- Gold Layer: Aggregated and business-ready data
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
END
GO

-- =====================================================
-- Setup Complete
-- =====================================================
