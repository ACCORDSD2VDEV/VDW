/********************
-- DIAGNOSES Index
********************/
IF OBJECT_ID('DIAGNOSES') IS NULL
BEGIN
	 PRINT 'DIAGNOSES TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    ---CHORDS_DIAGNOSES_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE name='CHORDS_DIAGNOSES_INDEX' AND object_id = OBJECT_ID('DIAGNOSES'))
    BEGIN
	   PRINT 'CHORDS_DIAGNOSES_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_DIAGNOSES_INDEX';
	   CREATE CLUSTERED INDEX CHORDS_DIAGNOSES_INDEX ON DIAGNOSES (PERSON_ID);
	   PRINT 'CHORDS_DIAGNOSES_INDEX - CREATED';
    END;
    ---CHORDS_DIAGNOSES_INDEX2
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE name='CHORDS_DIAGNOSES_INDEX2' AND object_id = OBJECT_ID('DIAGNOSES'))
    BEGIN
	   PRINT 'CHORDS_DIAGNOSES_INDEX2 ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_DIAGNOSES_INDEX2';
	   CREATE INDEX CHORDS_DIAGNOSES_INDEX2 ON DIAGNOSES (PERSON_ID, ENC_ID);
	   PRINT 'CHORDS_DIAGNOSES_INDEX2 - CREATED';
    END;
END;

/********************
-- LAB_RESULTS Index
********************/
IF OBJECT_ID('LAB_RESULTS') IS NULL
BEGIN
	 PRINT 'LAB_RESULTS TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_LAB_RESULTS_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_LAB_RESULTS_INDEX' AND object_id = OBJECT_ID('LAB_RESULTS'))
    BEGIN
	   PRINT 'CHORDS_LAB_RESULTS_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_LAB_RESULTS_INDEX';
	   CREATE CLUSTERED INDEX CHORDS_LAB_RESULTS_INDEX ON LAB_RESULTS(PERSON_ID)
	   PRINT 'CHORDS_LAB_RESULTS_INDEX - CREATED';
    END;
END;

/********************
-- PHARMACY Index
********************/
IF OBJECT_ID('PHARMACY') IS NULL
BEGIN
	 PRINT 'PHARMACY TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_PHARMACY_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PHARMACY_INDEX' AND object_id = OBJECT_ID('PHARMACY'))
    BEGIN
	   PRINT 'CHORDS_PHARMACY_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_PHARMACY_INDEX';
	   CREATE CLUSTERED INDEX CHORDS_PHARMACY_INDEX ON PHARMACY(PERSON_ID)
	   PRINT 'CHORDS_PHARMACY_INDEX - CREATED';
    END;
END;

/********************
-- PRESCRIBING Index
********************/
IF OBJECT_ID('PRESCRIBING') IS NULL
BEGIN
	 PRINT 'PRESCRIBING TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_PERSCRIBING_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PERSCRIBING_INDEX' AND OBJECT_ID = OBJECT_ID('PRESCRIBING'))
    BEGIN
	   PRINT 'CHORDS_PERSCRIBING_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_PHARMACY_INDEX EXIST';
	   CREATE CLUSTERED INDEX CHORDS_PERSCRIBING_INDEX ON PRESCRIBING (PERSON_ID);
	   PRINT 'CHORDS_PERSCRIBING_INDEX - CREATED';
    END;
    --CHORDS_PERSCRIBING_INDEX2
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PERSCRIBING_INDEX2' AND OBJECT_ID = OBJECT_ID('PRESCRIBING'))
    BEGIN
	   PRINT 'CHORDS_PERSCRIBING_INDEX2 ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_PHARMACY_INDEX2 EXIST';
	   CREATE INDEX CHORDS_PERSCRIBING_INDEX2 ON PRESCRIBING (PERSON_ID, ENC_ID);
	   PRINT 'CHORDS_PERSCRIBING_INDEX2 - CREATED';
    END;
END;

/********************
-- PROCEDURES Index
********************/
IF OBJECT_ID('PROCEDURES') IS NULL
BEGIN
	 PRINT 'PROCEDURES TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_PROCEDURES_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PROCEDURES_INDEX' AND OBJECT_ID = OBJECT_ID('PROCEDURES'))
    BEGIN
	   PRINT 'CHORDS_PROCEDURES_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_PROCEDURES_INDEX';
	   CREATE CLUSTERED INDEX CHORDS_PROCEDURES_INDEX ON [PROCEDURES](PERSON_ID);
	   PRINT 'CHORDS_PROCEDURES_INDEX - CREATED';
    END;
    --CHORDS_PROCEDURES_INDEX2
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PROCEDURES_INDEX2' AND OBJECT_ID = OBJECT_ID('PROCEDURES'))
    BEGIN
	   PRINT 'CHORDS_PROCEDURES_INDEX2 ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_PROCEDURES_INDEX2';
	   CREATE NONCLUSTERED INDEX CHORDS_PROCEDURES_INDEX2 ON [PROCEDURES](PERSON_ID, ENC_ID);
	   PRINT 'CHORDS_PROCEDURES_INDEX2 - CREATED';
    END;
END;

/********************
-- SOCIAL_HISTORY Index
********************/
IF OBJECT_ID('SOCIAL_HISTORY') IS NULL
BEGIN
	 PRINT 'SOCIAL_HISTORY TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_SOCIAL_HISTORY_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_SOCIAL_HISTORY_INDEX' AND OBJECT_ID = OBJECT_ID('SOCIAL_HISTORY'))
    BEGIN
	   PRINT 'CHORDS_SOCIAL_HISTORY_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_SOCIAL_HISTORY_INDEX';
	   CREATE CLUSTERED INDEX CHORDS_SOCIAL_HISTORY_INDEX ON SOCIAL_HISTORY (PERSON_ID);
	   PRINT 'CHORDS_SOCIAL_HISTORY_INDEX - CREATED';
    END;
    --CHORDS_SOCIAL_HISTORY_INDEX2
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_SOCIAL_HISTORY_INDEX2' AND OBJECT_ID = OBJECT_ID('SOCIAL_HISTORY'))
    BEGIN
	   PRINT 'CHORDS_SOCIAL_HISTORY_INDEX2 ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_SOCIAL_HISTORY_INDEX2';
	   CREATE INDEX CHORDS_SOCIAL_HISTORY_INDEX2 ON SOCIAL_HISTORY (PERSON_ID, ENC_ID);
	   PRINT 'CHORDS_SOCIAL_HISTORY_INDEX2 - CREATED';
    END;
END;

/********************
-- VITAL_SIGNS Index
********************/
IF OBJECT_ID('VITAL_SIGNS') IS NULL
BEGIN
	 PRINT 'VITAL_SIGNS TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_VITAL_SIGNS_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_VITAL_SIGNS_INDEX' AND OBJECT_ID = OBJECT_ID('VITAL_SIGNS'))
    BEGIN
	   PRINT 'CHORDS_VITAL_SIGNS_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_VITAL_SIGNS_INDEX';
	   CREATE CLUSTERED INDEX CHORDS_VITAL_SIGNS_INDEX ON VITAL_SIGNS (PERSON_ID);
	   PRINT 'CHORDS_VITAL_SIGNS_INDEX - CREATED';
    END;
    --CHORDS_VITAL_SIGNS_INDEX2
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_VITAL_SIGNS_INDEX2' AND OBJECT_ID = OBJECT_ID('VITAL_SIGNS'))
    BEGIN
	   PRINT 'CHORDS_VITAL_SIGNS_INDEX2 ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_VITAL_SIGNS_INDEX2';
	   CREATE INDEX CHORDS_VITAL_SIGNS_INDEX2 ON VITAL_SIGNS (PERSON_ID, ENC_ID);
	   PRINT 'CHORDS_VITAL_SIGNS_INDEX2 - CREATED';
    END;
END;

/********************
-- TUMOR Index
********************/
IF OBJECT_ID('TUMOR') IS NULL
BEGIN
	 PRINT 'TUMOR TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_TUMOR_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_TUMOR_INDEX' AND OBJECT_ID = OBJECT_ID('TUMOR'))
	   BEGIN
		  PRINT 'CHORDS_TUMOR_INDEX ALREADY EXISTS';
	   END;
    ELSE
    BEGIN
		PRINT 'CREATING CHORDS_TUMOR_INDEX';
		CREATE CLUSTERED INDEX CHORDS_TUMOR_INDEX ON TUMOR (PERSON_ID);
		PRINT 'CHORDS_TUMOR_INDEX - CREATED';
    END;
END;

/********************
-- LINKAGE Index
********************/
IF OBJECT_ID('LINKAGE') IS NULL
BEGIN
	 PRINT 'LINKAGE TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --CHORDS_LINKAGE_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_LINKAGE_INDEX' AND OBJECT_ID = OBJECT_ID('LINKAGE'))
    BEGIN
	   PRINT 'CHORDS_LINKAGE_INDEX ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_LINKAGE_INDEX';
	   CREATE INDEX CHORDS_LINKAGE_INDEX ON LINKAGE (PERSON_ID);
	   PRINT 'CHORDS_LINKAGE_INDEX - CREATED';
    END;
    --CHORDS_LINKAGE_INDEX2
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_LINKAGE_INDEX2' AND OBJECT_ID = OBJECT_ID('LINKAGE'))
    BEGIN
	   PRINT 'CHORDS_LINKAGE_INDEX2 ALREADY EXISTS';
    END;
    ELSE
    BEGIN
	   PRINT 'CREATING CHORDS_LINKAGE_INDEX2';
	   CREATE INDEX CHORDS_LINKAGE_INDEX2 ON LINKAGE (PERSON_ID, CID);
	   PRINT 'CHORDS_LINKAGE_INDEX2 - CREATED';
    END;
END;

/********************
-- BENEFIT Index
********************/
IF OBJECT_ID('BENEFIT') IS NULL
BEGIN
	 PRINT 'BENEFIT TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --BENEFIT_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_BENEFIT_INDEX' AND OBJECT_ID = OBJECT_ID('BENEFIT'))
	   BEGIN
		  PRINT 'CHORDS_BENEFIT_INDEX ALREADY EXISTS';
	   END;
    ELSE
    BEGIN
		PRINT 'CREATING CHORDS_BENEFIT_INDEX';
		CREATE INDEX CHORDS_BENEFIT_INDEX ON BENEFIT (PERSON_ID);
		PRINT 'CHORDS_BENEFIT_INDEX - CREATED';
    END;
END;

/********************
-- PRO_RESPONSES Index
********************/
IF OBJECT_ID('PRO_RESPONSES') IS NULL
BEGIN
	 PRINT 'PRO_RESPONSES TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --PRO_RESPONSES_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PRO_RESPONSES_INDEX' AND OBJECT_ID = OBJECT_ID('PRO_RESPONSES'))
	   BEGIN
		  PRINT 'CHORDS_PRO_RESPONSES_INDEX ALREADY EXISTS';
	   END;
    ELSE
    BEGIN
		PRINT 'CREATING CHORDS_PRO_RESPONSES_INDEX';
		CREATE INDEX CHORDS_PRO_RESPONSES_INDEX ON PRO_RESPONSES (PERSON_ID);
		PRINT 'CHORDS_PRO_RESPONSES_INDEX - CREATED';
    END;
	--PRO_RESPONSES_INDEX2
	IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_PRO_RESPONSES_INDEX2' AND OBJECT_ID = OBJECT_ID('PRO_RESPONSES'))
	   BEGIN
		  PRINT 'CHORDS_PRO_RESPONSES_INDEX2 ALREADY EXISTS';
	   END;
    ELSE
    BEGIN
		PRINT 'CREATING CHORDS_PRO_RESPONSES_INDEX2';
		CREATE INDEX CHORDS_PRO_RESPONSES_INDEX2 ON PRO_RESPONSES (PERSON_ID, ENC_ID);
		PRINT 'CHORDS_PRO_RESPONSES_INDEX2 - CREATED';
    END;
END;

/********************
-- SESSION Index
********************/
IF OBJECT_ID('SESSION') IS NULL
BEGIN
	 PRINT 'SESSION TABLE DOES NOT EXIST; SKIPPING INDEX CREATION';
END;
ELSE
BEGIN
    --SESSION_INDEX
    IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_SESSION_INDEX' AND OBJECT_ID = OBJECT_ID('SESSION'))
	   BEGIN
		  PRINT 'CHORDS_SESSION_INDEX ALREADY EXISTS';
	   END;
    ELSE
    BEGIN
		PRINT 'CREATING CHORDS_SESSION_INDEX';
		CREATE INDEX CHORDS_SESSION_INDEX ON SESSION (PERSON_ID);
		PRINT 'CHORDS_SESSION_INDEX - CREATED';
    END;
	--SESSION_INDEX2
	IF EXISTS (SELECT *  FROM sys.indexes  WHERE NAME = 'CHORDS_SESSION_INDEX2' AND OBJECT_ID = OBJECT_ID('SESSION'))
	   BEGIN
		  PRINT 'CHORDS_SESSION_INDEX2 ALREADY EXISTS';
	   END;
    ELSE
    BEGIN
		PRINT 'CREATING CHORDS_SESSION_INDEX2';
		CREATE INDEX CHORDS_SESSION_INDEX2 ON SESSION (PERSON_ID, ENC_ID);
		PRINT 'CHORDS_SESSION_INDEX2 - CREATED';
    END;
END;