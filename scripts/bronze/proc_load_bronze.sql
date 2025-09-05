/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
create or alter procedure bronze.load_bronze as 
begin
   declare @start_time datetime, @END_TIME DATETIME
	begin try
	print '========================================================='
	print 'Loading Bronze Layer'
	print '========================================================='

	print ' --------------------------------------------------------'
	print 'Loading CRM Tables'
	print ' --------------------------------------------------------'
	SET @START_TIME = GETDATE();
	PRINT '>> Truncating Tables: bronze.crm_cust_info'
	truncate table bronze.crm_cust_info;
	PRINT '>> Inserting Data Into: bronze.crm_cust_info'
	bulk insert  bronze.crm_cust_info 
	from 'C:\Users\xlosn\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
	firstrow=2,
	 fieldterminator= ',' ,
	 tablock

	)
		SET @END_TIME = GETDATE()
		PRINT '>> LOAD Duration: ' +cast(Datediff(second, @start_time, @end_time)as nvarchar) +' seconds';
		print '>>----------------------------'

		set @start_time =getdate()
	PRINT '>> Truncating Tables: bronze.crm_prd_info'
	truncate table bronze.crm_prd_info

	PRINT '>> Inserting Data Into: bronze.crm_prd_info'
	bulk insert  bronze.crm_prd_info 
	from 'C:\Users\xlosn\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
	firstrow=2,
	 fieldterminator= ',' ,
	 tablock

	)
		SET @END_TIME = GETDATE()
		PRINT '>> LOAD Duration: ' +cast(Datediff(second, @start_time, @end_time)as nvarchar) +' seconds';
		print '>>----------------------------'

		set @start_time =getdate()
	PRINT '>> Truncating Tables: bronze.crm_sales_details'
	truncate table bronze.crm_sales_details 

	PRINT '>> Inserting Data Into: bronze.crm_sales_details'
	bulk insert  bronze.crm_sales_details 
	from 'C:\Users\xlosn\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
	firstrow=2,
	 fieldterminator= ',' ,
	 tablock

	)
		SET @END_TIME = GETDATE()
		PRINT '>> LOAD Duration: ' +cast(Datediff(second, @start_time, @end_time)as nvarchar) +'seconds';
		print '>>----------------------------'



	print ' --------------------------------------------------------'
	print 'Loading ERP Tables'
	print ' --------------------------------------------------------'

	set @start_time=getdate()
	PRINT '>> Truncating Tables: bronze.erp_cust_az12 '
	truncate table  bronze.erp_cust_az12 

	PRINT '>> Inserting Data Into: bronze.erp_cust_az12 '
	bulk insert  bronze.erp_cust_az12 
	from 'C:\Users\xlosn\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	with (
	firstrow=2,
	 fieldterminator= ',' ,
	 tablock

	)
		SET @END_TIME = GETDATE()
		PRINT '>> LOAD Duration: ' +cast(Datediff(second, @start_time, @end_time)as nvarchar) +' seconds';
		print '>>----------------------------'

		set @start_time = getdate()
	PRINT '>> Truncating Tables:  bronze.erp_loc_a101'
	truncate table  bronze.erp_loc_a101

	PRINT '>> Inserting Data Into: bronze.erp_loc_a101'
	bulk insert  bronze.erp_loc_a101 
	from 'C:\Users\xlosn\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	with (
	firstrow=2,
	 fieldterminator= ',' ,
	 tablock

	)
		SET @END_TIME = GETDATE()
		PRINT '>> LOAD Duration: ' +cast(Datediff(second, @start_time, @end_time)as nvarchar) +' seconds';
		print '>>----------------------------'

		set @start_time= getdate()
	PRINT '>> Truncating Tables: bronze.erp_px_cat_g1v2 '
	truncate table bronze.erp_px_cat_g1v2 

	PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2'
	bulk insert  bronze.erp_px_cat_g1v2 
	from 'C:\Users\xlosn\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	with (
	firstrow=2,
	 fieldterminator= ',' ,
	 tablock

	)
		SET @END_TIME = GETDATE()
		PRINT '>> LOAD Duration: ' +cast(Datediff(second, @start_time, @end_time)as nvarchar) +' seconds';
		print '>>----------------------------'
	end try
                begin catch
				print '================================================'
				print 'Error Occured During Loading Bronze Layer'
				print 'Error Message' +cast( Error_message() as nvarchar);
				print 'Error Message' +cast(Error_state() as nvarchar);
				print '================================================'
                end catch
end





