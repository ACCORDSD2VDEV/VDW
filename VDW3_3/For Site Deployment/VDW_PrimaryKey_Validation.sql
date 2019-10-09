/*TABLEREPLACEMENTINFILE*/
/*****************************************************************************
Script for validating the VDW Primary Keys.  It will create two lists.  One of
the Expected Tables and their primary keys and another of all the tables currently in
the partner VDW.  It will validate:
    - Compare the expected primary key to the primary key of each
	table in a partner's VDW
	- The number of records that currently violate the exepcted primary key

FOR DEVELOPERS:
To Update the script for partner use:

1) Edit the #PKVALIDATION table insertion if the primary keys of the VDW have
changed or add new entires for new tables.  One row per primary key column.

Examples below:

Output:
    One output table
    1) 	Shows the Table name, the expected primary key, the found primary key,
	and the result of the comparision between the expected and found primary keys.
	KeyMatchResultValues:
		- OK: Expected primary key matches the found primary key
		- KEY MISMATCH: Expected Primary Key does not matc the found primary key
		- TABLE OR KEYS NOT FOUND: No table in the VDW matches the expected table
		- UNKNOWN: An unknow error occured
	ViolationCount:
		- The number of records that that appear to violate the expected primary key.
*****************************************************************************/

/*****************************************************************************
BEGIN TempTable Clearing and Creation
*****************************************************************************/
SET NOCOUNT ON;
BEGIN
   
    IF OBJECT_ID('tempdb..#PKVALIDATION') IS NOT NULL
    BEGIN
	   DROP TABLE #PKVALIDATION;
    END;

	CREATE TABLE #PKVALIDATION (
		Table_Name      VARCHAR(250) ,
        Column_Name     VARCHAR(250)
    );

	IF OBJECT_ID('tempdb..#KeyMatchResult') IS NOT NULL
    BEGIN
	   DROP TABLE #KeyMatchResult;
    END;

	IF OBJECT_ID('tempdb..#PKVIOLATIONS') IS NOT NULL
    BEGIN
	   DROP TABLE #PKVIOLATIONS;
    END;
    
	CREATE TABLE #PKVIOLATIONS (
		Table_Name      VARCHAR(250) ,
        Violation_Count BIGINT
    );

END;
/*****************************************************************************
END TempTable Clearing and Creation
*****************************************************************************/

/*****************************************************************************
BEGIN Table Create Section
*****************************************************************************/

INSERT INTO #PKVALIDATION
VALUES      (
       'CENSUS_DEMOG', 'CENSUS_YEAR'), (
       'CENSUS_DEMOG', 'GEOCODE'), (
       'EVERNDC', 'NDC'), (
       'EVERNDC', 'GENERIC'), (
       'PROVIDER_SPECIALTY', 'PROVIDER'), (
       'DEATH', 'PERSON_ID'), (
       'CAUSE_OF_DEATH', 'PERSON_ID'), (
       'CAUSE_OF_DEATH', 'COD'), (
       'DEMOGRAPHICS', 'PERSON_ID'), (
       'LINKAGE', 'LINK_ID'), (
       'LINKAGE', 'LINE'), (
       'BENEFIT', 'BENEFIT_ID'), (
       'ENCOUNTERS', 'ENC_ID'), (
       'DIAGNOSES', 'DIAGNOSES_ID'), (
       'ENROLLMENT', 'PERSON_ID'), (
       'ENROLLMENT', 'ENR_START'), (
       'LAB_RESULTS', 'LAB_RESULTS_ID'), (
       'PRO_SURVEYS', 'PRO_ID'), (
       'PRO_QUESTIONS', 'PRO_ID'), (
       'PRO_QUESTIONS', 'QUESTION_ID'), (
       'PRO_QUESTIONS', 'QUESTION_VER'), (
       'PRO_RESPONSES', 'RESPONSE_ID'), (
       'PHARMACY', 'PHARMACY_ID'), (
       'PRESCRIBING', 'PRESCRIBING_ID'), (
       'PROCEDURES', 'PROCEDURES_ID'), (
       'SOCIAL_HISTORY', 'SOCIAL_HISTORY_ID'), (
       'VITAL_SIGNS', 'VITAL_SIGNS_ID'), (
       'TUMOR', 'TUMOR_ID'), (
       'LANGUAGES', 'PERSON_ID'), (
       'LANGUAGES', 'LANG_ISO'), (
       'CENSUS_LOCATION', 'PERSON_ID'), (
       'CENSUS_LOCATION', 'LOC_START');
/*****************************************************************************
BEGIN Table Name Replacement: If a TableName replacement table exists, it will swap out the 
names in the tables for the correct ones based on how it's mapped in their table.
*****************************************************************************/

BEGIN
IF OBJECT_ID('CHORDS_TABLENAMES') IS NOT NULL
    BEGIN
        UPDATE a
               SET a.Table_Name = b.NEW_NAME
        FROM #PKVALIDATION a JOIN CHORDS_TABLENAMES b ON b.ORG_NAME = a.Table_Name;
    END;
END;

/*****************************************************************************
END Table Name Replacement
*****************************************************************************/

/*****************************************************************************
BEGIN Analysis Section: Compares the partner's primary keys to the expected keys
******************************************************************************/
SELECT * INTO #KeyMatchResult
FROM (
SELECT            
       ExpectKeys.TABLE_NAME, 
       ExpectKeys.COLUMN_NAMES AS Expected_Primary_Key, 
       CurrKeys.COLUMN_NAMES AS Found_Primary_Key,
       CASE
           WHEN CurrKeys.TABLE_NAME IS NULL
           THEN 'TABLE OR KEYS NOT FOUND'
           WHEN ExpectKeys.COLUMN_NAMES != CurrKeys.COLUMN_NAMES
           THEN 'KEY MISMATCH'
           WHEN ExpectKeys.COLUMN_NAMES = CurrKeys.COLUMN_NAMES
           THEN 'OK'
           ELSE 'UNKNOWN ERROR'
       END AS Key_Match_Result
FROM                  
(
    SELECT        
           TABLE_NAME, 
           LEFT(COL, LEN(COL) - 1) AS COLUMN_NAMES
    FROM              
    (
        SELECT DISTINCT    
               TAB.TABLE_NAME TABLE_NAME, 
        (
            SELECT 
                   COL.Column_Name + ', ' AS [text()]
            FROM    
                 #PKVALIDATION COL
            WHERE  COL.Table_Name = TAB.Table_Name
            ORDER BY 
                     COL.Column_Name FOR
            XML PATH('')
        ) COL
        FROM 
             #PKVALIDATION TAB
    ) T
    WHERE T.COL IS NOT NULL
) ExpectKeys
LEFT JOIN
(
    SELECT        
           TABLE_NAME, 
           LEFT(COL, LEN(COL) - 1) AS COLUMN_NAMES
    FROM              
    (
        SELECT DISTINCT    
               TAB.TABLE_NAME TABLE_NAME, 
        (
            SELECT 
                   COL.COLUMN_NAME + ', ' AS [text()]
            FROM    
                 INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE COL
            WHERE  COL.CONSTRAINT_NAME = TAB.CONSTRAINT_NAME
                   AND COL.TABLE_NAME = TAB.TABLE_NAME
                   AND CONSTRAINT_TYPE = 'PRIMARY KEY'
            ORDER BY 
                     COL.COLUMN_NAME FOR
            XML PATH('')
        ) COL
        FROM 
             INFORMATION_SCHEMA.TABLE_CONSTRAINTS TAB
    ) T
    WHERE T.COL IS NOT NULL
) CurrKeys
     ON CurrKeys.TABLE_NAME = ExpectKeys.TABLE_NAME) KeyMatch;

BEGIN
    
    DECLARE @SQL NVARCHAR(3000);
    DECLARE @Table_Name VARCHAR(100);
	DECLARE @Key_Columns VARCHAR(100);
    
    DECLARE CUR CURSOR
    FOR SELECT
              Table_Name, Expected_Primary_Key
        FROM
             #KeyMatchResult;
    
    OPEN CUR;
    
    FETCH NEXT FROM CUR INTO @Table_Name, @Key_Columns;
    
    WHILE @@FETCH_STATUS = 0
        BEGIN
		SET @SQL = '
			IF OBJECT_ID(''' + @Table_Name + ''') IS NOT NULL
			WITH CTEKEY
				AS (SELECT 
			        COUNT(*) KEYTOT
					FROM (
						SELECT DISTINCT  ' + @Key_Columns + '
						FROM ' + @Table_Name + ') z),
			CTETOT
				AS (SELECT COUNT(*) TABTOT
					FROM ' + @Table_Name + ')
			INSERT INTO #PKVIOLATIONS
			SELECT  ''' + @Table_Name + ''', CTETOT.TABTOT - CTEKEY.KEYTOT
			FROM CTETOT, CTEKEY;'
            --PRINT @SQL;
            EXEC Sp_executesql
                 @SQL;
            FETCH NEXT FROM CUR INTO @Table_Name, @Key_Columns;
        END;
    
    CLOSE CUR;
    
    DEALLOCATE CUR; 
END

SELECT 
       m.*, 
       v.Violation_Count
FROM   
     #KeyMatchResult m
     LEFT JOIN #PKVIOLATIONS v
          ON v.Table_Name = m.TABLE_NAME;
/*****************************************************************************
END Analysis Section
*****************************************************************************/