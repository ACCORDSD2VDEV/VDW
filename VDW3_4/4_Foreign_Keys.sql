/***********************
-- DEMOGRAPHICS Table
***********************/
IF OBJECT_ID('DEMOGRAPHICS') IS NULL
BEGIN
	 PRINT 'DEMOGRAPHICS DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'DEMOGRAPHICS - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    --NONE
    ---Foreign keys to lookup tables
    IF OBJECT_ID('LANGUAGES_ISO') IS NOT NULL
    BEGIN
	   ALTER TABLE DEMOGRAPHICS
		  ADD CONSTRAINT FK_CHORDS_DEMOGRAPHICS_LANGUAGES_ISO FOREIGN KEY(PRIMARY_LANGUAGE) REFERENCES LANGUAGES_ISO_LU([ISO_639-2_CODE]);
    END;
    IF OBJECT_ID('GENDER_IDENTITY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEMOGRAPHICS
	   ADD CONSTRAINT FK_CHORDS_DEMOGRAPHICS_GENDER_IDENTITY_LU FOREIGN KEY(GENDER_IDENTITY) REFERENCES GENDER_IDENTITY_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('GENDER_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEMOGRAPHICS
		  ADD CONSTRAINT FK_CHORDS_DEMOGRAPHICS_GENDER_LU FOREIGN KEY(GENDER) REFERENCES GENDER_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('RACE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEMOGRAPHICS
	   ADD CONSTRAINT FK_CHORDS_DEMOGRAPHICS_RACE_LU FOREIGN KEY(RACE1) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_DEMOGRAPHICS_RACE_LU2 FOREIGN KEY(RACE2) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_DEMOGRAPHICS_RACE_LU3 FOREIGN KEY(RACE3) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_DEMOGRAPHICS_RACE_LU4 FOREIGN KEY(RACE4) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_DEMOGRAPHICS_RACE_LU5 FOREIGN KEY(RACE5) REFERENCES RACE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('SEXUAL_ORIENTATION_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEMOGRAPHICS
	   ADD CONSTRAINT FK_CHORDS_DEMOGRAPHICS_SEXUAL_ORIENTATION_LU FOREIGN KEY(SEXUAL_ORIENTATION) REFERENCES SEXUAL_ORIENTATION_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('YNU_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEMOGRAPHICS
	   ADD CONSTRAINT FK_CHORDS_DEMOGRAPHICS_YNU_LU FOREIGN KEY(NEEDS_INTERPRETER) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_DEMOGRAPHICS_YNU_LU2 FOREIGN KEY(HISPANIC) REFERENCES YNU_LU(ABBREVIATION);
    END;		
    PRINT 'DEMOGRAPHICS - Foreign Keys Added';
END;

/***********************
-- ENCOUNTERS Table
***********************/
IF OBJECT_ID('ENCOUNTERS') IS NULL
BEGIN
	 PRINT 'ENCOUNTERS DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'ENCOUNTERS - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    ALTER TABLE ENCOUNTERS
    ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_ENCOUNTERS_PROVIDER_SPECIALTY FOREIGN KEY([PROVIDER]) REFERENCES PROVIDER_SPECIALTY([PROVIDER]);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('ADMITTING_SOURCE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENCOUNTERS
	   ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_ADMITTING_SOURCE_LU FOREIGN KEY(ADMITTING_SOURCE) REFERENCES ADMITTING_SOURCE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('DEPARTMENT_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENCOUNTERS
	   ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_DEPARTMENT_LU FOREIGN KEY(DEPARTMENT) REFERENCES DEPARTMENT_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('DISCHARGE_DISPOSITION_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENCOUNTERS
	   ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_DISCHARGE_DISPOSITION_LU FOREIGN KEY(DISCHARGE_DISPOSITION) REFERENCES DISCHARGE_DISPOSITION_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('DISCHARGE_STATUS_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENCOUNTERS
	   ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_DISCHARGE_STATUS_LU FOREIGN KEY(DISCHARGE_STATUS) REFERENCES DISCHARGE_STATUS_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('ENCOUNTER_SUBTYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENCOUNTERS
	   ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_ENCOUNTER_SUBTYPE_LU FOREIGN KEY(ENCOUNTER_SUBTYPE) REFERENCES ENCOUNTER_SUBTYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('ENCTYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENCOUNTERS
	   ADD CONSTRAINT FK_CHORDS_ENCOUNTERS_ENCTYPE_LU FOREIGN KEY(ENCTYPE) REFERENCES ENCTYPE_LU(ABBREVIATION);
    END;	

    PRINT 'ENCOUNTERS - Foreign Keys Added';
END;

/***********************
-- BENEFIT table
***********************/
IF OBJECT_ID('BENEFIT') IS NULL
BEGIN
    PRINT 'BENEFIT DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'BENEFIT - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    ALTER TABLE BENEFIT
    ADD CONSTRAINT FK_CHORDS_BENEFIT_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_BENEFIT_ENCOUNTERS FOREIGN KEY(ENC_ID) REFERENCES ENCOUNTERS(ENC_ID);
    
    ---Foreign keys to lookup tables
    IF OBJECT_ID('BENEFIT_TYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE BENEFIT
	   ADD CONSTRAINT FK_CHORDS_BENEFIT_BENEFIT_TYPE_LU FOREIGN KEY (BENEFIT_TYPE) REFERENCES BENEFIT_TYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('BENEFIT_CAT_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE BENEFIT
	   ADD CONSTRAINT FK_CHORDS_BENEFIT_BENEFIT_CAT_LU FOREIGN KEY (BENEFIT_CAT) REFERENCES BENEFIT_CAT_LU(ABBREVIATION)
    END;

    PRINT 'BENEFIT - Foreign Keys Added';
END;

/***********************
-- DIAGNOSES Table
***********************/
IF OBJECT_ID('DIAGNOSES') IS NULL
BEGIN
    PRINT 'DIAGNOSES DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'DIAGNOSES - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    ALTER TABLE DIAGNOSES
    ADD CONSTRAINT FK_CHORDS_DIAGNOSES_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_DIAGNOSES_ENCOUNTERS FOREIGN KEY(ENC_ID) REFERENCES ENCOUNTERS(ENC_ID),
	   CONSTRAINT FK_CHORDS_DIAGNOSES_PROVIDER_SPECIALTY FOREIGN KEY(DIAGPROVIDER) REFERENCES PROVIDER_SPECIALTY(PROVIDER),
	   CONSTRAINT FK_CHORDS_DIAGNOSES_PROVIDER_SPECIALTY1 FOREIGN KEY(PROVIDER) REFERENCES PROVIDER_SPECIALTY(PROVIDER);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('DX_CODETYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DIAGNOSES
	   ADD CONSTRAINT FK_CHORDS_DIAGNOSES_DX_CODETYPE_LU FOREIGN KEY(DX_CODETYPE) REFERENCES DX_CODETYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('PRIMARY_DX_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DIAGNOSES
	   ADD CONSTRAINT FK_CHORDS_DIAGNOSES_PRIMARY_DX_LU FOREIGN KEY(PRIMARY_DX) REFERENCES PRIMARY_DX_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('PRINCIPAL_DX_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DIAGNOSES
	   ADD CONSTRAINT FK_CHORDS_DIAGNOSES_PRINCIPAL_DX_LU FOREIGN KEY(PRINCIPAL_DX) REFERENCES PRINCIPAL_DX_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('DX_ORIGIN_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DIAGNOSES
	   ADD CONSTRAINT FK_CHORDS_DIAGNOSES_DX_ORIGIN_LU FOREIGN KEY(DX_ORIGIN) REFERENCES DX_ORIGIN_LU(ABBREVIATION);
    END;
    
    PRINT 'DIAGNOSES - Foreign Keys Added';
END;

/***********************
-- ENROLLMENT Table
***********************/
IF OBJECT_ID('ENROLLMENT') IS NULL
BEGIN
	 PRINT 'ENROLLMENT DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'ENROLLMENT - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    ALTER TABLE ENROLLMENT
    ADD CONSTRAINT FK_CHORDS_ENROLLMENT_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_ENROLLMENT_PROVIDER_SPECIALTY FOREIGN KEY(PCP) REFERENCES PROVIDER_SPECIALTY([PROVIDER]);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('ENROLLMENT_BASIS_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENROLLMENT
	   ADD CONSTRAINT FK_CHORDS_ENROLLMENT_ENROLLMENT_BASIS_LU FOREIGN KEY(ENROLLMENT_BASIS) REFERENCES ENROLLMENT_BASIS_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('YNU_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE ENROLLMENT
	   ADD CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU FOREIGN KEY(INS_MEDICAID) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU2 FOREIGN KEY(INS_COMMERCIAL) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU3 FOREIGN KEY(INS_PRIVATEPAY) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU4 FOREIGN KEY(INS_STATESUBSIDIZED) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU5 FOREIGN KEY(INS_SELFFUNDED) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU6 FOREIGN KEY(INS_HIGHDEDUCTIBLE) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU7 FOREIGN KEY(INS_MEDICARE) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU8 FOREIGN KEY(INS_MEDICARE_A) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU9 FOREIGN KEY(INS_MEDICARE_B) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU10 FOREIGN KEY(INS_MEDICARE_C) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU11 FOREIGN KEY(INS_MEDICARE_D) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU12 FOREIGN KEY(INS_OTHER) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU13 FOREIGN KEY(PLAN_HMO) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU14 FOREIGN KEY(PLAN_POS) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU15 FOREIGN KEY(PLAN_PPO) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU16 FOREIGN KEY(PLAN_INDEMNITY) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU17 FOREIGN KEY(DRUGCOV) REFERENCES YNU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_ENROLLMENT_YNU_LU18 FOREIGN KEY(OUTSIDE_UTILIZATION) REFERENCES YNU_LU(ABBREVIATION);
    END;	

    PRINT 'ENROLLMENT - Foreign Keys Added';
END;

/***********************
-- LAB_RESULTS Table
***********************/
IF OBJECT_ID('LAB_RESULTS') IS NULL
BEGIN
    PRINT 'LAB_RESULTS DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'LAB_RESULTS - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    ALTER TABLE LAB_RESULTS
    ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_LAB_RESULTS_PROVIDER_SPECIALTY FOREIGN KEY(ORDER_PROV) REFERENCES PROVIDER_SPECIALTY([PROVIDER]);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('ABN_IND_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_ABN_IND_LU FOREIGN KEY(ABN_IND) REFERENCES ABN_IND_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('CODETYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_CODETYPE_LU FOREIGN KEY(CODETYPE) REFERENCES CODETYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('MODIFIER_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_MODIFIER_LU FOREIGN KEY(MODIFIER) REFERENCES MODIFIER_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('PT_LOC_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_PT_LOC_LU FOREIGN KEY(PT_LOC) REFERENCES PT_LOC_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('RESULT_LOC_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_RESULT_LOC_LU FOREIGN KEY(RESULT_LOC) REFERENCES RESULT_LOC_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('SPECIMEN_SOURCE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_SPECIMEN_SOURCE_LU FOREIGN KEY(SPECIMEN_SOURCE) REFERENCES SPECIMEN_SOURCE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('STAT_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LAB_RESULTS
	   ADD CONSTRAINT FK_CHORDS_LAB_RESULTS_STAT_LU FOREIGN KEY(STAT) REFERENCES STAT_LU(ABBREVIATION);
    END;
    
    PRINT 'LAB_RESULTS - Foreign Keys Added';
END;
/***********************
-- PHARMACY Table
***********************/
IF OBJECT_ID('PHARMACY') IS NULL
BEGIN
    PRINT 'PHARMACY DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PHARMACY - Creating Foreign Keys';
    ---Foreign Keys to required/priority tables
    ALTER TABLE PHARMACY
    ADD CONSTRAINT FK_CHORDS_PHARMACY_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_PHARMACY_PROVIDER_SPECIALTY FOREIGN KEY(RXMD) REFERENCES PROVIDER_SPECIALTY([PROVIDER]);

    ---Foreign keys to lookup tables
    --NONE
    PRINT 'PHARMACY - Foreign Keys Added';
END;

/***********************
--PRESCRIBING TABLE
***********************/
IF OBJECT_ID('PRESCRIBING') IS NULL
BEGIN
    PRINT 'PRESCRIBING DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PRESCRIBING - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE PRESCRIBING
    ADD CONSTRAINT FK_CHORDS_PRESCRIBING_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_PRESCRIBING_ENCOUNTERS FOREIGN KEY(ENC_ID) REFERENCES ENCOUNTERS(ENC_ID),
	   CONSTRAINT FK_CHORDS_PRESCRIBING_PROVIDER_SPECIALTY FOREIGN KEY(RXMD) REFERENCES PROVIDER_SPECIALTY([PROVIDER]);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('RX_BASIS_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRESCRIBING
	   ADD CONSTRAINT FK_CHORDS_PRESCRIBING_RX_BASIS_LU FOREIGN KEY(RX_BASIS) REFERENCES RX_BASIS_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('RX_FREQUENCY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRESCRIBING
	   ADD CONSTRAINT FK_CHORDS_PRESCRIBING_RX_FREQUENCY_LU FOREIGN KEY(RX_FREQUENCY) REFERENCES RX_FREQUENCY_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('RX_QUANTITY_UNIT_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRESCRIBING
	   ADD CONSTRAINT FK_CHORDS_PRESCRIBING_RX_QUANTITY_UNIT_LU FOREIGN KEY(RX_QUANTITY_UNIT) REFERENCES RX_QUANTITY_UNIT_LU(ABBREVIATION);
    END;
      
    PRINT 'PRESCRIBING - Foreign Keys Added';
END;

/***********************
-- PROCEDURES Table
***********************/
IF OBJECT_ID('PROCEDURES') IS NULL
BEGIN
    PRINT 'PROCEDURES DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PROCEDURES - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE [PROCEDURES]
    ADD CONSTRAINT FK_CHORDS_PROCEDURES_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS( PERSON_ID),
		CONSTRAINT FK_CHORDS_PROCEDURES_ENCOUNTERS FOREIGN KEY(ENC_ID) REFERENCES ENCOUNTERS(ENC_ID),
		CONSTRAINT FK_CHORDS_PROCEDURES_PROVIDER_SPECIALTY FOREIGN KEY(PROVIDER) REFERENCES PROVIDER_SPECIALTY([PROVIDER]),
		CONSTRAINT FK_CHORDS_PROCEDURES_PROVIDER_SPECIALTY2 FOREIGN KEY(PERFORMINGPROVIDER) REFERENCES PROVIDER_SPECIALTY([PROVIDER]);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('PX_CODETYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE [PROCEDURES]
	   ADD CONSTRAINT FK_CHORDS_PROCEDURES_PX_CODETYPE_LU FOREIGN KEY(PX_CODETYPE) REFERENCES PX_CODETYPE_LU(ABBREVIATION);
    END;

    PRINT 'PROCEDURES - Foreign Keys Added';
END;

/***********************
-- SOCIAL_HISTORY Table
***********************/
IF OBJECT_ID('SOCIAL_HISTORY') IS NULL
BEGIN
    PRINT 'SOCIAL_HISTORY DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'SOCIAL_HISTORY - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE SOCIAL_HISTORY
    ADD CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_ENCOUNTERS FOREIGN KEY(ENC_ID) REFERENCES ENCOUNTERS(ENC_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('ONC_SMOKING_STATUS_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE SOCIAL_HISTORY
	   ADD CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_ONC_SMOKING_STATUS_LU FOREIGN KEY(ONC_SMOKING_STATUS) REFERENCES ONC_SMOKING_STATUS_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('SEXUALLY_ACTV_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE SOCIAL_HISTORY
	   ADD CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_SEXUALLY_ACTV_LU FOREIGN KEY(SEXUALLY_ACTV) REFERENCES SEXUALLY_ACTV_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('TOBACCO_USER_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE SOCIAL_HISTORY
	   ADD CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_TOBACCO_USER_LU FOREIGN KEY(TOBACCO_USER) REFERENCES TOBACCO_USER_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('YNQXU_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE SOCIAL_HISTORY
	   ADD CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNQXU_LU FOREIGN KEY(ILL_DRUG_USER) REFERENCES YNQXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNQXU_LU2 FOREIGN KEY(IV_DRUG_USER_YN) REFERENCES YNQXU_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('YNXU_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE SOCIAL_HISTORY
	   ADD CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU FOREIGN KEY(CIGARETTES_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU2 FOREIGN KEY(PIPES_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU3 FOREIGN KEY(CIGARS_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU4 FOREIGN KEY(SNUFF_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU5 FOREIGN KEY(CHEW_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU6 FOREIGN KEY(FEMALE_PARTNER_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU7 FOREIGN KEY(MALE_PARTNER_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU8 FOREIGN KEY(CONDOM_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU9 FOREIGN KEY(PILL_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU10 FOREIGN KEY(DIAPHRAGM_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU11 FOREIGN KEY(IUD_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU12 FOREIGN KEY(SURGICAL_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU13 FOREIGN KEY(SPERMICIDE_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU14 FOREIGN KEY(IMPLANT_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU15 FOREIGN KEY(RHYTHM_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU16 FOREIGN KEY(INJECTION_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU17 FOREIGN KEY(SPONGE_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU18 FOREIGN KEY(BC_INSERTS_YN) REFERENCES YNXU_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_SOCIAL_HISTORY_YNXU_LU19 FOREIGN KEY(ABSTINENCE_YN) REFERENCES YNXU_LU(ABBREVIATION);
    END;
    
    PRINT 'SOCIAL_HISTORY - Foreign Keys Added';
END;

/***********************
-- VITAL_SIGNS Table
***********************/
IF OBJECT_ID('VITAL_SIGNS') IS NULL
BEGIN
    PRINT 'VITAL_SIGNS DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'VITAL_SIGNS - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE VITAL_SIGNS
    ADD CONSTRAINT FK_CHORDS_VITAL_SIGNS_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID),
	   CONSTRAINT FK_CHORDS_VITAL_SIGNS_ENCOUNTERS FOREIGN KEY(ENC_ID) REFERENCES ENCOUNTERS(ENC_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('BP_TYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE VITAL_SIGNS
	   ADD CONSTRAINT FK_CHORDS_VITAL_SIGNS_BP_TYPE FOREIGN KEY(BP_TYPE) REFERENCES BP_TYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('POSITION_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE VITAL_SIGNS
	   ADD CONSTRAINT FK_CHORDS_VITAL_SIGNS_POSITION_LU FOREIGN KEY(POSITION) REFERENCES POSITION_LU(ABBREVIATION);
    END;

    PRINT 'VITAL_SIGNS - Foreign Keys Added';
END;

/***********************
-- PRO_SURVEYS
***********************/

IF OBJECT_ID('PRO_SURVEYS') IS NULL
BEGIN
    PRINT 'PRO_SURVEYS DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PRO_SURVEYS - Creating Foreign Keys';
	
	---Foreign Keys to required/priority tables
	---NONE
	
    ---Foreign keys to lookup tables
    IF OBJECT_ID('PRO_SURVEY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRO_SURVEYS
	   ADD  CONSTRAINT [FK_PRO_SURVEYS_PRO_SURVEY_LU] FOREIGN KEY([PRO_SURVEY]) REFERENCES [dbo].[PRO_SURVEY_LU] ([ABBREVIATION])
    END;
	IF OBJECT_ID('PRO_SURVEY_TYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRO_SURVEYS
	   ADD  CONSTRAINT [FK_PRO_SURVEYS_PRO_SURVEY_TYPE_LU] FOREIGN KEY([PRO_SURVEY_TYPE]) REFERENCES [dbo].[PRO_SURVEY_TYPE_LU] ([ABBREVIATION])
    END;
		
	PRINT 'PRO_SURVEYS - Foreign Keys Added';
END;

/***********************
-- PRO_QUESTIONS
***********************/

IF OBJECT_ID('PRO_QUESTIONS') IS NULL
BEGIN
    PRINT 'PRO_QUESTIONS DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PRO_QUESTIONS - Creating Foreign Keys';
	
	---Foreign Keys to required/priority tables
	ALTER TABLE [dbo].[PRO_QUESTIONS]  
		ADD  CONSTRAINT [FK_PRO_QUESTIONS_PRO_SURVEYS] FOREIGN KEY([PRO_ID]) REFERENCES [dbo].[PRO_SURVEYS] ([PRO_ID]);
		
	---Foreign keys to lookup tables
    IF OBJECT_ID('QUESTION_DOMAIN_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRO_QUESTIONS
	   ADD  CONSTRAINT [FK_PRO_QUESTIONS_QUESTION_DOMAIN_LU] FOREIGN KEY([QUESTION_DOMAIN]) REFERENCES [dbo].[QUESTION_DOMAIN_LU] ([ABBREVIATION])
    END;
		
	PRINT 'PRO_QUESTIONS - Foreign Keys Added';
END;

/***********************
-- PRO_RESPONSES
***********************/

IF OBJECT_ID('PRO_RESPONSES') IS NULL
BEGIN
    PRINT 'PRO_RESPONSES DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PRO_RESPONSES - Creating Foreign Keys';
	---Foreign Keys to required/priority tables
	ALTER TABLE [dbo].[PRO_RESPONSES]  
		ADD CONSTRAINT [FK_PRO_RESPONSES_DEMOGRAPHICS] FOREIGN KEY([PERSON_ID]) REFERENCES [dbo].[DEMOGRAPHICS] ([PERSON_ID]),
			CONSTRAINT [FK_PRO_RESPONSES_ENCOUNTERS] FOREIGN KEY([ENC_ID]) REFERENCES [dbo].[ENCOUNTERS] ([ENC_ID]),
			CONSTRAINT [FK_PRO_RESPONSES_PRO_QUESTIONS] FOREIGN KEY([PRO_ID], [QUESTION_ID], [QUESTION_VER]) REFERENCES [dbo].[PRO_QUESTIONS] ([PRO_ID], [QUESTION_ID], [QUESTION_VER]);
		---Foreign keys to lookup tables
    IF OBJECT_ID('MEDIUM_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRO_RESPONSES
	   ADD  CONSTRAINT [FK_PRO_RESPONSES_MEDIUM_LU] FOREIGN KEY([SURVEY_MEDIUM]) REFERENCES [dbo].[MEDIUM_LU] ([ABBREVIATION])
    END;
    IF OBJECT_ID('RESPONSE_SOURCE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRO_RESPONSES
	   ADD  CONSTRAINT [FK_PRO_RESPONSES_RESPONSE_SOURCE_LU] FOREIGN KEY([RESPONSE_SOURCE]) REFERENCES [dbo].[RESPONSE_SOURCE_LU] ([ABBREVIATION])
    END;
    IF OBJECT_ID('SURVEY_ADMINISTERED_BY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PRO_RESPONSES
	   ADD  CONSTRAINT [FK_PRO_RESPONSES_SURVEY_ADMINISTERED_BY_LU] FOREIGN KEY([SURVEY_ADMINISTERED_BY]) REFERENCES [dbo].[SURVEY_ADMINISTERED_BY_LU] ([ABBREVIATION])
    END;
			
	PRINT 'PRO_RESPONSES - Foreign Keys Added';

END;


/***********************
-- TUMOR Table
***********************/
IF OBJECT_ID('TUMOR') IS NULL
BEGIN
    PRINT 'TUMOR DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'TUMOR - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE TUMOR
    ADD CONSTRAINT FK_CHORDS_TUMOR_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('RACE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE TUMOR
	   ADD CONSTRAINT FK_CHORDS_TUMOR_RACE_LU FOREIGN KEY(RACE1) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_TUMOR_RACE_LU2 FOREIGN KEY(RACE2) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_TUMOR_RACE_LU3 FOREIGN KEY(RACE3) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_TUMOR_RACE_LU4 FOREIGN KEY(RACE4) REFERENCES RACE_LU(ABBREVIATION),
		  CONSTRAINT FK_CHORDS_TUMOR_RACE_LU5 FOREIGN KEY(RACE5) REFERENCES RACE_LU(ABBREVIATION);
    END;

	 PRINT 'TUMOR - Foreign Keys Added';
END;

/***********************
-- LANGUAGES Table
***********************/
IF OBJECT_ID('LANGUAGES') IS NULL
BEGIN
    PRINT 'LANGUAGES DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'LANGUAGES - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE LANGUAGES
    ADD CONSTRAINT FK_CHORDS_LANGUAGES_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('LANGUAGES_ISO_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LANGUAGES
	   ADD CONSTRAINT FK_CHORDS_LANGUAGES_LANGUAGES_ISO_LU FOREIGN KEY(LANG_ISO) REFERENCES LANGUAGES_ISO_LU([ISO_639-2_CODE]);
    END;
    IF OBJECT_ID('LANG_USAGE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LANGUAGES
	   ADD CONSTRAINT FK_CHORDS_LANGUAGES_LANG_USAGE_LU FOREIGN KEY(LANG_USAGE) REFERENCES LANG_USAGE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('YNU_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE LANGUAGES
	   ADD CONSTRAINT FK_CHORDS_LANGUAGES_YNU FOREIGN KEY(LANG_PRIMARY) REFERENCES YNU_LU(ABBREVIATION);
    END;
    
    PRINT 'LANGUAGES - Foreign Keys Added';
END;

/***********************
-- CENSUS_LOCATION Table
***********************/
IF OBJECT_ID('CENSUS_LOCATION') IS NULL
BEGIN
    PRINT 'CENSUS_LOCATION DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'CENSUS_LOCATION - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE CENSUS_LOCATION
	   ADD CONSTRAINT FK_CHORDS_CENSUS_LOCATION_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('ADDRESS_TYPE_CODE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE CENSUS_LOCATION
	   ADD CONSTRAINT FK_CHORDS_CENSUS_LOCATION_ADDRESS_TYPE_CODE_LU FOREIGN KEY(ADDRESS_TYPE_CODE) REFERENCES ADDRESS_TYPE_CODE_LU(ABBREVIATION);
    END;
		
    PRINT 'CENSUS_LOCATION - Foreign Keys Added';
END;

/***********************
-- LINKAGE Table || Added Summer 2018
***********************/
IF OBJECT_ID('LINKAGE') IS NULL
BEGIN
    PRINT 'LINKAGE DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'LINKAGE - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE LINKAGE
    ADD CONSTRAINT FK_CHORDS_LINKAGE_DEMOGRAPHICS_PERSON_ID FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID);

    ---Foreign keys to lookup tables

    PRINT 'CENSUS_LOCATION - Foreign Keys Added';
END;

/***********************
-- CAUSE_OF_DEATH Table
***********************/
IF OBJECT_ID('DEATH') IS NULL
BEGIN
    PRINT 'DEATH DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'DEATH - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE DEATH
    ADD CONSTRAINT FK_CHORDS_DEATH_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('CONFIDENCE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEATH
	   ADD CONSTRAINT FK_CHORDS_DEATH_CONFIDENCE_LU FOREIGN KEY(CONFIDENCE) REFERENCES CONFIDENCE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('DTIMPUTE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE DEATH
	   ADD CONSTRAINT FK_CHORDS_DEATH_DTIMPUTE_LU FOREIGN KEY(DTIMPUTE) REFERENCES DTIMPUTE_LU(ABBREVIATION);
    END;

    PRINT 'DEATH - Foreign Keys Added';
END;

/***********************
-- CAUSE_OF_DEATH Table
***********************/
IF OBJECT_ID('CAUSE_OF_DEATH') IS NULL
BEGIN
    PRINT 'CAUSE_OF_DEATH DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'CAUSE_OF_DEATH - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    ALTER TABLE CAUSE_OF_DEATH
	   ADD CONSTRAINT FK_CHORDS_CAUSE_OF_DEATH_DEMOGRAPHICS FOREIGN KEY(PERSON_ID) REFERENCES DEMOGRAPHICS(PERSON_ID);

    ---Foreign keys to lookup tables
    IF OBJECT_ID('CAUSETYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE CAUSE_OF_DEATH
	   ADD CONSTRAINT FK_CHORDS_CAUSE_OF_DEATH_CAUSE_OF_DEATH_LU FOREIGN KEY(CAUSETYPE) REFERENCES CAUSETYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('CONFIDENCE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE CAUSE_OF_DEATH
	   ADD CONSTRAINT FK_CHORDS_CAUSE_OF_DEATH_CONFIDENCE_LU FOREIGN KEY(CONFIDENCE) REFERENCES CONFIDENCE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('DX_CODETYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE CAUSE_OF_DEATH
	   ADD CONSTRAINT FK_CHORDS_CAUSE_OF_DEATH_DX_CODETYPE_LU FOREIGN KEY(DX_CODETYPE) REFERENCES DX_CODETYPE_LU(ABBREVIATION);
    END;

    PRINT 'CAUSE_OF_DEATH - Foreign Keys Added';
END;

/***********************
-- PROVIDER_SPECIALITY Table
***********************/
IF OBJECT_ID('PROVIDER_SPECIALTY') IS NULL
BEGIN
    PRINT 'PROVIDER_SPECIALTY DOES NOT EXIST';
END;
ELSE
BEGIN
    PRINT 'PROVIDER_SPECIALTY - Creating Foreign Keys';

    ---Foreign Keys to required/priority tables
    --NONE
    ---Foreign keys to lookup tables
    IF OBJECT_ID('PROVIDER_TYPE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_PROVIDER_TYPE_LU FOREIGN KEY(PROVIDER_TYPE) REFERENCES PROVIDER_TYPE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('RACE_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_RACE_LU FOREIGN KEY(PROVIDER_RACE) REFERENCES RACE_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('GENDER_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_GENDER_LU FOREIGN KEY(PROVIDER_GENDER) REFERENCES GENDER_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('YNU_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_YNU_LU FOREIGN KEY(PROVIDER_HISPANIC) REFERENCES YNU_LU(ABBREVIATION);
    END;
    IF OBJECT_ID('PROVIDER_SPECIALTY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_PROVIDER_SPECIALTY_LU FOREIGN KEY(SPECIALTY) REFERENCES PROVIDER_SPECIALTY_LU(SPECIALTY);
    END;
    IF OBJECT_ID('PROVIDER_SPECIALTY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_PROVIDER_SPECIALTY2_LU FOREIGN KEY(SPECIALTY2) REFERENCES PROVIDER_SPECIALTY_LU(SPECIALTY);
    END;
    IF OBJECT_ID('PROVIDER_SPECIALTY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_PROVIDER_SPECIALTY3_LU FOREIGN KEY(SPECIALTY3) REFERENCES PROVIDER_SPECIALTY_LU(SPECIALTY);
    END;
    IF OBJECT_ID('PROVIDER_SPECIALTY_LU') IS NOT NULL
    BEGIN
	   ALTER TABLE PROVIDER_SPECIALTY
	   ADD CONSTRAINT FK_CHORDS_PROVIDER_SPECIALTY_PROVIDER_SPECIALTY4_LU FOREIGN KEY(SPECIALTY4) REFERENCES PROVIDER_SPECIALTY_LU(SPECIALTY);
    END;

    PRINT 'PROVIDER_SPECIALTY - Foreign Keys Added';
END;