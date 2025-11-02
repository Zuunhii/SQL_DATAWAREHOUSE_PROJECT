
Create or alter procedure bronze.proc_load_bronze AS
begin 
	declare @start_time DATETIME, @end_time DATETIME;
	begin try
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';

		set @start_time = GETDATE();
		--CRM
		--cust_info
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		truncate table bronze.crm_cust_infor;
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		bulk insert bronze.crm_cust_infor
		from 'D:\DWH_PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		With (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';	 
		PRINT '>> -----------------------------------------------';	


		set @start_time = GETDATE();
		-- prd_info
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info
		from 'D:\DWH_PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		With (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';	 
		PRINT '>> -----------------------------------------------';	



		set @start_time = GETDATE();
		--sales_details
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'D:\DWH_PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		With (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';	 
		PRINT '>> -----------------------------------------------';	


		PRINT '------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------';
		--ERP
		--cuz_az12
		set @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12;
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		bulk insert bronze.erp_cust_az12
		from 'D:\DWH_PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		With (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';	 
		PRINT '>> -----------------------------------------------';	


		set @start_time = GETDATE();
		--LOC_A101
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;
		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from 'D:\DWH_PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		With (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';	 
		PRINT '>> -----------------------------------------------';	


		set @start_time = GETDATE();
		--PX_CAT_g1v2
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2
		from 'D:\DWH_PROJECT\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		With (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + 'seconds';	 
		PRINT '>> -----------------------------------------------';	

	end try
	begin catch
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='

	end catch
end

