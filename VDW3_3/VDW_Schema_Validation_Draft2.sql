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
             ZIP                   NVARCHAR(5) NULL
	);
	INSERT INTO @TableNameList VALUES  ('CENSUS_DEMOG');
		   
	CREATE TABLE #EVERNDC
	(
					  NDC        nvarchar(11) NOT NULL,
					  GENERIC    nvarchar(105) NOT NULL,
					  BRAND      nvarchar(105),
					  GPI        nvarchar(14),
					  AHFS1      nvarchar(8),
					  AHFS2      nvarchar(8),
					  AHFS3      nvarchar(8),
					  AHFS4      nvarchar(8),
					  AHFS5      nvarchar(8),
					  AHFS6      nvarchar(8),
					  AHFS7      nvarchar(8)
	);
	INSERT INTO @TableNameList VALUES  ('EVERNDC');
	 
	CREATE TABLE #PROVIDER_SPECIALTY
	(
					  [PROVIDER]             nvarchar(36) NOT NULL,
					  SPECIALTY              nvarchar(3) NOT NULL DEFAULT 'UNK',
					  SPECIALTY2             nvarchar(3),
					  SPECIALTY3             nvarchar(3),
					  SPECIALTY4             nvarchar(3),
					  PROVIDER_TYPE          nvarchar(3) NOT NULL DEFAULT '999',
					  PROVIDER_BIRTH_YEAR    numeric(4),
					  PROVIDER_GENDER        nchar DEFAULT 'U',
					  PROVIDER_RACE          nvarchar(2) DEFAULT 'UN',
					  PROVIDER_HISPANIC      nchar DEFAULT 'U',
					  YEAR_GRADUATED         numeric(4)
	);
	INSERT INTO @TableNameList VALUES  ('PROVIDER_SPECIALTY');
	 
	CREATE TABLE #DEATH
	(
					  PERSON_ID     nvarchar(36) NOT NULL,
					  DEATHDT       date,
					  DTIMPUTE      nchar,
					  [SOURCE]      nchar NOT NULL,
					  CONFIDENCE    nchar NULL
	);
	INSERT INTO @TableNameList VALUES  ('DEATH');
	 
	CREATE TABLE #CAUSE_OF_DEATH
	(
					  PERSON_ID      nvarchar(36) NOT NULL,
					  COD            nvarchar(6) NOT NULL,
					  DX_CODETYPE    nvarchar(2),
					  CAUSETYPE      nchar,
					  [SOURCE]       nchar NOT NULL,
					  CONFIDENCE     nchar NULL
	);
	INSERT INTO @TableNameList VALUES  ('CAUSE_OF_DEATH');
 
	CREATE TABLE #DEMOGRAPHICS
	(
					  PERSON_ID             nvarchar(36) NOT NULL,
					  MRN                   nvarchar(36),
					  BIRTH_DATE            date NOT NULL,
					  GENDER                nchar NOT NULL	DEFAULT 'U',
					  PRIMARY_LANGUAGE      nvarchar(3) NOT NULL	DEFAULT 'unk',
					  NEEDS_INTERPRETER     nchar NOT NULL	DEFAULT 'U',
					  RACE1                 nvarchar(2) NOT NULL DEFAULT 'UN',
					  RACE2                 nvarchar(2) NOT NULL DEFAULT 'UN',
					  RACE3                 nvarchar(2) NOT NULL DEFAULT 'UN',
					  RACE4                 nvarchar(2) NOT NULL DEFAULT 'UN',
					  RACE5                 nvarchar(2) NOT NULL DEFAULT 'UN',
					  HISPANIC              nchar NOT NULL DEFAULT 'U',
					  SEXUAL_ORIENTATION    nvarchar(2) NOT NULL DEFAULT 'UN',
					  GENDER_IDENTITY       nvarchar(2) DEFAULT 'UN',
					  CONSTRAINT PK_CHORDS_DEMOGRAPHICS PRIMARY KEY CLUSTERED(PERSON_ID)
	);
	INSERT INTO @TableNameList VALUES  ('DEMOGRAPHICS');
	
	CREATE TABLE #LINKAGE
	(
					  LINK_ID       nvarchar(50) NOT NULL,
					  PERSON_ID		nvarchar(36) NOT NULL,
					  LINE			smallint NOT NULL,
					  LINK_SRC_ID   nvarchar(12) NOT NULL
	);
	INSERT INTO @TableNameList VALUES  ('LINKAGE');
	 
	CREATE TABLE #BENEFIT
	(
					  BENEFIT_ID		    int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  LOAD_DATE				datetime NOT NULL,
					  REFRESH_DATE			datetime,
					  PERSON_ID		    nvarchar(36) NOT NULL,
					  BENEFIT_TYPE		    nchar(2) NOT NULL,
					  BENEFIT_CAT		    nchar(2) NOT NULL,
					  LOCAL_CD		    nvarchar(20),
					  LOCAL_DESCRIPTION	    nvarchar(50),
					  BENEFIT_DATE		    datetime,
					  ENC_ID			    nvarchar(36),
					  [START_DATE]		    datetime,
					  [END_DATE]		    datetime
	);
	INSERT INTO @TableNameList VALUES  ('BENEFIT');
	 
	CREATE TABLE #ENCOUNTERS
	(
					  ENC_ID                   nvarchar(36) NOT NULL,
					  PERSON_ID                nvarchar(36) NOT NULL,
					  ADATE                    date NOT NULL,
					  DDATE                    date,
					  ENCTYPE                  nvarchar(2) NOT NULL,
					  ENCOUNTER_SUBTYPE        nvarchar(2) NOT NULL,
					  [PROVIDER]               nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  ENC_COUNT                numeric(3),
					  DRG_VALUE                nvarchar(4),
					  DRG_VERSION              nchar,
					  FACILITY_CODE            nvarchar(36) NOT NULL	DEFAULT 'UNK',
					  DISCHARGE_DISPOSITION    nchar	DEFAULT 'U',
					  DISCHARGE_STATUS         nvarchar(2)  DEFAULT 'UN',
					  ADMITTING_SOURCE         nvarchar(2)	DEFAULT 'UN',
					  DEPARTMENT               nvarchar(4)	DEFAULT 'UNK',
					  CONSTRAINT PK_CHORDS_ENCOUNTERS PRIMARY KEY CLUSTERED(ENC_ID),
	);
	INSERT INTO @TableNameList VALUES  ('ENCOUNTERS');
	 
	CREATE TABLE #DIAGNOSES
	(
					  DIAGNOSES_ID	  int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID       nvarchar(36) NOT NULL,
					  ENC_ID          nvarchar(36) NOT NULL,
					  ADATE           date NOT NULL,
					  ENDDATE         date,
					  ENCTYPE         nvarchar(2) NOT NULL,
					  [PROVIDER]      nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  DIAGPROVIDER    nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  DX              nvarchar(18) NOT NULL,
					  DX_CODETYPE     nvarchar(2) NOT NULL	DEFAULT 'UN',
					  DX_NAME		  nvarchar(200),
					  DX_ORIGIN	   	  nvarchar(2) NOT NULL,
					  ORIGDX          nvarchar(18) NOT NULL,
					  PRINCIPAL_DX    nchar NOT NULL	DEFAULT 'X',
					  PRIMARY_DX      nchar NOT NULL	DEFAULT 'X'
	);
	INSERT INTO @TableNameList VALUES  ('DIAGNOSES');
	 
	CREATE TABLE #ENROLLMENT
	(
					  PERSON_ID              nvarchar(36) NOT NULL,
					  ENR_START              date NOT NULL,
					  ENR_END                date NOT NULL,
					  INS_MEDICAID           nchar NOT NULL,
					  INS_COMMERCIAL         nchar NOT NULL,
					  INS_PRIVATEPAY         nchar NOT NULL,
					  INS_STATESUBSIDIZED    nchar NOT NULL,
					  INS_SELFFUNDED         nchar NOT NULL,
					  INS_HIGHDEDUCTIBLE     nchar NOT NULL,
					  INS_MEDICARE           nchar NOT NULL,
					  INS_MEDICARE_A         nchar NOT NULL,
					  INS_MEDICARE_B         nchar NOT NULL,
					  INS_MEDICARE_C         nchar NOT NULL,
					  INS_MEDICARE_D         nchar NOT NULL,
					  INS_OTHER              nchar NOT NULL,
					  PLAN_HMO               nchar NOT NULL,
					  PLAN_POS               nchar NOT NULL,
					  PLAN_PPO               nchar NOT NULL,
					  PLAN_INDEMNITY         nchar NOT NULL,
					  DRUGCOV                nchar NOT NULL,
					  OUTSIDE_UTILIZATION    nchar NOT NULL,
					  ENROLLMENT_BASIS       nchar NULL,
					  PCC                    nvarchar(4),
					  PCP                    nvarchar(36),
					  CONSTRAINT PK_CHORDS_ENROLLMENT PRIMARY KEY CLUSTERED(PERSON_ID, ENR_START),
	);
	INSERT INTO @TableNameList VALUES  ('ENROLLMENT');
	
	CREATE TABLE #LAB_RESULTS
	(
					  LAB_RESULTS_ID INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID          nvarchar(36) NOT NULL,
					  RESULT_DT          date NOT NULL,
					  RESULT_TM          time,
					  LAB_DT             date NULL,
					  LAB_TM             time NULL,
					  TEST_TYPE          nvarchar(21) NOT NULL,
					  LOCAL_CD           nvarchar(25) NOT NULL,
					  BATTERY_CD         nvarchar(150) NOT NULL,
					  LOINC              nvarchar(10),
					  STAT               nchar NULL	DEFAULT 'R',
					  PT_LOC             nchar NULL	DEFAULT 'U',
					  RESULT_LOC         nchar NULL	DEFAULT 'L',
					  PX                 nvarchar(10) NULL,
					  CODETYPE           nchar NULL	DEFAULT 'L',
					  ORDER_ID           nvarchar(36) NOT NULL,
					  ORDER_DT           date,
					  RESULT_NUM         numeric(20, 10),
					  RESULT_C           nvarchar(20) NOT NULL,
					  MODIFIER           nvarchar(2) NOT NULL,
					  RESULT_UNIT        nvarchar(11) NOT NULL,
					  NORMAL_LOW_C       nvarchar(10),
					  MODIFIER_LOW       nvarchar(2),
					  NORMAL_HIGH_C      nvarchar(10),
					  MODIFIER_HIGH      nvarchar(2),
					  ABN_IND            nvarchar(2) DEFAULT 'UN',
					  ORDER_PROV         nvarchar(36) DEFAULT 'UNKNOWN',
					  ORDER_DEPT         nvarchar(4),
					  FACILITY_CODE      nvarchar(36),
					  SPECIMEN_ID        nvarchar(36),
					  SPECIMEN_SOURCE    nvarchar(6),
					  ROW_ID             nvarchar(8)
	);
	INSERT INTO @TableNameList VALUES  ('LAB_RESULTS');
	
	CREATE TABLE #PRO_SURVEYS
	(
		PRO_ID nvarchar(15) NOT NULL PRIMARY KEY CLUSTERED,
		PRO_SURVEY nvarchar(15) NOT NULL DEFAULT N'OT',
		PRO_SURVEY_DESCRIPTION nvarchar(80) NULL,
		PRO_SURVEY_TYPE nvarchar(15) NOT NULL DEFAULT N'OT',
		PRO_SURVEY_TYPE_DESCRIPTION nvarchar(80) NULL,
		PRO_SURVEY_TYPE_NOTES nvarchar(255) NULL,
		PRO_SURVEY_TYPE_LOINC nvarchar(18) NULL
	);
	INSERT INTO @TableNameList VALUES  ('PRO_SURVEYS');
	
	CREATE TABLE #PRO_QUESTIONS
	(
		PRO_ID nvarchar(15) NOT NULL,
		QUESTION_ID int NOT NULL,
		QUESTION_VER int NOT NULL DEFAULT 1,
		QUESTION_DATE date NULL,
		QUESTION_TEXT nvarchar(255) NOT NULL,
		QUESTION_LOINC nvarchar(18) NULL,
		QUESTION_DOMAIN nvarchar(36) NULL
	);
	INSERT INTO @TableNameList VALUES  ('PRO_QUESTIONS');
	
	CREATE TABLE #PRO_RESPONSES
	(
		RESPONSE_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY NONCLUSTERED,
		PRO_ID nvarchar(15) NOT NULL,
		QUESTION_ID int NOT NULL,
		QUESTION_VER int NOT NULL DEFAULT 1,
		PERSON_ID nvarchar(36) NOT NULL,
		RESPONSE_DATE date NOT NULL,
		RESPONSE_TIME time(7) NOT NULL,
		RESPONSE_TEXT nvarchar(255) NULL,
		ENC_ID nvarchar(36) NULL,
		RESPONSE_SOURCE nvarchar(2) NULL,
		SURVEY_ADMINISTERED_BY nvarchar(2) NULL,
		SURVEY_MEDIUM nvarchar(2) NULL
	);
	INSERT INTO @TableNameList VALUES  ('PRO_RESPONSES');
	
	CREATE TABLE #PHARMACY
	(
					  PHARMACY_ID int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID    nvarchar(36) NOT NULL,
					  RXDATE       date NOT NULL,
					  NDC          nvarchar(11) NOT NULL,
					  RXSUP        numeric(4),
					  RXAMT        decimal(16, 4) NOT NULL,
					  RXMD         nvarchar(36) NOT NULL DEFAULT 'UNKNOWN'
	);
	INSERT INTO @TableNameList VALUES  ('PHARMACY');
	
	CREATE TABLE #PRESCRIBING
	(
					  PRESCRIBING_ID      INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID           nvarchar(36) NOT NULL,
					  ENC_ID              nvarchar(36),
					  RXMD                nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  RX_ORDER_DATE       date,
					  RX_ORDER_TIME       time,
					  RX_START_DATE       date,
					  RX_END_DATE         date,
					  RX_QUANTITY         nvarchar(8),
					  RX_QUANTITY_NUM     numeric(8),
					  RX_QUANTITY_UNIT    nvarchar(2),
					  RX_REFILLS          numeric(8),
					  RX_DAYS_SUPPLY      numeric(8),
					  RX_FREQUENCY        nvarchar(2),
					  RX_INSTRUCTIONS     nvarchar(100),
					  RX_BASIS            nvarchar(2),
					  RXNORM              nvarchar(8),
					  GENERIC_MED_NAME    nvarchar(105) NOT NULL,
					  RX_DOSE_ORDERED	  numeric(8),
					  RX_DOSE_ORDERED_UNIT	nvarchar(20)
	);
	INSERT INTO @TableNameList VALUES  ('PRESCRIBING');
	
	CREATE TABLE #PROCEDURES
	(
					  PROCEDURES_ID		    int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID             nvarchar(36) NOT NULL,
					  [PROVIDER]            nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  PROCDATE              date NOT NULL,
					  ENC_ID                nvarchar(36) NOT NULL,
					  PERFORMINGPROVIDER    nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  ADATE                 date NOT NULL,
					  ENCTYPE               nvarchar(2) NOT NULL,
					  PX                    nvarchar(10) NOT NULL,
					  ORIGPX                nvarchar(10),
					  PX_CODETYPE           nchar(2) NOT NULL,
					  PXCNT                 numeric(7) DEFAULT 1,
					  CPTMOD1               nvarchar(2),
					  CPTMOD2               nvarchar(2),
					  CPTMOD3               nvarchar(2)
	);
	INSERT INTO @TableNameList VALUES  ('PROCEDURES');
	
	CREATE TABLE #SOCIAL_HISTORY
	(
					  SOCIAL_HISTORY_ID		  int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID               nvarchar(36) NOT NULL,
					  ENC_ID                  nvarchar(36) NULL,
					  CONTACT_DATE            date NOT NULL,
					  TOBACCO_USER            nchar DEFAULT 'U',
					  ONC_SMOKING_STATUS      nchar DEFAULT '6',
					  ALCOHOL_USER            nchar DEFAULT 'U',
					  ILL_DRUG_USER           nchar DEFAULT 'U',
					  TOBACCO_PAK_PER_DY      nvarchar(20) DEFAULT NULL,
					  TOBACCO_USED_YEARS      nvarchar(20) DEFAULT NULL,
					  SMOKING_QUIT_DATE       datetime DEFAULT NULL,
					  SMOKELESS_QUIT_DATE     datetime DEFAULT NULL,
					  TOBACCO_COMMENT         nvarchar(255) DEFAULT NULL,
					  CIGARETTES_YN           nchar DEFAULT 'U',
					  PIPES_YN                nchar DEFAULT 'U',
					  CIGARS_YN               nchar DEFAULT 'U',
					  SNUFF_YN                nchar DEFAULT 'U',
					  CHEW_YN                 nchar DEFAULT 'U',
					  UNSPECIFIED_TOBACCO     nchar,
					  ALCOHOL_OZ_PER_WK       nvarchar(15),
					  ALCOHOL_COMMENT         nvarchar(255),
					  IV_DRUG_USER_YN         nchar DEFAULT 'U',
					  ILLICIT_DRUG_FREQ       nvarchar(5),
					  ILLICIT_DRUG_COMMENT    nvarchar(255),
					  FEMALE_PARTNER_YN       nchar DEFAULT 'U',
					  MALE_PARTNER_YN         nchar DEFAULT 'U',
					  CONDOM_YN               nchar DEFAULT 'U',
					  PILL_YN                 nchar DEFAULT 'U',
					  DIAPHRAGM_YN            nchar DEFAULT 'U',
					  IUD_YN                  nchar DEFAULT 'U',
					  SURGICAL_YN             nchar DEFAULT 'U',
					  SPERMICIDE_YN           nchar DEFAULT 'U',
					  IMPLANT_YN              nchar DEFAULT 'U',
					  RHYTHM_YN               nchar DEFAULT 'U',
					  INJECTION_YN            nchar DEFAULT 'U',
					  SPONGE_YN               nchar DEFAULT 'U',
					  BC_INSERTS_YN           nchar DEFAULT 'U',
					  ABSTINENCE_YN           nchar DEFAULT 'U',
					  SEX_COMMENT             nvarchar(255),
					  YEARS_EDUCATION         nvarchar(15),
					  SEXUALLY_ACTV           nchar DEFAULT 'U'
	);
	INSERT INTO @TableNameList VALUES  ('SOCIAL_HISTORY');
	
	CREATE TABLE #VITAL_SIGNS
	(
					  VITAL_SIGNS_ID   int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID        nvarchar(36) NOT NULL,
					  MEASURE_DATE     date NOT NULL,
					  MEASURE_TIME     time NULL,
					  ENC_ID           nvarchar(36) NULL,
					  ENCTYPE          nvarchar(2) NULL,
					  HT               decimal(7, 3),
					  WT               decimal(8, 4),
					  DIASTOLIC        numeric(3),
					  SYSTOLIC         numeric(3),
					  HT_RAW           nvarchar(10),
					  WT_RAW           nvarchar(10),
					  BMI_RAW          nvarchar(5),
					  DIASTOLIC_RAW    nvarchar(7),
					  SYSTOLIC_RAW     nvarchar(7),
					  BP_TYPE          nchar,
					  POSITION         nchar,
					  HEAD_CIR_RAW     nvarchar(6),
					  RESPIR_RAW       nvarchar(6),
					  TEMP_RAW         nvarchar(6),
					  PULSE_RAW        nvarchar(6)
	);
	INSERT INTO @TableNameList VALUES  ('VITAL_SIGNS');	
	
	CREATE TABLE #TUMOR
	(
					  TUMOR_ID	    int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID        nvarchar(36) NOT NULL,
					  DXDATE           date NOT NULL,
					  ICDOSITE         nvarchar(4) NOT NULL,
					  STAGEGEN         nchar NOT NULL,
					  SS1977           nchar,
					  SS2000           nchar,
					  STAGEAJ          nvarchar(4) NOT NULL,
					  AJCC_ED          nchar,
					  AJCC_GRP         nvarchar(2),
					  AJCC_FULL_DER    nvarchar(20),
					  MORPH            nvarchar(4) NOT NULL,
					  BEHAV            nchar NOT NULL,
					  GRADE            nchar NOT NULL,
					  DXYEAR           numeric(4) NOT NULL,
					  DXAGE            numeric(3) NOT NULL,
					  BDATE            date NOT NULL,
					  GENDER           nchar NOT NULL,
					  RACE1            nvarchar(2) NOT NULL,
					  RACE2            nvarchar(2) NOT NULL,
					  RACE3            nvarchar(2) NOT NULL,
					  RACE4            nvarchar(2) NOT NULL,
					  RACE5            nvarchar(2) NOT NULL,
					  HISPANIC         nchar NOT NULL,
					  CLASS            nvarchar(2) NOT NULL,
					  VITAL            nchar NOT NULL,
					  DCAUSE           nvarchar(6),
					  DOD              date,
					  DT_FU            date,
					  LATERALITY       nchar NOT NULL,
					  IDPLAN           nvarchar(2) NOT NULL,
					  DCNFRM           nchar NOT NULL,
					  DSTZ             nvarchar(3),
					  DAJC1T_P         nvarchar(5),
					  DAJC1N_P         nvarchar(5),
					  DAJC1M_P         nvarchar(5),
					  DAJC1T_C         nvarchar(5),
					  DAJC1N_C         nvarchar(5),
					  DAJC1M_C         nvarchar(5),
					  DSRG_FAC         nvarchar(2) NOT NULL,
					  DRAD_FAC         nvarchar(2) NOT NULL,
					  DCHM_FAC         nvarchar(2) NOT NULL,
					  DHRM_FAC         nvarchar(2) NOT NULL,
					  DIMM_FAC         nvarchar(2) NOT NULL,
					  DOTH_FAC         nvarchar(2) NOT NULL,
					  DNDI             nvarchar(2) NOT NULL,
					  DNDX             nvarchar(2) NOT NULL,
					  DTMRK1           nchar,
					  DTMRK2           nchar,
					  DTMRK3           nchar,
					  CLN_STG          nvarchar(4) NOT NULL,
					  EOD              nvarchar(12),
					  DT_SURG          date,
					  DT_CHEMO         date,
					  DT_HORM          date,
					  DT_RAD           date,
					  DT_BRM           date,
					  DT_OTH           date,
					  R_N_SURG         nchar NOT NULL,
					  R_N_CHEMO        nvarchar(2) NOT NULL,
					  R_N_HORM         nchar NOT NULL,
					  R_N_RAD          nchar NOT NULL,
					  R_N_BRM          nchar NOT NULL,
					  R_N_OTH          nchar NOT NULL,
					  DSRG_SUM         nvarchar(2) NOT NULL,
					  DRAD_SUM         nvarchar(2) NOT NULL,
					  DCHM_SUM         nvarchar(2) NOT NULL,
					  DHRM_SUM         nvarchar(2) NOT NULL,
					  DIMM_SUM         nvarchar(2) NOT NULL,
					  DOTH_SUM         nvarchar(2) NOT NULL,
					  CS_SZ            nvarchar(3),
					  CS_EXT           nvarchar(3),
					  CS_NODES         nvarchar(3),
					  CS_NODES_EVAL    nchar,
					  CS_METS          nvarchar(2),
					  CS_METS_EVAL     nchar,
					  SSF1             nvarchar(3),
					  SSF2             nvarchar(3),
					  SSF3             nvarchar(3),
					  SSF4             nvarchar(3),
					  SSF5             nvarchar(3),
					  SSF6             nvarchar(3),
					  SSF7             nvarchar(3),
					  SSF8             nvarchar(3),
					  SSF9             nvarchar(3),
					  SSF10            nvarchar(3),
					  SSF11            nvarchar(3),
					  SSF12            nvarchar(3),
					  SSF13            nvarchar(3),
					  SSF14            nvarchar(3),
					  SSF15            nvarchar(3),
					  SSF16            nvarchar(3),
					  SSF17            nvarchar(3),
					  SSF18            nvarchar(3),
					  SSF19            nvarchar(3),
					  SSF20            nvarchar(3),
					  SSF21            nvarchar(3),
					  SSF22            nvarchar(3),
					  SSF23            nvarchar(3),
					  SSF24            nvarchar(3),
					  SSF25            nvarchar(3),
					  PAL_FAC          nchar NOT NULL,
					  PAL_SUM          nchar NOT NULL,
					  DER_T6           nvarchar(3),
					  DER_T6_D         nchar,
					  DER_N6           nvarchar(3),
					  DER_N6_D         nchar,
					  DER_M6           nvarchar(3),
					  DER_M6_D         nchar,
					  DER_T7           nvarchar(3),
					  DER_T7_D         nchar,
					  DER_N7           nvarchar(3),
					  DER_N7_D         nchar,
					  DER_M7           nvarchar(3),
					  DER_M7_D         nchar,
					  DER_SS2000F      nchar,
					  RECUR_DT         datetime,
					  RECUR_TYPE       nvarchar(2) NOT NULL,
					  RECUR_FL         nvarchar(2),
					  [DATA_SOURCE]    nvarchar(4)
	);
	INSERT INTO @TableNameList VALUES  ('TUMOR');	
	
	CREATE TABLE #LANGUAGES
	(
					  PERSON_ID       nvarchar(36) NOT NULL,
					  LANG_ISO        nvarchar(3) NOT NULL,
					  LANG_USAGE      nchar	DEFAULT 'U',
					  LANG_PRIMARY    nchar DEFAULT 'U',
					  CONSTRAINT PK_CHORDS_LANGUAGES PRIMARY KEY CLUSTERED(PERSON_ID, LANG_ISO)
	);
	INSERT INTO @TableNameList VALUES  ('LANGUAGES');	
    
	CREATE TABLE #CENSUS_LOCATION
	(
					  PERSON_ID                nvarchar(36) NOT NULL,
					  LOC_START                datetime NOT NULL,
					  LOC_END                  datetime,
					  GEOCODE                  nvarchar(15) NULL,
					  GEOCODE_BOUNDARY_YEAR    numeric(8) NULL,
					  GEOLEVEL                 nchar NULL,
					  MATCH_STRENGTH           nchar NULL,
					  CITY_GEOCODE             nvarchar(35) NULL,
					  LATITUDE                 decimal(8, 6) NULL,
					  LONGITUDE                decimal(9, 6) NULL,
					  GEOCODE_APP              nvarchar(50) NULL,
					  GEOCODE_COUNTY		   nvarchar(35) NOT NULL,
					  ADDRESS_TYPE_CODE		   nchar(2)
	);
	INSERT INTO @TableNameList VALUES  ('CENSUS_LOCATION');	
END
/*****************************************************************************
END Table Create Section
*****************************************************************************/

/*****************************************************************************
BEGIN Table Name List: Add or update any table names created or added to @TableNameList
Example below
*****************************************************************************/
BEGIN
    
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