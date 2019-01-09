DECLARE @datavalidation TABLE
(TableName      VARCHAR(250),
 ColumnName     VARCHAR(250),
 IsNullable     VARCHAR(4),
 CharaterLength INT,
 [Precision]    TINYINT,
 [Scale]        INT,
 DT_Preceision  INT
);

INSERT INTO @datavalidation
VALUES      (
       'CENSUS_DEMOG', 'CENSUS_YEAR', 'NO', NULL, 10, 0, NULL), (
       'CENSUS_DEMOG', 'GEOCODE', 'NO', 15, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'BLOCK', 'YES', 3, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'CENSUS_DATA_SRC', 'YES', 26, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'CHORDS_GEOLEVEL', 'YES', 10, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'STATE', 'YES', 2, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'COUNTY', 'YES', 3, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'TRACT', 'YES', 6, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'BLOCKGP', 'YES', 1, NULL, NULL, NULL), (
       'CENSUS_DEMOG', 'HOUSES_N', 'YES', NULL, 10, 0, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_WH', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_BL', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_AM', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_AS', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_HA', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_OT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_NHS_ML', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_WH', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_BL', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_AM', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_AS', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_HA', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_OT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RA_HIS_ML', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_OCCUPIED', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_OWN', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_RENT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_FORRENT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_FORSALE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_RENTSOLD', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_SEASONAL', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_MIGRANT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_OTHER', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION1', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION2', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION3', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION4', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION5', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION6', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION7', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'EDUCATION8', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'MEDFAMINCOME', 'YES', NULL, 10, 0, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME1', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME2', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME3', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME4', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME5', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME6', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME7', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME8', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME9', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME10', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME11', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME12', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME13', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME14', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME15', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMINCOME16', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'MEDHOUSINCOME', 'YES', NULL, 10, 0, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME1', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME2', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME3', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME4', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME5', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME6', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME7', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME8', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME9', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME10', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME11', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME12', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME13', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME14', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME15', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSINCOME16', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_LT_50', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_50_74', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_75_99', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_100_124', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_125_149', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_150_174', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_175_184', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_185_199', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'POV_GT_200', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'ENGLISH_SPEAKER', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'SPANISH_SPEAKER', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'BORNINUS', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'MOVEDINLAST12MON', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'MARRIED', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'DIVORCED', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'DISABILITY', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'UNEMPLOYMENT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'UNEMPLOYMENT_MALE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'INS_MEDICARE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'INS_MEDICAID', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HH_NOCAR', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HH_PUBLIC_ASSISTANCE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HMOWNER_COSTS_MORT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HMOWNER_COSTS_NO_MORT', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOMES_MEDVALUE', 'YES', NULL, 10, 0, NULL), (
       'CENSUS_DEMOG', 'PCT_CROWDING', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FEMALE_HEAD_OF_HH', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'MGR_FEMALE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'MGR_MALE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'RESIDENTS_65', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'SAME_RESIDENCE', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'FAMPOVERTY', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'HOUSPOVERTY', 'YES', NULL, 11, 10, NULL), (
       'CENSUS_DEMOG', 'ZIP', 'YES', 5, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'EVERNDC', 'NDC', 'NO', 11, NULL, NULL, NULL), (
       'EVERNDC', 'GENERIC', 'NO', 105, NULL, NULL, NULL), (
       'EVERNDC', 'BRAND', 'YES', 105, NULL, NULL, NULL), (
       'EVERNDC', 'GPI', 'YES', 14, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS1', 'YES', 8, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS2', 'YES', 8, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS3', 'YES', 8, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS4', 'YES', 8, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS5', 'YES', 8, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS6', 'YES', 8, NULL, NULL, NULL), (
       'EVERNDC', 'AHFS7', 'YES', 8, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'PROVIDER_SPECIALTY', 'PROVIDER', 'NO', 36, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'SPECIALTY', 'NO', 3, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'SPECIALTY2', 'YES', 3, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'SPECIALTY3', 'YES', 3, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'SPECIALTY4', 'YES', 3, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'PROVIDER_TYPE', 'NO', 3, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'PROVIDER_BIRTH_YEAR', 'YES', NULL, 4, 0, NULL), (
       'PROVIDER_SPECIALTY', 'PROVIDER_GENDER', 'YES', 1, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'PROVIDER_RACE', 'YES', 2, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'PROVIDER_HISPANIC', 'YES', 1, NULL, NULL, NULL), (
       'PROVIDER_SPECIALTY', 'YEAR_GRADUATED', 'YES', NULL, 4, 0, NULL);

INSERT INTO @datavalidation
VALUES      (
       'DEATH', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'DEATH', 'DEATHDT', 'YES', NULL, NULL, NULL, 0), (
       'DEATH', 'DTIMPUTE', 'YES', 1, NULL, NULL, NULL), (
       'DEATH', 'SOURCE', 'NO', 1, NULL, NULL, NULL), (
       'DEATH', 'CONFIDENCE', 'YES', 1, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'CAUSE_OF_DEATH', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'CAUSE_OF_DEATH', 'COD', 'NO', 6, NULL, NULL, NULL), (
       'CAUSE_OF_DEATH', 'DX_CODETYPE', 'YES', 2, NULL, NULL, NULL), (
       'CAUSE_OF_DEATH', 'CAUSETYPE', 'YES', 1, NULL, NULL, NULL), (
       'CAUSE_OF_DEATH', 'SOURCE', 'NO', 1, NULL, NULL, NULL), (
       'CAUSE_OF_DEATH', 'CONFIDENCE', 'YES', 1, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'DEMOGRAPHICS', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'MRN', 'YES', 36, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'BIRTH_DATE', 'NO', NULL, NULL, NULL, 0), (
       'DEMOGRAPHICS', 'GENDER', 'NO', 1, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'PRIMARY_LANGUAGE', 'NO', 3, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'NEEDS_INTERPRETER', 'NO', 1, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'RACE1', 'NO', 2, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'RACE2', 'YES', 2, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'RACE3', 'YES', 2, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'RACE4', 'YES', 2, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'RACE5', 'YES', 2, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'HISPANIC', 'NO', 1, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'SEXUAL_ORIENTATION', 'NO', 2, NULL, NULL, NULL), (
       'DEMOGRAPHICS', 'GENDER_IDENTITY', 'YES', 2, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'LINKAGE', 'LINK_ID', 'NO', 50, NULL, NULL, NULL), (
       'LINKAGE', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'LINKAGE', 'LINE', 'NO', NULL, 5, 0, NULL), (
       'LINKAGE', 'LINK_SRC_ID', 'NO', 12, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'BENEFIT', 'BENEFIT_ID', 'NO', NULL, 10, NULL, NULL), (
       'BENEFIT', 'LOAD_DATE', 'NO', NULL, NULL, NULL, 3), (
       'BENEFIT', 'REFRESH_DATE', 'YES', NULL, NULL, NULL, 3), (
       'BENEFIT', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'BENEFIT', 'BENEFIT_TYPE', 'NO', 2, NULL, NULL, NULL), (
       'BENEFIT', 'BENEFIT_CAT', 'NO', 2, NULL, NULL, NULL), (
       'BENEFIT', 'LOCAL_CD', 'YES', 20, NULL, NULL, NULL), (
       'BENEFIT', 'LOCAL_DESCRIPTION', 'YES', 50, NULL, NULL, NULL), (
       'BENEFIT', 'BENEFIT_DATE', 'YES', NULL, NULL, NULL, 3), (
       'BENEFIT', 'ENC_ID', 'YES', 36, NULL, NULL, NULL), (
       'BENEFIT', 'START_DATE', 'YES', NULL, NULL, NULL, 3), (
       'BENEFIT', 'END_DATE', 'YES', NULL, NULL, NULL, 3);

INSERT INTO @datavalidation
VALUES      (
       'ENCOUNTERS', 'ENC_ID', 'NO', 36, NULL, NULL, NULL), (
       'ENCOUNTERS', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'ENCOUNTERS', 'ADATE', 'NO', NULL, NULL, NULL, 0), (
       'ENCOUNTERS', 'DDATE', 'YES', NULL, NULL, NULL, 0), (
       'ENCOUNTERS', 'ENCTYPE', 'NO', 2, NULL, NULL, NULL), (
       'ENCOUNTERS', 'ENCOUNTER_SUBTYPE', 'NO', 2, NULL, NULL, NULL), (
       'ENCOUNTERS', 'PROVIDER', 'NO', 36, NULL, NULL, NULL), (
       'ENCOUNTERS', 'ENC_COUNT', 'YES', NULL, 3, 0, NULL), (
       'ENCOUNTERS', 'DRG_VALUE', 'YES', 4, NULL, NULL, NULL), (
       'ENCOUNTERS', 'DRG_VERSION', 'YES', 1, NULL, NULL, NULL), (
       'ENCOUNTERS', 'FACILITY_CODE', 'NO', 36, NULL, NULL, NULL), (
       'ENCOUNTERS', 'DISCHARGE_DISPOSITION', 'YES', 1, NULL, NULL, NULL), (
       'ENCOUNTERS', 'DISCHARGE_STATUS', 'YES', 2, NULL, NULL, NULL), (
       'ENCOUNTERS', 'ADMITTING_SOURCE', 'YES', 2, NULL, NULL, NULL), (
       'ENCOUNTERS', 'DEPARTMENT', 'YES', 4, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'DIAGNOSES', 'DIAGNOSES_ID', 'NO', NULL, 10, 0, NULL), (
       'DIAGNOSES', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'DIAGNOSES', 'ENC_ID', 'NO', 36, NULL, NULL, NULL), (
       'DIAGNOSES', 'ADATE', 'NO', NULL, NULL, NULL, 0), (
       'DIAGNOSES', 'ENDDATE', 'YES', NULL, NULL, NULL, 0), (
       'DIAGNOSES', 'ENCTYPE', 'NO', 2, NULL, NULL, NULL), (
       'DIAGNOSES', 'PROVIDER', 'NO', 36, NULL, NULL, NULL), (
       'DIAGNOSES', 'DIAGPROVIDER', 'NO', 36, NULL, NULL, NULL), (
       'DIAGNOSES', 'DX', 'NO', 18, NULL, NULL, NULL), (
       'DIAGNOSES', 'DX_CODETYPE', 'NO', 2, NULL, NULL, NULL), (
       'DIAGNOSES', 'DX_NAME', 'YES', 200, NULL, NULL, NULL), (
       'DIAGNOSES', 'DX_ORIGIN', 'NO', 2, NULL, NULL, NULL), (
       'DIAGNOSES', 'ORIGDX', 'NO', 18, NULL, NULL, NULL), (
       'DIAGNOSES', 'PRINCIPAL_DX', 'NO', 1, NULL, NULL, NULL), (
       'DIAGNOSES', 'PRIMARY_DX', 'NO', 1, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'ENROLLMENT', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'ENROLLMENT', 'ENR_START', 'NO', NULL, NULL, NULL, 0), (
       'ENROLLMENT', 'ENR_END', 'NO', NULL, NULL, NULL, 0), (
       'ENROLLMENT', 'INS_MEDICAID', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_COMMERCIAL', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_PRIVATEPAY', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_STATESUBSIDIZED', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_SELFFUNDED', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_HIGHDEDUCTIBLE', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_MEDICARE', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_MEDICARE_A', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_MEDICARE_B', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_MEDICARE_C', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_MEDICARE_D', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'INS_OTHER', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'PLAN_HMO', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'PLAN_POS', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'PLAN_PPO ', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'PLAN_INDEMNITY', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'DRUGCOV', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'OUTSIDE_UTILIZATION', 'NO', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'ENROLLMENT_BASIS', 'YES', 1, NULL, NULL, NULL), (
       'ENROLLMENT', 'PCC', 'YES', 4, NULL, NULL, NULL), (
       'ENROLLMENT', 'PCP', 'YES', 36, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'LAB_RESULTS', 'LAB_RESULTS_ID', 'NO', NULL, 10, 0, NULL), (
       'LAB_RESULTS', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'LAB_RESULTS', 'RESULT_DT', 'NO', NULL, NULL, NULL, 0), (
       'LAB_RESULTS', 'RESULT_TM', 'YES', NULL, NULL, NULL, 7), (
       'LAB_RESULTS', 'LAB_DT', 'YES', NULL, NULL, NULL, 0), (
       'LAB_RESULTS', 'LAB_TM', 'YES', NULL, NULL, NULL, 7), (
       'LAB_RESULTS', 'TEST_TYPE', 'NO', 20, NULL, NULL, NULL), (
       'LAB_RESULTS', 'LOCAL_CD', 'NO', 25, NULL, NULL, NULL), (
       'LAB_RESULTS', 'BATTERY_CD', 'NO', 150, NULL, NULL, NULL), (
       'LAB_RESULTS', 'LOINC', 'YES', 10, NULL, NULL, NULL), (
       'LAB_RESULTS', 'STAT', 'YES', 1, NULL, NULL, NULL), (
       'LAB_RESULTS', 'PT_LOC', 'YES', 1, NULL, NULL, NULL), (
       'LAB_RESULTS', 'RESULT_LOC', 'YES', 1, NULL, NULL, NULL), (
       'LAB_RESULTS', 'PX', 'YES', 6, NULL, NULL, NULL), (
       'LAB_RESULTS', 'CODETYPE', 'YES', 1, NULL, NULL, NULL), (
       'LAB_RESULTS', 'ORDER_ID', 'NO', 36, NULL, NULL, NULL), (
       'LAB_RESULTS', 'ORDER_DT', 'YES', NULL, NULL, NULL, 0), (
       'LAB_RESULTS', 'RESULT_NUM', 'YES', NULL, 20, 0, NULL), (
       'LAB_RESULTS', 'RESULT_C', 'NO', 20, NULL, NULL, NULL), (
       'LAB_RESULTS', 'MODIFIER', 'NO', 2, NULL, NULL, NULL), (
       'LAB_RESULTS', 'RESULT_UNIT', 'NO', 11, NULL, NULL, NULL), (
       'LAB_RESULTS', 'NORMAL_LOW_C', 'YES', 10, NULL, NULL, NULL), (
       'LAB_RESULTS', 'MODIFIER_LOW', 'YES', 2, NULL, NULL, NULL), (
       'LAB_RESULTS', 'NORMAL_HIGH_C', 'YES', 10, NULL, NULL, NULL), (
       'LAB_RESULTS', 'MODIFIER_HIGH', 'YES', 2, NULL, NULL, NULL), (
       'LAB_RESULTS', 'ABN_IND', 'YES', 2, NULL, NULL, NULL), (
       'LAB_RESULTS', 'ORDER_PROV', 'YES', 36, NULL, NULL, NULL), (
       'LAB_RESULTS', 'ORDER_DEPT', 'YES', 4, NULL, NULL, NULL), (
       'LAB_RESULTS', 'FACILITY_CODE', 'YES', 36, NULL, NULL, NULL), (
       'LAB_RESULTS', 'SPECIMEN_ID', 'YES', 36, NULL, NULL, NULL), (
       'LAB_RESULTS', 'SPECIMEN_SOURCE', 'YES', 6, NULL, NULL, NULL), (
       'LAB_RESULTS', 'ROW_ID', 'YES', 8, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'PHARMACY', 'PHARMACY_ID', 'NO', NULL, 10, 0, NULL), (
       'PHARMACY', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'PHARMACY', 'RXDATE', 'NO', NULL, NULL, NULL, 0), (
       'PHARMACY', 'NDC', 'NO', 11, NULL, NULL, NULL), (
       'PHARMACY', 'RXSUP', 'YES', NULL, 4, 0, NULL), (
       'PHARMACY', 'RXAMT', 'NO', NULL, 16, 10, NULL), (
       'PHARMACY', 'RXMD', 'NO', 36, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'PRESCRIBING', 'PRESCRIBING_ID', 'NO', NULL, 10, 0, NULL), (
       'PRESCRIBING', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'PRESCRIBING', 'ENC_ID', 'YES', 36, NULL, NULL, NULL), (
       'PRESCRIBING', 'RXMD', 'NO', 36, NULL, NULL, NULL), (
       'PRESCRIBING', 'RX_ORDER_DATE', 'YES', NULL, NULL, NULL, 0), (
       'PRESCRIBING', 'RX_ORDER_TIME', 'YES', NULL, NULL, NULL, 7), (
       'PRESCRIBING', 'RX_START_DATE', 'YES', NULL, NULL, NULL, 0), (
       'PRESCRIBING', 'RX_END_DATE', 'YES', NULL, NULL, NULL, 0), (
       'PRESCRIBING', 'RX_QUANTITY', 'YES', 8, NULL, NULL, NULL), (
       'PRESCRIBING', 'RX_QUANTITY_NUM', 'YES', NULL, 8, 0, NULL), (
       'PRESCRIBING', 'RX_QUANTITY_UNIT', 'YES', 2, NULL, NULL, NULL), (
       'PRESCRIBING', 'RX_REFILLS', 'YES', NULL, 8, 0, NULL), (
       'PRESCRIBING', 'RX_DAYS_SUPPLY', 'YES', NULL, 8, 0, NULL), (
       'PRESCRIBING', 'RX_FREQUENCY', 'YES', 2, NULL, NULL, NULL), (
       'PRESCRIBING', 'RX_INSTRUCTIONS', 'YES', 100, NULL, NULL, NULL), (
       'PRESCRIBING', 'RX_BASIS', 'YES', 2, NULL, NULL, NULL), (
       'PRESCRIBING', 'RXNORM', 'YES', 8, NULL, NULL, NULL), (
       'PRESCRIBING', 'GENERIC_MED_NAME', 'NO', 105, NULL, NULL, NULL), (
       'PRESCRIBING', 'RX_DOSE_ORDERED', 'YES', NULL, 8, 0, NULL), (
       'PRESCRIBING', 'RX_DOSE_ORDERED_UNIT', 'YES', 20, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'PROCEDURES', 'PROCEDURES_ID', 'NO', NULL, 10, 0, NULL), (
       'PROCEDURES', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'PROCEDURES', 'PROVIDER', 'NO', 36, NULL, NULL, NULL), (
       'PROCEDURES', 'PROCDATE', 'NO', NULL, NULL, NULL, 0), (
       'PROCEDURES', 'ENC_ID', 'NO', 36, NULL, NULL, NULL), (
       'PROCEDURES', 'PERFORMINGPROVIDER', 'NO', 36, NULL, NULL, NULL), (
       'PROCEDURES', 'ADATE', 'NO', NULL, NULL, NULL, 0), (
       'PROCEDURES', 'ENCTYPE', 'NO', 2, NULL, NULL, NULL), (
       'PROCEDURES', 'PX', 'NO', 10, NULL, NULL, NULL), (
       'PROCEDURES', 'ORIGPX', 'YES', 10, NULL, NULL, NULL), (
       'PROCEDURES', 'PX_CODETYPE', 'NO', 2, NULL, NULL, NULL), (
       'PROCEDURES', 'PXCNT', 'YES', NULL, 7, 0, NULL), (
       'PROCEDURES', 'CPTMOD1', 'YES', 2, NULL, NULL, NULL), (
       'PROCEDURES', 'CPTMOD2', 'YES', 2, NULL, NULL, NULL), (
       'PROCEDURES', 'CPTMOD3', 'YES', 2, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'SOCIAL_HISTORY', 'SOCIAL_HISTORY_ID', 'NO', NULL, 10, 0, NULL), (
       'SOCIAL_HISTORY', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ENC_ID', 'YES', 36, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'CONTACT_DATE', 'NO', NULL, NULL, NULL, 0), (
       'SOCIAL_HISTORY', 'TOBACCO_USER', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ONC_SMOKING_STATUS', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ALCOHOL_USER', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ILL_DRUG_USER', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'TOBACCO_PAK_PER_DY', 'YES', 20, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'TOBACCO_USED_YEARS', 'YES', 20, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SMOKING_QUIT_DATE', 'YES', NULL, NULL, NULL, 3), (
       'SOCIAL_HISTORY', 'SMOKELESS_QUIT_DATE', 'YES', NULL, NULL, NULL, 3), (
       'SOCIAL_HISTORY', 'TOBACCO_COMMENT', 'YES', 255, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'CIGARETTES_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'PIPES_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'CIGARS_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SNUFF_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'CHEW_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'UNSPECIFIED_TOBACCO', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ALCOHOL_OZ_PER_WK', 'YES', 15, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ALCOHOL_COMMENT', 'YES', 255, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'IV_DRUG_USER_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ILLICIT_DRUG_FREQ', 'YES', 5, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ILLICIT_DRUG_COMMENT', 'YES', 255, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'FEMALE_PARTNER_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'MALE_PARTNER_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'CONDOM_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'PILL_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'DIAPHRAGM_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'IUD_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SURGICAL_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SPERMICIDE_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'IMPLANT_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'RHYTHM_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'INJECTION_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SPONGE_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'BC_INSERTS_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'ABSTINENCE_YN', 'YES', 1, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SEX_COMMENT', 'YES', 255, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'YEARS_EDUCATION', 'YES', 15, NULL, NULL, NULL), (
       'SOCIAL_HISTORY', 'SEXUALLY_ACTV', 'YES', 1, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'VITAL_SIGNS', 'VITAL_SIGNS_ID', 'NO', NULL, 10, 0, NULL), (
       'VITAL_SIGNS', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'MEASURE_DATE', 'NO', NULL, NULL, NULL, 0), (
       'VITAL_SIGNS', 'MEASURE_TIME', 'YES', NULL, NULL, NULL, 7), (
       'VITAL_SIGNS', 'ENC_ID', 'YES', 36, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'ENCTYPE', 'YES', 2, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'HT', 'YES', NULL, 7, 3, NULL), (
       'VITAL_SIGNS', 'WT', 'YES', NULL, 8, 4, NULL), (
       'VITAL_SIGNS', 'DIASTOLIC', 'YES', NULL, 3, 0, NULL), (
       'VITAL_SIGNS', 'SYSTOLIC', 'YES', NULL, 3, 0, NULL), (
       'VITAL_SIGNS', 'HT_RAW', 'YES', 10, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'WT_RAW', 'YES', 10, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'BMI_RAW', 'YES', 5, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'DIASTOLIC_RAW', 'YES', 7, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'SYSTOLIC_RAW', 'YES', 7, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'BP_TYPE', 'YES', 1, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'POSITION', 'YES', 1, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'HEAD_CIR_RAW', 'YES', 6, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'RESPIR_RAW', 'YES', 6, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'TEMP_RAW', 'YES', 6, NULL, NULL, NULL), (
       'VITAL_SIGNS', 'PULSE_RAW', 'YES', 6, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'TUMOR', 'TUMOR_ID', 'NO', NULL, 10, 0, NULL), (
       'TUMOR', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'TUMOR', 'DXDATE', 'NO', NULL, NULL, NULL, 0), (
       'TUMOR', 'ICDOSITE', 'NO', 4, NULL, NULL, NULL), (
       'TUMOR', 'STAGEGEN', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'SS1977', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'SS2000', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'STAGEAJ', 'NO', 4, NULL, NULL, NULL), (
       'TUMOR', 'AJCC_ED', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'AJCC_GRP', 'YES', 2, NULL, NULL, NULL), (
       'TUMOR', 'AJCC_FULL_DER', 'YES', 20, NULL, NULL, NULL), (
       'TUMOR', 'MORPH', 'NO', 4, NULL, NULL, NULL), (
       'TUMOR', 'BEHAV', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'GRADE', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'DXYEAR', 'NO', NULL, 4, 0, NULL), (
       'TUMOR', 'DXAGE', 'NO', NULL, 3, 0, NULL), (
       'TUMOR', 'BDATE', 'NO', NULL, NULL, NULL, 0), (
       'TUMOR', 'GENDER', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'RACE1', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'RACE2', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'RACE3', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'RACE4', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'RACE5', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'HISPANIC', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'CLASS', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'VITAL', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'DCAUSE', 'YES', 6, NULL, NULL, NULL), (
       'TUMOR', 'DOD', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'DT_FU', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'LATERALITY', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'IDPLAN', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DCNFRM', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'DSTZ', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DAJC1T_P', 'YES', 5, NULL, NULL, NULL), (
       'TUMOR', 'DAJC1N_P', 'YES', 5, NULL, NULL, NULL), (
       'TUMOR', 'DAJC1M_P', 'YES', 5, NULL, NULL, NULL), (
       'TUMOR', 'DAJC1T_C', 'YES', 5, NULL, NULL, NULL), (
       'TUMOR', 'DAJC1N_C', 'YES', 5, NULL, NULL, NULL), (
       'TUMOR', 'DAJC1M_C', 'YES', 5, NULL, NULL, NULL), (
       'TUMOR', 'DSRG_FAC', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DRAD_FAC', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DCHM_FAC', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DHRM_FAC', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DIMM_FAC', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DOTH_FAC', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DNDI', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DNDX', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DTMRK1', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DTMRK2', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DTMRK3', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'CLN_STG', 'NO', 4, NULL, NULL, NULL), (
       'TUMOR', 'EOD', 'YES', 12, NULL, NULL, NULL), (
       'TUMOR', 'DT_SURG', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'DT_CHEMO', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'DT_HORM', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'DT_RAD', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'DT_BRM', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'DT_OTH', 'YES', NULL, NULL, NULL, 0), (
       'TUMOR', 'R_N_SURG', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'R_N_CHEMO', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'R_N_HORM', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'R_N_RAD', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'R_N_BRM', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'R_N_OTH', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'DSRG_SUM', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DRAD_SUM', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DCHM_SUM', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DHRM_SUM', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DIMM_SUM', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'DOTH_SUM', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'CS_SZ', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'CS_EXT', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'CS_NODES', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'CS_NODES_EVAL', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'CS_METS', 'YES', 2, NULL, NULL, NULL), (
       'TUMOR', 'CS_METS_EVAL', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'SSF1', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF2', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF3', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF4', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF5', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF6', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF7', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF8', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF9', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF10', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF11', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF12', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF13', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF14', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF15', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF16', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF17', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF18', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF19', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF20', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF21', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF22', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF23', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF24', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'SSF25', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'PAL_FAC', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'PAL_SUM', 'NO', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_T6', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DER_T6_D', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_N6', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DER_N6_D', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_M6', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DER_M6_D', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_T7', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DER_T7_D', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_N7', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DER_N7_D', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_M7', 'YES', 3, NULL, NULL, NULL), (
       'TUMOR', 'DER_M7_D', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'DER_SS2000F', 'YES', 1, NULL, NULL, NULL), (
       'TUMOR', 'RECUR_DT', 'YES', NULL, NULL, NULL, 3), (
       'TUMOR', 'RECUR_TYPE', 'NO', 2, NULL, NULL, NULL), (
       'TUMOR', 'RECUR_FL', 'YES', 2, NULL, NULL, NULL), (
       'TUMOR', 'DATA_SOURCE', 'YES', 4, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'LANGUAGES', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'LANGUAGES', 'LANG_ISO', 'NO', 3, NULL, NULL, NULL), (
       'LANGUAGES', 'LANG_USAGE', 'YES', 1, NULL, NULL, NULL), (
       'LANGUAGES', 'LANG_PRIMARY', 'YES', 1, NULL, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'CENSUS_LOCATION', 'PERSON_ID', 'NO', 36, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'LOC_START', 'NO', NULL, NULL, NULL, 3), (
       'CENSUS_LOCATION', 'LOC_END', 'YES', NULL, NULL, NULL, 3), (
       'CENSUS_LOCATION', 'GEOCODE', 'YES', 15, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'GEOCODE_BOUNDARY_YEAR', 'YES', NULL, 8, 0, NULL), (
       'CENSUS_LOCATION', 'GEOLEVEL', 'YES', 1, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'MATCH_STRENGTH', 'YES', 1, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'CITY_GEOCODE', 'YES', 35, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'LATITUDE', 'YES', NULL, 8, 6, NULL), (
       'CENSUS_LOCATION', 'LONGITUDE', 'YES', NULL, 9, 6, NULL), (
       'CENSUS_LOCATION', 'GEOCODE_APP', 'YES', 50, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'GEOCODE_COUNTY', 'NO', 35, NULL, NULL, NULL), (
       'CENSUS_LOCATION', 'ADDRESS_TYPE_CODE', 'YES', 2, NULL, NULL, NULL);

IF OBJECT_ID('CHORDS_TABLENAMES') IS NOT NULL
BEGIN
    UPDATE a
    SET a.TableName = b.NEW_NAME
    FROM @datavalidation a
    JOIN CHORDS_TABLENAMES b ON b.ORG_NAME = a.TableName
END;

SELECT
       a.TableName,
       a.ColumnName,
       CASE
           WHEN b.COLUMN_NAME IS NULL
           THEN 'TABLE OR COLUMN MISSING'
           WHEN b.COLUMN_NAME IS NOT NULL
                AND (ISNULL(a.CharaterLength, 0) = ISNULL(b.CHARACTER_MAXIMUM_LENGTH, 0)
                     AND ISNULL(a.Precision, 0) = ISNULL(b.NUMERIC_PRECISION, 0)
                     AND ISNULL(a.Scale, 0) = ISNULL(b.NUMERIC_SCALE, 0)
				 AND ISNULL(a.DT_Preceision, 0) = ISNULL(b.DATETIME_PRECISION, 0)
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
     @datavalidation a
     LEFT JOIN INFORMATION_SCHEMA.COLUMNS b
          ON a.TableName = b.TABLE_NAME
             AND a.ColumnName = b.COLUMN_NAME;
