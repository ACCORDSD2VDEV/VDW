/*TABLEREPLACEMENTINFILE*/
/*****************************************************************************
Script for validating the VDW.  It will create a shadow VDW in the temporary
tables and then pull out the validation data from that and use it to compare
to the actual VDW tables.  The reason this is done is to avoid typos from 
manually trying to validate each column.  It will validate:
    - Table Names, 
    - Column Names on those Tables
    - Data length for characters, numeric, and date types
    - Precision  for numeric  and date types
    - If Columns allow null values

Script should ignore differences between Unicode  or non-Unicode fields.  Does
not validate exact data types because of equivalences in certain types (
e.g.: numeric(11, 10) is structurally the same as decimal(11, 10).  

Could add default values to columns but some partners may do default values
through their own ETL process rather than having SQL Server doing that.

To Update the script for partner use:

1) Copy the Create statements for the primary priority tables from the DDL 
into this document and update the table names to temporary table names, 
e.g.: from Demographics to #Demographics

2) Update the @TableNameList variable for all of the added tables that
will be validated

Examples below

Output:
    Two result output
    1) The first output is a list of mismatches.  The result field will display 
	   an error about the column there may be a problem.  Column and table name
	   mismatches must be addressed.  Data Type mismatches should be reviewed
	   if they could cause a problem returning data.
    2) Second output is a full list of all results.  
*****************************************************************************/

/*****************************************************************************
BEGIN TempTable Clearing and Creation
*****************************************************************************/
BEGIN
    IF OBJECT_ID('tempdb..#CHORDSTEMPRESULT') IS NOT NULL
    BEGIN
    	   DROP TABLE #CHORDSTEMPRESULT;
    END;
    
    IF OBJECT_ID('tempdb..#DATAVALIDATION') IS NOT NULL
    BEGIN
	   DROP TABLE #DATAVALIDATION;
    END;
    
    CREATE TABLE #DATAVALIDATION (
                 TableName      VARCHAR(250) ,
                 ColumnName     VARCHAR(250) ,
                 IsNullable     VARCHAR(4) ,
                 CharaterLength INT ,
                 [Precision]    TINYINT ,
                 [Scale]        INT ,
                 DT_Preceision  INT
                );
    
    DECLARE @TableNameList TABLE (
                 TableNames VARCHAR(1000)
            );
END;
/*****************************************************************************
END TempTable Clearing and Creation
*****************************************************************************/


/*****************************************************************************
BEGIN Table Create Section: Copy Table statements from the DDL and change table names to the temporary equivalent
*****************************************************************************/
BEGIN
    CREATE TABLE #DEMOGRAPHICS (
             PERSON_ID          NVARCHAR(36) NOT NULL ,
             MRN                NVARCHAR(36) ,
             BIRTH_DATE         DATE NOT NULL ,
             GENDER             NCHAR NOT NULL DEFAULT 'U' ,
             PRIMARY_LANGUAGE   NVARCHAR(3) NOT NULL DEFAULT 'unk' ,
             NEEDS_INTERPRETER  NCHAR NOT NULL DEFAULT 'U' ,
             RACE1              NVARCHAR(2) NOT NULL DEFAULT 'UN' ,
             RACE2              NVARCHAR(2) DEFAULT 'UN' ,
             RACE3              NVARCHAR(2) DEFAULT 'UN' ,
             RACE4              NVARCHAR(2) DEFAULT 'UN' ,
             RACE5              NVARCHAR(2) DEFAULT 'UN' ,
             HISPANIC           NCHAR NOT NULL DEFAULT 'U' ,
             SEXUAL_ORIENTATION NVARCHAR(2) NOT NULL DEFAULT 'UN' ,
             GENDER_IDENTITY    NVARCHAR(2) DEFAULT 'UN' ,
             CONSTRAINT PK_CHORDS_DEMOGRAPHICS PRIMARY KEY CLUSTERED(PERSON_ID)
             );
    
    CREATE TABLE #CENSUS_DEMOG (
             CENSUS_YEAR           INT NOT NULL ,
             GEOCODE               NVARCHAR(15) NOT NULL ,
             [BLOCK]               NVARCHAR(3) NULL ,
             CENSUS_DATA_SRC       NVARCHAR(26) NULL ,
             CHORDS_GEOLEVEL       NVARCHAR(10) NULL ,
             [STATE]               NVARCHAR(2) NULL ,
             COUNTY                NVARCHAR(3) NULL ,
             TRACT                 NVARCHAR(6) NULL ,
             BLOCKGP               NVARCHAR(1) NULL ,
             HOUSES_N              INT NULL ,
             RA_NHS_WH             DECIMAL(11 , 10) NULL ,
             RA_NHS_BL             DECIMAL(11 , 10) NULL ,
             RA_NHS_AM             DECIMAL(11 , 10) NULL ,
             RA_NHS_AS             DECIMAL(11 , 10) NULL ,
             RA_NHS_HA             DECIMAL(11 , 10) NULL ,
             RA_NHS_OT             DECIMAL(11 , 10) NULL ,
             RA_NHS_ML             DECIMAL(11 , 10) NULL ,
             RA_HIS_WH             DECIMAL(11 , 10) NULL ,
             RA_HIS_BL             DECIMAL(11 , 10) NULL ,
             RA_HIS_AM             DECIMAL(11 , 10) NULL ,
             RA_HIS_AS             DECIMAL(11 , 10) NULL ,
             RA_HIS_HA             DECIMAL(11 , 10) NULL ,
             RA_HIS_OT             DECIMAL(11 , 10) NULL ,
             RA_HIS_ML             DECIMAL(11 , 10) NULL ,
             HOUSES_OCCUPIED       DECIMAL(11 , 10) NULL ,
             HOUSES_OWN            DECIMAL(11 , 10) NULL ,
             HOUSES_RENT           DECIMAL(11 , 10) NULL ,
             HOUSES_UNOCC_FORRENT  DECIMAL(11 , 10) NULL ,
             HOUSES_UNOCC_FORSALE  DECIMAL(11 , 10) NULL ,
             HOUSES_UNOCC_RENTSOLD DECIMAL(11 , 10) NULL ,
             HOUSES_UNOCC_SEASONAL DECIMAL(11 , 10) NULL ,
             HOUSES_UNOCC_MIGRANT  DECIMAL(11 , 10) NULL ,
             HOUSES_UNOCC_OTHER    DECIMAL(11 , 10) NULL ,
             EDUCATION1            DECIMAL(11 , 10) NULL ,
             EDUCATION2            DECIMAL(11 , 10) NULL ,
             EDUCATION3            DECIMAL(11 , 10) NULL ,
             EDUCATION4            DECIMAL(11 , 10) NULL ,
             EDUCATION5            DECIMAL(11 , 10) NULL ,
             EDUCATION6            DECIMAL(11 , 10) NULL ,
             EDUCATION7            DECIMAL(11 , 10) NULL ,
             EDUCATION8            DECIMAL(11 , 10) NULL ,
             MEDFAMINCOME          INT NULL ,
             FAMINCOME1            DECIMAL(11 , 10) NULL ,
             FAMINCOME2            DECIMAL(11 , 10) NULL ,
             FAMINCOME3            DECIMAL(11 , 10) NULL ,
             FAMINCOME4            DECIMAL(11 , 10) NULL ,
             FAMINCOME5            DECIMAL(11 , 10) NULL ,
             FAMINCOME6            DECIMAL(11 , 10) NULL ,
             FAMINCOME7            DECIMAL(11 , 10) NULL ,
             FAMINCOME8            DECIMAL(11 , 10) NULL ,
             FAMINCOME9            DECIMAL(11 , 10) NULL ,
             FAMINCOME10           DECIMAL(11 , 10) NULL ,
             FAMINCOME11           DECIMAL(11 , 10) NULL ,
             FAMINCOME12           DECIMAL(11 , 10) NULL ,
             FAMINCOME13           DECIMAL(11 , 10) NULL ,
             FAMINCOME14           DECIMAL(11 , 10) NULL ,
             FAMINCOME15           DECIMAL(11 , 10) NULL ,
             FAMINCOME16           DECIMAL(11 , 10) NULL ,
             MEDHOUSINCOME         INT NULL ,
             HOUSINCOME1           DECIMAL(11 , 10) NULL ,
             HOUSINCOME2           DECIMAL(11 , 10) NULL ,
             HOUSINCOME3           DECIMAL(11 , 10) NULL ,
             HOUSINCOME4           DECIMAL(11 , 10) NULL ,
             HOUSINCOME5           DECIMAL(11 , 10) NULL ,
             HOUSINCOME6           DECIMAL(11 , 10) NULL ,
             HOUSINCOME7           DECIMAL(11 , 10) NULL ,
             HOUSINCOME8           DECIMAL(11 , 10) NULL ,
             HOUSINCOME9           DECIMAL(11 , 10) NULL ,
             HOUSINCOME10          DECIMAL(11 , 10) NULL ,
             HOUSINCOME11          DECIMAL(11 , 10) NULL ,
             HOUSINCOME12          DECIMAL(11 , 10) NULL ,
             HOUSINCOME13          DECIMAL(11 , 10) NULL ,
             HOUSINCOME14          DECIMAL(11 , 10) NULL ,
             HOUSINCOME15          DECIMAL(11 , 10) NULL ,
             HOUSINCOME16          DECIMAL(11 , 10) NULL ,
             POV_LT_50             DECIMAL(11 , 10) NULL ,
             POV_50_74             DECIMAL(11 , 10) NULL ,
             POV_75_99             DECIMAL(11 , 10) NULL ,
             POV_100_124           DECIMAL(11 , 10) NULL ,
             POV_125_149           DECIMAL(11 , 10) NULL ,
             POV_150_174           DECIMAL(11 , 10) NULL ,
             POV_175_184           DECIMAL(11 , 10) NULL ,
             POV_185_199           DECIMAL(11 , 10) NULL ,
             POV_GT_200            DECIMAL(11 , 10) NULL ,
             ENGLISH_SPEAKER       DECIMAL(11 , 10) NULL ,
             SPANISH_SPEAKER       DECIMAL(11 , 10) NULL ,
             BORNINUS              DECIMAL(11 , 10) NULL ,
             MOVEDINLAST12MON      DECIMAL(11 , 10) NULL ,
             MARRIED               DECIMAL(11 , 10) NULL ,
             DIVORCED              DECIMAL(11 , 10) NULL ,
             DISABILITY            DECIMAL(11 , 10) NULL ,
             UNEMPLOYMENT          DECIMAL(11 , 10) NULL ,
             UNEMPLOYMENT_MALE     DECIMAL(11 , 10) NULL ,
             INS_MEDICARE          DECIMAL(11 , 10) NULL ,
             INS_MEDICAID          DECIMAL(11 , 10) NULL ,
             HH_NOCAR              DECIMAL(11 , 10) NULL ,
             HH_PUBLIC_ASSISTANCE  DECIMAL(11 , 10) NULL ,
             HMOWNER_COSTS_MORT    DECIMAL(11 , 10) NULL ,
             HMOWNER_COSTS_NO_MORT DECIMAL(11 , 10) NULL ,
             HOMES_MEDVALUE        INT NULL ,
             PCT_CROWDING          DECIMAL(11 , 10) NULL ,
             FEMALE_HEAD_OF_HH     DECIMAL(11 , 10) NULL ,
             MGR_FEMALE            DECIMAL(11 , 10) NULL ,
             MGR_MALE              DECIMAL(11 , 10) NULL ,
             RESIDENTS_65          DECIMAL(11 , 10) NULL ,
             SAME_RESIDENCE        DECIMAL(11 , 10) NULL ,
             FAMPOVERTY            DECIMAL(11 , 10) NULL ,
             HOUSPOVERTY           DECIMAL(11 , 10) NULL ,
             ZIP                   NVARCHAR(5) NULL ,
             CONSTRAINT PK_CHORDS_CENSUS_DEMOG PRIMARY KEY CLUSTERED(CENSUS_YEAR ASC , GEOCODE ASC)
		   );
    
    CREATE TABLE #CENSUS_LOCATION (
             PERSON_ID             NVARCHAR(36) NOT NULL ,
             LOC_START             DATETIME NOT NULL ,
             LOC_END               DATETIME ,
             GEOCODE               NVARCHAR(15) NULL ,
             GEOCODE_BOUNDARY_YEAR NUMERIC(8) NULL ,
             GEOLEVEL              NCHAR NULL ,
             MATCH_STRENGTH        NCHAR NULL ,
             CITY_GEOCODE          NVARCHAR(35) NULL ,
             LATITUDE              DECIMAL(8 , 6) NULL ,
             LONGITUDE             DECIMAL(9 , 6) NULL ,
             GEOCODE_APP           NVARCHAR(50) NULL ,
             GEOCODE_COUNTY        NVARCHAR(35) NOT NULL ,
             ADDRESS_TYPE_CODE     NCHAR(2) CONSTRAINT PK_CHORDS_CENSUS_LOCATION PRIMARY KEY CLUSTERED(PERSON_ID , LOC_START)
             );
END
/*****************************************************************************
END Table Create Section
*****************************************************************************/

/*****************************************************************************
BEGIN Table Name List: Add or update any table names created or added to @TableNameList
Example below
*****************************************************************************/
BEGIN
    INSERT INTO @TableNameList
    VALUES  ('DEMOGRAPHICS'),
    		  ('CENSUS_DEMOG'),
    		  ('CENSUS_LOCATION');
    
    DECLARE @SQL NVARCHAR(3000);
    DECLARE @NAME VARCHAR(100);
    
    DECLARE CUR CURSOR
    FOR SELECT
               TableNames
        FROM
             @TableNameList;
    
    OPEN CUR;
    
    FETCH NEXT FROM CUR INTO @NAME;
    
    WHILE @@FETCH_STATUS = 0
        BEGIN
    
        SET @SQL =	 'INSERT INTO #datavalidation
    			  SELECT
    	             ''' + @NAME + ''',
    	             a.COLUMN_NAME,
    	             a.IS_NULLABLE,
    	             a.CHARACTER_MAXIMUM_LENGTH,
    	             a.NUMERIC_PRECISION,
    	             a.NUMERIC_SCALE,
    	             a.DATETIME_PRECISION
    	      FROM
    	           tempdb.INFORMATION_SCHEMA.COLUMNS a
    	      WHERE  a.TABLE_NAME LIKE ''#' + @NAME + '%''';
    
            PRINT @SQL;
            EXEC Sp_executesql
                 @SQL;
            FETCH NEXT FROM CUR INTO @NAME;
        END;
    
    CLOSE CUR;
    
    DEALLOCATE CUR; 
END
/*****************************************************************************
END Table Name List
*****************************************************************************/

/*****************************************************************************
BEGIN Table Name Replacement: If a TableName replacement table exists, it will swap out the 
names in the tables for the correct ones based on how it's mapped in their table.
*****************************************************************************/
BEGIN
IF OBJECT_ID('CHORDS_TABLENAMES') IS NOT NULL
    BEGIN
        UPDATE a
               SET a.TableName = b.NEW_NAME
        FROM #datavalidation a JOIN CHORDS_TABLENAMES b ON b.ORG_NAME = a.TableName;
    END;
END;
/*****************************************************************************
END Table Name Replacement
*****************************************************************************/

/*****************************************************************************
BEGIN Analysis Section: Compares the partner's VDW to the shadow version and finds differences
******************************************************************************/
BEGIN
    SELECT
           *
    INTO
         #CHORDSTEMPRESULT
    FROM
    (
        SELECT
               a.TableName,
               a.ColumnName,
               CASE
                   WHEN b.COLUMN_NAME IS NULL
                   THEN 'TABLE OR COLUMN MISSING'
                   WHEN b.COLUMN_NAME IS NOT NULL
                        AND (ISNULL(NULLIF(a.CharaterLength, b.CHARACTER_MAXIMUM_LENGTH), NULLIF(b.CHARACTER_MAXIMUM_LENGTH, a.CharaterLength)) IS NULL
                             AND ISNULL(NULLIF(a.Precision, b.NUMERIC_PRECISION), NULLIF(b.NUMERIC_PRECISION, a.Precision)) IS NULL
                             AND ISNULL(NULLIF(a.Scale, b.NUMERIC_SCALE), NULLIF(b.NUMERIC_SCALE, a.Scale)) IS NULL
                             AND ISNULL(NULLIF(a.DT_Preceision, b.DATETIME_PRECISION), NULLIF(b.DATETIME_PRECISION, a.DT_Preceision)) IS NULL
                             AND a.IsNullable = b.Is_Nullable)
                   THEN 'OK'
                   ELSE 'CONFIG-MISMATCH'
               END AS Result,
               a.Precision ExpectedNumericPrecision,
               b.NUMERIC_PRECISION ActualNumericPrecision,
               a.Scale ExpectedNumericScale,
               b.NUMERIC_SCALE ActualNumericScale,
               a.CharaterLength ExpectedCharaterLength,
               b.CHARACTER_MAXIMUM_LENGTH ActualCharacterLength,
               a.IsNullable ExpectedISNullable,
               b.IS_NULLABLE ActualExpectedISNullable,
               a.DT_Preceision ExpectedDatePrecision,
               b.DATETIME_PRECISION
        FROM
             #datavalidation a
             LEFT JOIN INFORMATION_SCHEMA.COLUMNS b
                  ON a.TableName = b.TABLE_NAME
                     AND a.ColumnName = b.COLUMN_NAME
    ) A;
        
    --Mis-Matches
    SELECT
           *
    FROM
         #CHORDSTEMPRESULT Z
    WHERE  Z.Result != 'OK'; 
    
    --Full Results
    SELECT
           *
    FROM
         #CHORDSTEMPRESULT Z; 
END;
/*****************************************************************************
END Analysis Section
*****************************************************************************/