Script General Instructions and Descriptions

Instructions
	The scripts contained in this ZIP file can be used to create a CHORDS 3.1 VDW.  It is recommended that you create 
	a fresh database to populate your data rather than try to upgrade your existing VDW although you are welcome to pursue 
	that option so long as the end result will match as if you had started from scratch.
	
Step 1 - 1_Lookup_Tables.sql
	Script file that will generate multiple value lookup tables.  These tables are necessary to help validate 
	data.  Many of the foreign keys generated will rely on these tables

Step 2 - 2_Primary_Tables.sql
	Script file that will create the tables where the ETL processes will load data.  Even if data will not be 
	loaded into the tables by the ETL process, it is still recommended that the tables still be created to help 
	prevent query errors in future queries.

Step 3 - 3_Census_Demog
	You have two options to load the data for the CENSUS_DEMOG table.  

	Option 1 is to run the 3_Census_Demog_script.sql script file in SQL Server Management Studio.  
	This will insert the data into the CENSUS_DEMOG table in your VDW.  You will need to edit the /*DATABSAE NAME*/ 
	from a comment to the database that the data will be inserted into and the /*DATABASE SCHEMA/TABLE*/ to the schema
	and/or table that will be used.

	Option 2 is to use the 3_Census_Demog_Data.csv file.  You can use this file to import the data into your VDW with
	SSMS data import wizard.

Step 4 - 4_Foreign_Keys.sql
	This Script file that will add the foreign keys to your VDW Tables.
	*Before running step 4, it's recommended you review your ETL Process.  Once the keys are created you may run into a
	"Chicken and the Egg" situaion loading data.  The Toggle Keys.txt file has some commands to help turn off keys for ETL
	loading once the keys are added to the database but proactivly reviwing your ETL before adding foreign keys
	should help cut down on the amount of bugs and issues you may run into.

Step 5 - 5_Index_Creation.sql
	Script file that will add indexes to your database.  This will help increase performance for queries.
	Adding indexes and may result in larger than necessary databases and slow performance if you are trying to 
	and delete large amounts of data while debugging your ETL process.  It's recommended you solify your ETL process
	for the VDW 3.1 first before adding the indexes.

Tips

1) Reset_Database.txt
	Included with a fully commented out set of commands to try and prevent accidental execution.
	This file contains commands to drop tables, truncate tables, and delete all CHORDS Foreign Keys.
	Run all together they will wipe out all of the data, tables, and keys in the 3.1 VDW so use them with caution

2) Toggle Keys.txt
	Commands that can be used to disable key checking and enable key checking.  This can be useful for your ETL process.
	Note that if you try to delete a whole table that a foreign key is referencing, you would still receive an error.  Also
	once key checking is turned off, you must turn it back on.  At that time Sql Server will validate the columns data against
	the foreign columns values.  If there is a mis-match, an error will be thrown and the key will remain turned off until the
	un-allowed value is removed/altered.  Finally, these commands apply to whole databases so they will affect all keys in that
	database.  If you need to keep some keys active, you would need to adapt the commands to run on certain tables.