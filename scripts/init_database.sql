-- =====================================================
-- Create Database and Schemas
-- =====================================================

-- Purpose:
-- This script initializes the Data Warehouse environment
-- by creating a dedicated database and organizing it into
-- multiple schema layers based on the medallion architecture.
--
-- The DataWarehouse database acts as the central storage
-- for all data.
--
-- The bronze schema is used for raw, unprocessed data ingestion.
-- The silver schema stores cleaned and transformed data.
-- The gold schema contains aggregated, business-ready data
-- for reporting and analytics.
--
-- This layered approach improves data quality, maintainability,
-- and query performance.

-- Warning:
-- This script is designed for SQL Server and uses system views
-- like sys.databases and sys.schemas.
--
-- Ensure you have sufficient permissions to create databases
-- and schemas.
--
-- Running the script without proper checks may result in errors
-- if the database or schemas already exist (handled here using
-- IF NOT EXISTS).
--
-- Avoid modifying or dropping schemas in production environments
-- without proper backups.
--
-- Always validate naming conventions and environment settings
-- before execution.

-- =====================================================

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
