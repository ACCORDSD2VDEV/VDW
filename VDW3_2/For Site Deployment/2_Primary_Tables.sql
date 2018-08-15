IF OBJECT_ID('CENSUS_DEMOG') IS NOT NULL
BEGIN
	 PRINT 'CENSUS_DEMOG Already Exists';
END;
ELSE
BEGIN
	 PRINT 'CENSUS_DEMOG - Creating';
	 CREATE TABLE CENSUS_DEMOG
	 (
					  CENSUS_YEAR              int NOT NULL,
					  GEOCODE                  nvarchar(15) NOT NULL,
					  [BLOCK]                  nvarchar(3) NULL,
					  CENSUS_DATA_SRC          nvarchar(26) NULL,
					  CHORDS_GEOLEVEL          nvarchar(10) NULL,
					  [STATE]                  nvarchar(2) NULL,
					  COUNTY                   nvarchar(3) NULL,
					  TRACT                    nvarchar(6) NULL,
					  BLOCKGP                  nvarchar(1) NULL,
					  HOUSES_N                 int NULL,
					  RA_NHS_WH                decimal(11, 10) NULL,
					  RA_NHS_BL                decimal(11, 10) NULL,
					  RA_NHS_AM                decimal(11, 10) NULL,
					  RA_NHS_AS                decimal(11, 10) NULL,
					  RA_NHS_HA                decimal(11, 10) NULL,
					  RA_NHS_OT                decimal(11, 10) NULL,
					  RA_NHS_ML                decimal(11, 10) NULL,
					  RA_HIS_WH                decimal(11, 10) NULL,
					  RA_HIS_BL                decimal(11, 10) NULL,
					  RA_HIS_AM                decimal(11, 10) NULL,
					  RA_HIS_AS                decimal(11, 10) NULL,
					  RA_HIS_HA                decimal(11, 10) NULL,
					  RA_HIS_OT                decimal(11, 10) NULL,
					  RA_HIS_ML                decimal(11, 10) NULL,
					  HOUSES_OCCUPIED          decimal(11, 10) NULL,
					  HOUSES_OWN               decimal(11, 10) NULL,
					  HOUSES_RENT              decimal(11, 10) NULL,
					  HOUSES_UNOCC_FORRENT     decimal(11, 10) NULL,
					  HOUSES_UNOCC_FORSALE     decimal(11, 10) NULL,
					  HOUSES_UNOCC_RENTSOLD    decimal(11, 10) NULL,
					  HOUSES_UNOCC_SEASONAL    decimal(11, 10) NULL,
					  HOUSES_UNOCC_MIGRANT     decimal(11, 10) NULL,
					  HOUSES_UNOCC_OTHER       decimal(11, 10) NULL,
					  EDUCATION1               decimal(11, 10) NULL,
					  EDUCATION2               decimal(11, 10) NULL,
					  EDUCATION3               decimal(11, 10) NULL,
					  EDUCATION4               decimal(11, 10) NULL,
					  EDUCATION5               decimal(11, 10) NULL,
					  EDUCATION6               decimal(11, 10) NULL,
					  EDUCATION7               decimal(11, 10) NULL,
					  EDUCATION8               decimal(11, 10) NULL,
					  MEDFAMINCOME             int NULL,
					  FAMINCOME1               decimal(11, 10) NULL,
					  FAMINCOME2               decimal(11, 10) NULL,
					  FAMINCOME3               decimal(11, 10) NULL,
					  FAMINCOME4               decimal(11, 10) NULL,
					  FAMINCOME5               decimal(11, 10) NULL,
					  FAMINCOME6               decimal(11, 10) NULL,
					  FAMINCOME7               decimal(11, 10) NULL,
					  FAMINCOME8               decimal(11, 10) NULL,
					  FAMINCOME9               decimal(11, 10) NULL,
					  FAMINCOME10              decimal(11, 10) NULL,
					  FAMINCOME11              decimal(11, 10) NULL,
					  FAMINCOME12              decimal(11, 10) NULL,
					  FAMINCOME13              decimal(11, 10) NULL,
					  FAMINCOME14              decimal(11, 10) NULL,
					  FAMINCOME15              decimal(11, 10) NULL,
					  FAMINCOME16              decimal(11, 10) NULL,
					  MEDHOUSINCOME            int NULL,
					  HOUSINCOME1              decimal(11, 10) NULL,
					  HOUSINCOME2              decimal(11, 10) NULL,
					  HOUSINCOME3              decimal(11, 10) NULL,
					  HOUSINCOME4              decimal(11, 10) NULL,
					  HOUSINCOME5              decimal(11, 10) NULL,
					  HOUSINCOME6              decimal(11, 10) NULL,
					  HOUSINCOME7              decimal(11, 10) NULL,
					  HOUSINCOME8              decimal(11, 10) NULL,
					  HOUSINCOME9              decimal(11, 10) NULL,
					  HOUSINCOME10             decimal(11, 10) NULL,
					  HOUSINCOME11             decimal(11, 10) NULL,
					  HOUSINCOME12             decimal(11, 10) NULL,
					  HOUSINCOME13             decimal(11, 10) NULL,
					  HOUSINCOME14             decimal(11, 10) NULL,
					  HOUSINCOME15             decimal(11, 10) NULL,
					  HOUSINCOME16             decimal(11, 10) NULL,
					  POV_LT_50                decimal(11, 10) NULL,
					  POV_50_74                decimal(11, 10) NULL,
					  POV_75_99                decimal(11, 10) NULL,
					  POV_100_124              decimal(11, 10) NULL,
					  POV_125_149              decimal(11, 10) NULL,
					  POV_150_174              decimal(11, 10) NULL,
					  POV_175_184              decimal(11, 10) NULL,
					  POV_185_199              decimal(11, 10) NULL,
					  POV_GT_200               decimal(11, 10) NULL,
					  ENGLISH_SPEAKER          decimal(11, 10) NULL,
					  SPANISH_SPEAKER          decimal(11, 10) NULL,
					  BORNINUS                 decimal(11, 10) NULL,
					  MOVEDINLAST12MON         decimal(11, 10) NULL,
					  MARRIED                  decimal(11, 10) NULL,
					  DIVORCED                 decimal(11, 10) NULL,
					  DISABILITY               decimal(11, 10) NULL,
					  UNEMPLOYMENT             decimal(11, 10) NULL,
					  UNEMPLOYMENT_MALE        decimal(11, 10) NULL,
					  INS_MEDICARE             decimal(11, 10) NULL,
					  INS_MEDICAID             decimal(11, 10) NULL,
					  HH_NOCAR                 decimal(11, 10) NULL,
					  HH_PUBLIC_ASSISTANCE     decimal(11, 10) NULL,
					  HMOWNER_COSTS_MORT       decimal(11, 10) NULL,
					  HMOWNER_COSTS_NO_MORT    decimal(11, 10) NULL,
					  HOMES_MEDVALUE           int NULL,
					  PCT_CROWDING             decimal(11, 10) NULL,
					  FEMALE_HEAD_OF_HH        decimal(11, 10) NULL,
					  MGR_FEMALE               decimal(11, 10) NULL,
					  MGR_MALE                 decimal(11, 10) NULL,
					  RESIDENTS_65             decimal(11, 10) NULL,
					  SAME_RESIDENCE           decimal(11, 10) NULL,
					  FAMPOVERTY               decimal(11, 10) NULL,
					  HOUSPOVERTY              decimal(11, 10) NULL,
					  ZIP                      nvarchar(5) NULL,
					  CONSTRAINT PK_CHORDS_CENSUS_DEMOG PRIMARY KEY CLUSTERED(CENSUS_YEAR ASC, GEOCODE ASC)
	 );
	 	 PRINT 'CENSUS_DEMOG - Complete';
END;

-- EVERNDC Table
IF OBJECT_ID('EVERNDC') IS NOT NULL
BEGIN
	 PRINT 'EVERNDC Already Exists';
END;
ELSE
BEGIN
	 PRINT 'EVERNDC - Creating';
	 CREATE TABLE EVERNDC
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
					  AHFS7      nvarchar(8),
					  CONSTRAINT PK_CHORDS_EVERNDC PRIMARY KEY CLUSTERED(NDC, GENERIC)
	 );
	 	 PRINT 'EVERNDC - Complete';
END;


-- PROVIDER_SPECIALTY Table
IF OBJECT_ID('PROVIDER_SPECIALTY') IS NOT NULL
BEGIN
	 PRINT 'PROVIDER_SPECIALTY Already Exists';
END;
ELSE
BEGIN
	 PRINT 'PROVIDER_SPECIALTY - Creating';
	 CREATE TABLE PROVIDER_SPECIALTY
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
					  YEAR_GRADUATED         numeric(4),
					  CONSTRAINT PK_CHORDS_PROVIDER_SPECIALTY PRIMARY KEY CLUSTERED([PROVIDER])
	 );
	 PRINT 'PROVIDER_SPECIALTY - Complete';
END;

-- DEATH Table
IF OBJECT_ID('DEATH') IS NOT NULL
BEGIN
	 PRINT 'DEATH Already Exists';
END;
ELSE
BEGIN
	 PRINT 'DEATH - Creating';
	 CREATE TABLE DEATH
	 (
					  PERSON_ID     nvarchar(36) NOT NULL,
					  DEATHDT       date,
					  DTIMPUTE      nchar,
					  [SOURCE]      nchar NOT NULL,
					  CONFIDENCE    nchar NULL,
					  CONSTRAINT PKDEATH PRIMARY KEY CLUSTERED(PERSON_ID)
	 );
	 PRINT 'DEATH - Complete';
END;

-- CAUSE_OF_DEATH Table
IF OBJECT_ID('CAUSE_OF_DEATH') IS NOT NULL
BEGIN
	 PRINT 'CAUSE_OF_DEATH Already Exists';
END;
ELSE
BEGIN
	 PRINT 'CAUSE_OF_DEATH - Creating';
	 CREATE TABLE CAUSE_OF_DEATH
	 (
					  PERSON_ID      nvarchar(36) NOT NULL,
					  COD            nvarchar(6) NOT NULL,
					  DX_CODETYPE    nvarchar(2),
					  CAUSETYPE      nchar,
					  [SOURCE]       nchar NOT NULL,
					  CONFIDENCE     nchar NULL,
					  CONSTRAINT PK_CHORDS_CAUSE_OF_DEATH PRIMARY KEY CLUSTERED(PERSON_ID, COD)
	 );
	 PRINT 'CAUSE_OF_DEATH - Complete';
END;

-- DEMOGRAPHICS Table
IF OBJECT_ID('DEMOGRAPHICS') IS NOT NULL
BEGIN
	 PRINT 'DEMOGRAPHICS Already Exists';
END;
ELSE
BEGIN
	 PRINT 'DEMOGRAPHICS - Creating';
	 CREATE TABLE DEMOGRAPHICS
	 (
					  PERSON_ID             nvarchar(36) NOT NULL,
					  MRN                   nvarchar(36),
					  BIRTH_DATE            date NOT NULL,
					  GENDER                nchar NOT NULL	DEFAULT 'U',
					  PRIMARY_LANGUAGE      nvarchar(3) NOT NULL	DEFAULT 'unk',
					  NEEDS_INTERPRETER     nchar NOT NULL	DEFAULT 'U',
					  RACE1                 nvarchar(2) NOT NULL	DEFAULT 'UN',
					  RACE2                 nvarchar(2) DEFAULT 'UN',
					  RACE3                 nvarchar(2) DEFAULT 'UN',
					  RACE4                 nvarchar(2) DEFAULT 'UN',
					  RACE5                 nvarchar(2) DEFAULT 'UN',
					  HISPANIC              nchar NOT NULL DEFAULT 'U',
					  SEXUAL_ORIENTATION    nvarchar(2) NOT NULL DEFAULT 'UN',
					  GENDER_IDENTITY       nvarchar(2) DEFAULT 'UN',
					  CONSTRAINT PK_CHORDS_DEMOGRAPHICS PRIMARY KEY CLUSTERED(PERSON_ID)
	 );
	 PRINT 'DEMOGRAPHICS - Complete';
END;

-- LINKAGE Table
IF OBJECT_ID('LINKAGE') IS NOT NULL
BEGIN
	 PRINT 'LINKAGE Already Exists';
END;
ELSE
BEGIN
	 PRINT 'LINKAGE - Creating';
	 CREATE TABLE LINKAGE
	 (
					  LINK_ID       nvarchar(50) NOT NULL,
					  PERSON_ID		nvarchar(36) NOT NULL,
					  LINE			smallint NOT NULL,
					  LINK_SRC_ID   nvarchar(12) NOT NULL
					  CONSTRAINT PK_CHORDS_LINKAGE PRIMARY KEY CLUSTERED(LINK_ID, LINE)
	 );
	 PRINT 'LINKAGE - Complete';
END;

-- BENEFIT Table
IF OBJECT_ID('BENEFIT') IS NOT NULL
BEGIN
	 PRINT 'BENEFIT Already Exists';
END;
ELSE
BEGIN
	 PRINT 'BENEFIT - Creating';
	 CREATE TABLE BENEFIT
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
	 PRINT 'BENEFIT - Complete';
END;

-- ENCOUNTERS Table
IF OBJECT_ID('ENCOUNTERS') IS NOT NULL
BEGIN
	 PRINT 'ENCOUNTERS Already Exists';
END;
ELSE
BEGIN
	 PRINT 'ENCOUNTERS - Creating';
	 CREATE TABLE ENCOUNTERS
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
	 PRINT 'ENCOUNTERS - Complete';
END;

-- DIAGNOSES Table
IF OBJECT_ID('DIAGNOSES') IS NOT NULL
BEGIN
	 PRINT 'DIAGNOSES Already Exists';
END;
ELSE
BEGIN
	 PRINT 'DIAGNOSES - Creating';
	 CREATE TABLE DIAGNOSES
	 (
					  DIAGNOSES_ID	  int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID       nvarchar(36) NOT NULL,
					  ENC_ID          nvarchar(36) NOT NULL,
					  ADATE           date NOT NULL,
					  ENCTYPE         nvarchar(2) NOT NULL,
					  [PROVIDER]      nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  DIAGPROVIDER    nvarchar(36) NOT NULL DEFAULT 'UNKNOWN',
					  DX              nvarchar(10) NOT NULL,
					  DX_CODETYPE     nvarchar(2) NOT NULL	DEFAULT 'UN',
					  DX_NAME		  nvarchar(200),
					  DX_ORIGIN	   	  nvarchar(2) NOT NULL,
					  ORIGDX          nvarchar(10) NOT NULL,
					  PRINCIPAL_DX    nchar NOT NULL	DEFAULT 'X',
					  PRIMARY_DX      nchar NOT NULL	DEFAULT 'X'
	 );
	 PRINT 'DIAGNOSES - Complete';
END;

-- ENROLLMENT Table
IF OBJECT_ID('ENROLLMENT') IS NOT NULL
BEGIN
	 PRINT 'ENROLLMENT Already Exists';
END;
ELSE
BEGIN
	 PRINT 'ENROLLMENT - Creating';
	 CREATE TABLE ENROLLMENT
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
	 PRINT 'ENROLLMENT - Complete';
END;

-- LAB_RESULTS Table
IF OBJECT_ID('LAB_RESULTS') IS NOT NULL
BEGIN
	 PRINT 'LAB_RESULTS Already Exists';
END;
ELSE
BEGIN
	 PRINT 'LAB_RESULTS - Creating';
	 CREATE TABLE LAB_RESULTS
	 (
					  LAB_RESULTS_ID INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID          nvarchar(36) NOT NULL,
					  RESULT_DT          date NOT NULL,
					  RESULT_TM          time,
					  LAB_DT             date NULL,
					  LAB_TM             time NULL,
					  TEST_TYPE          nvarchar(20) NOT NULL,
					  LOCAL_CD           nvarchar(25) NOT NULL,
					  BATTERY_CD         nvarchar(150) NOT NULL,
					  LOINC              nvarchar(10),
					  STAT               nchar NULL	DEFAULT 'R',
					  PT_LOC             nchar NULL	DEFAULT 'U',
					  RESULT_LOC         nchar NULL	DEFAULT 'L',
					  PX                 nvarchar(6) NULL,
					  CODETYPE           nchar NULL	DEFAULT 'L',
					  ORDER_ID           nvarchar(36) NOT NULL,
					  ORDER_DT           date,
					  RESULT_NUM         numeric(20),
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
	 PRINT 'LAB_RESULTS - Complete';
END;

-- PHARMACY Table
IF OBJECT_ID('PHARMACY') IS NOT NULL
BEGIN
	 PRINT 'PHARMACY Already Exists';
END;
ELSE
BEGIN
	 PRINT 'PHARMACY - Creating';
	 CREATE TABLE PHARMACY
	 (
					  PHARMACY_ID int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
					  PERSON_ID    nvarchar(36) NOT NULL,
					  RXDATE       date NOT NULL,
					  NDC          nvarchar(11) NOT NULL,
					  RXSUP        numeric(4),
					  RXAMT        decimal(16, 10) NOT NULL,
					  RXMD         nvarchar(36) NOT NULL DEFAULT 'UNKNOWN'
	 );
	 PRINT 'PHARMACY - Complete';
END;

--PRESCRIBING TABLE
IF OBJECT_ID('PRESCRIBING') IS NOT NULL
BEGIN
	 PRINT 'PRESCRIBING Already Exists';
END;
ELSE
BEGIN
	 PRINT 'PRESCRIBING - Creating';
	 CREATE TABLE PRESCRIBING
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
					  GENERIC_MED_NAME    nvarchar(105) NOT NULL
	 );
	 PRINT 'PRESCRIBING - Complete';
END;

-- PROCEDURES Table
IF OBJECT_ID('PROCEDURES') IS NOT NULL
BEGIN
	 PRINT 'PROCEDURES Already Exists';
END;
ELSE
BEGIN
	 PRINT 'PROCEDURES - Creating';
	 CREATE TABLE [PROCEDURES]
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
	 PRINT 'PROCEDURES - Complete';
END;

-- SOCIAL_HISTORY Table
IF OBJECT_ID('SOCIAL_HISTORY') IS NOT NULL
BEGIN
	 PRINT 'SOCIAL_HISTORY Already Exists';
END;
ELSE
BEGIN
	 PRINT 'SOCIAL_HISTORY - Creating';
	 CREATE TABLE SOCIAL_HISTORY
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
	 PRINT 'SOCIAL_HISTORY - Complete';
END;

-- VITAL_SIGNS Table
IF OBJECT_ID('VITAL_SIGNS') IS NOT NULL
BEGIN
	 PRINT 'VITAL_SIGNS Already Exists';
END;
ELSE
BEGIN
	 PRINT 'VITAL_SIGNS - Creating';
	 CREATE TABLE VITAL_SIGNS
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
	 PRINT 'VITAL_SIGNS - Complete';
END;

-- TUMOR Table
IF OBJECT_ID('TUMOR') IS NOT NULL
BEGIN
	 PRINT 'TUMOR Already Exists';
END;
ELSE
BEGIN
	 PRINT 'TUMOR - Creating';
	 CREATE TABLE TUMOR
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
	 PRINT 'TUMOR - Complete';
END;

-- TUMOR Table
IF OBJECT_ID('LANGUAGES') IS NOT NULL
BEGIN
	 PRINT 'LANGUAGES Already Exists';
END;
ELSE
BEGIN
	 PRINT 'LANGUAGES - Creating';
	 CREATE TABLE LANGUAGES
	 (
					  PERSON_ID       nvarchar(36) NOT NULL,
					  LANG_ISO        nvarchar(3) NOT NULL,
					  LANG_USAGE      nchar	DEFAULT 'U',
					  LANG_PRIMARY    nchar DEFAULT 'U',
					  CONSTRAINT PK_CHORDS_LANGUAGES PRIMARY KEY CLUSTERED(PERSON_ID, LANG_ISO)
	 );
	 PRINT 'LANGUAGES - Complete';
END;

-- CENSUS_LOCATION Table
IF OBJECT_ID('CENSUS_LOCATION') IS NOT NULL
BEGIN
	 PRINT 'CENSUS_LOCATION Already Exists';
END;
ELSE
BEGIN
	 PRINT 'CENSUS_LOCATION - Creating';
	 CREATE TABLE CENSUS_LOCATION
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
					  CONSTRAINT PK_CHORDS_CENSUS_LOCATION PRIMARY KEY CLUSTERED(PERSON_ID, LOC_START)
	 );
	 PRINT 'CENSUS_LOCATION - Complete';
END;