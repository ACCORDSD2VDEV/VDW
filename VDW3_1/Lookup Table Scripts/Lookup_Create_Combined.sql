SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

--VDW_V3.1_TableDefs_ABN_IND_LU
IF OBJECT_ID('CHORDS_VDW31_ABN_IND_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ABN_IND_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ABN_IND_LU - Creating';
	SET QUOTED_IDENTIFIER ON;
	CREATE TABLE [CHORDS_VDW31_ABN_IND_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ABN_IND_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_ABN_IND_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'AB', N'abnormal' ), ( 
		   N'C', N'critical' ), ( 
		   N'AH', N'abnormal high' ), ( 
		   N'CH', N'critical high' ), ( 
		   N'AL', N'abnormal low' ), ( 
		   N'CL', N'critical low' ), ( 
		   N'IN', N'inconclusive' ), ( 
		   N'UK', N'unknown' ), ( 
		   N'NL', N'normal' );
	PRINT 'CHORDS_VDW31_ABN_IND_LU - Complete';
END;

--VDW_V3.1_TableDefs_ADMITTING_SOURCE_LU
IF OBJECT_ID('CHORDS_VDW31_ADMITTING_SOURCE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ADMITTING_SOURCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ADMITTING_SOURCE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_ADMITTING_SOURCE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ADMITTING_SOURCE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];

	INSERT INTO [CHORDS_VDW31_ADMITTING_SOURCE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'AV', N'Ambulatory Visit' ), ( 
		   N'ED', N'Emergency Department' ), ( 
		   N'AF', N'Adult Foster Home' ), ( 
		   N'AL', N'Assisted Living Facility' ), ( 
		   N'HH', N'Home Health' ), ( 
		   N'HS', N'Hospice' ), ( 
		   N'HO', N'Home / Self Care' ), ( 
		   N'IP', N'Other Acute Inpatient Hospital' ), ( 
		   N'NH', N'Nursing Home (Includes ICF)' ), ( 
		   N'OT', N'Other' ), ( 
		   N'RS', N'Residential Facility' ), ( 
		   N'RH', N'Rehabilitation Facility' ), ( 
		   N'SN', N'Skilled Nursing Facility' ), ( 
		   N'UN', N'Unknown' );
	PRINT 'CHORDS_VDW31_ADMITTING_SOURCE_LU - Complete';
END;

--VDW_V3.1_TableDefs_BP_TYPE_LU
IF OBJECT_ID('CHORDS_VDW31_BP_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_BP_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_BP_TYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_BP_TYPE_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_BP_TYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_BP_TYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'R', N'Rooming' ), ( 
		   N'O', N'Orthostatic' ), ( 
		   N'M', N'Multiple' ), ( 
		   N'E', N'Extended' );
END;

--VDW_V3.1_TableDefs_CAUSETYPE_LU
IF OBJECT_ID('CHORDS_VDW31_CAUSETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_CAUSETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_CAUSETYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_CAUSETYPE_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_CAUSETYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_CAUSETYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'I', N'Immediate/Primary' ), ( 
		   N'U', N'Underlying' ), ( 
		   N'C', N'Contributory' ), ( 
		   N'O', N'Other' );
	PRINT 'CHORDS_VDW31_CAUSETYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_CODETYPE_LU
IF OBJECT_ID('CHORDS_VDW31_CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_CODETYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_CODETYPE_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_CODETYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_CODETYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'C', N'CPT' ), ( 
		   N'I', N'ICD9' ), ( 
		   N'H', N'HCPCS' ), ( 
		   N'L', N'local home-grown' ), ( 
		   N'O', N'other' );
	PRINT 'CHORDS_VDW31_CODETYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_CONFIDENCE_LU
IF OBJECT_ID('CHORDS_VDW31_CONFIDENCE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_CONFIDENCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_CONFIDENCE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_CONFIDENCE_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_CONFIDENCE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_CONFIDENCE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'E', N'Excellent' ), ( 
		   N'F', N'Fair' ), ( 
		   N'P', N'Poor' );
	PRINT 'CHORDS_VDW31_CONFIDENCE_LU - Complete';
END;

--VDW_V3.1_TableDefs_DEPARTMENT_LU
IF OBJECT_ID('CHORDS_VDW31_DEPARTMENT_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_DEPARTMENT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_DEPARTMENT_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_DEPARTMENT_LU]
	( 
				 [ABBREVIATION] nvarchar(4) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_DEPARTMENT_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_DEPARTMENT_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'ACUP', N'Acupuncture' ), ( 
		   N'ALGY', N'Allergy' ), ( 
		   N'AMBU', N'Ambulance Services' ), ( 
		   N'ANES', N'Anesthesiology' ), ( 
		   N'AUD', N'Audiology' ), ( 
		   N'CARD', N'Cardiology' ), ( 
		   N'CASR', N'Cast Room' ), ( 
		   N'CHEM', N'Chemical and Alcohol Dependency' ), ( 
		   N'CHIR', N'Chiropractic' ), ( 
		   N'CMHL', N'Community Health' ), ( 
		   N'CRIT', N'Critical Care Medicine' ), ( 
		   N'CRMG', N'Care Management' ), ( 
		   N'DENT', N'Dental' ), ( 
		   N'DERM', N'Dermatology' ), ( 
		   N'DIAL', N'Dialysis' ), ( 
		   N'DME', N'Durable Medical Equipment' ), ( 
		   N'EDUC', N'Education' ), ( 
		   N'ENDO', N'Endocrinology' ), ( 
		   N'ENT', N'Otolaryngology' ), ( 
		   N'ER', N'Emergency Room' ), ( 
		   N'FP', N'Family Practice' ), ( 
		   N'GEN', N'Genetics' ), ( 
		   N'GER', N'Gerontology/Geriatrics' ), ( 
		   N'GI', N'Gastro-Intestinal Medicine' ), ( 
		   N'HAP', N'Health Appraisals' ), ( 
		   N'HEP', N'Hepatology' ), ( 
		   N'HH', N'Home Health' ), ( 
		   N'HOSP', N'Hospital Care' ), ( 
		   N'HSPC', N'Hospice' ), ( 
		   N'ICF', N'Intermediate Care Facility' ), ( 
		   N'IM', N'Internal Medicine' ), ( 
		   N'IMUN', N'Immunology' ), ( 
		   N'IND', N'Industrial Medicine' ), ( 
		   N'INF', N'Infectious Disease' ), ( 
		   N'INFU', N'Infusion Center' ), ( 
		   N'IR', N'Injection Room' ), ( 
		   N'LAB', N'Laboratory' ), ( 
		   N'MH', N'Mental Health' ), ( 
		   N'NATU', N'Naturopathy' ), ( 
		   N'NEPH', N'Nephrology' ), ( 
		   N'NEUR', N'Neurology' ), ( 
		   N'NEWB', N'Newborn' ), ( 
		   N'NRSG', N'Neurosurgery' ), ( 
		   N'NUCL', N'Nuclear Medicine' ), ( 
		   N'NUT', N'Nutrition' ), ( 
		   N'OBGN', N'Obstetrics/Gynecology' ), ( 
		   N'OCTH', N'Occupational Therapy' ), ( 
		   N'ONC', N'Oncology' ), ( 
		   N'OPTH', N'Ophthalmology' ), ( 
		   N'OPTO', N'Optometry' ), ( 
		   N'ORTH', N'Orthopedics' ), ( 
		   N'OST', N'Osteopathy' ), ( 
		   N'PAL', N'Palliative Care' ), ( 
		   N'PATH', N'Pathology' ), ( 
		   N'PC', N'Primary Care' ), ( 
		   N'PEDS', N'Pediatrics' ), ( 
		   N'PERI', N'Perinatology' ), ( 
		   N'PHYS', N'Physiatry' ), ( 
		   N'POD', N'Podiatry' ), ( 
		   N'PSRG', N'Plastic Surgery' ), ( 
		   N'PT', N'Physical Therapy' ), ( 
		   N'PULM', N'Pulmonary Medicine' ), ( 
		   N'RAD', N'Radiology' ), ( 
		   N'RADT', N'Radiation Therapy' ), ( 
		   N'RECT', N'Recreational Therapy' ), ( 
		   N'REHB', N'Rehabilitation' ), ( 
		   N'RESP', N'Respiratory Therapy' ), ( 
		   N'RHEU', N'Rheumatology' ), ( 
		   N'RN', N'Registered Nurse' ), ( 
		   N'SNF', N'Skilled Nursing Facility' ), ( 
		   N'SPOR', N'Sports Medicine' ), ( 
		   N'SPTH', N'Speech Therapy' ), ( 
		   N'SURG', N'General Surgery' ), ( 
		   N'TRAN', N'Transplant' ), ( 
		   N'URG', N'Urgent Care' ), ( 
		   N'URO', N'Urology' ), ( 
		   N'OTH', N'Other' ), ( 
		   N'UNK', N'Unknown' );
	PRINT 'CHORDS_VDW31_DEPARTMENT_LU - Complete';
END;

--VDW_V3.1_TableDefs_DISCHARGE_DISPOSITION_LU
IF OBJECT_ID('CHORDS_VDW31_DISCHARGE_DISPOSITION_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_DISCHARGE_DISPOSITION_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_DISCHARGE_DISPOSITION_LU - Creating';
	CREATE TABLE CHORDS_VDW31_DISCHARGE_DISPOSITION_LU
	( 
				 ABBREVIATION nchar NOT NULL,
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT PK_CHORDS_VDW31_DISCHARGE_DISPOSITION_LU PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO CHORDS_VDW31_DISCHARGE_DISPOSITION_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   N'A', N'Alive' ), ( 
		   N'E', N'Expired' ), ( 
		   N'U', N'Unknown' );
	PRINT 'CHORDS_VDW31_DISCHARGE_DISPOSITION_LU - Complete';
END;

--VDW_V3.1_TableDefs_DISCHARGE_STATUS_LU
IF OBJECT_ID('CHORDS_VDW31_DISCHARGE_STATUS_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_DISCHARGE_STATUS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_DISCHARGE_STATUS_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_DISCHARGE_STATUS_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_DISCHARGE_STATUS_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_DISCHARGE_STATUS_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'AF', N'Adult Foster Home' ), ( 
		   N'AL', N'Assisted Living Facility' ), ( 
		   N'AM', N'Against Medical Advice' ), ( 
		   N'AW', N'Absent without leave' ), ( 
		   N'EX', N'Expired' ), ( 
		   N'HH', N'Home Health' ), ( 
		   N'HS', N'Hospice' ), ( 
		   N'HO', N'Home / Self Care' ), ( 
		   N'IP', N'Other Acute Inpatient Hospital' ), ( 
		   N'NH', N'Nursing Home (Includes ICF)' ), ( 
		   N'OT', N'Other' ), ( 
		   N'RS', N'Residential Facility' ), ( 
		   N'RH', N'Rehabilitation Facility' ), ( 
		   N'SH', N'Still In Hospital' ), ( 
		   N'SN', N'Skilled Nursing Facility' ), ( 
		   N'UN', N'Unknown' );
	PRINT 'CHORDS_VDW31_DISCHARGE_STATUS_LU - Complete';
END;

--VDW_V3.1_TableDefs_DTIMPUTE_LU.sql
IF OBJECT_ID('CHORDS_VDW31_DTIMPUTE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_DTIMPUTE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_DTIMPUTE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_DTIMPUTE_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_DTIMPUTE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_DTIMPUTE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'M', N'Month of date imputed' ), ( 
		   N'D', N'Day of date imputed' ), ( 
		   N'B', N'Both month and day imputed' ), ( 
		   N'N', N'Not imputed' );
	PRINT 'CHORDS_VDW31_DTIMPUTE_LU - Complete';
END;

--VDW_V3.1_TableDefs_DX_CODETYPE_LU.sql
IF OBJECT_ID('CHORDS_VDW31_DX_CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_DX_CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_DX_CODETYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_DX_CODETYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_DX_CODETYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_DX_CODETYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'07', N'''ICD-7-CM'' (including ''ICD-7'')' ), ( 
		   N'08', N'''ICD-8-CM'' (including ''ICD-8'')' ), ( 
		   N'09', N'''ICD-9-CM'' (including ''ICD-9'')' ), ( 
		   N'10', N'''ICD-10-CM'' (including ''ICD-10'')' ), ( 
		   N'11', N'''ICD-11-CM'' (including ''ICD-11'')' ), ( 
		   N'OT', N'Other' ), ( 
		   N'UN', N'Unknown' );
	PRINT 'CHORDS_VDW31_DX_CODETYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_ENCOUNTER_SUBTYPE_LU.sql
IF OBJECT_ID('CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'AI', N'Acute Inpatient Stay. Excludes observation bed.' ), ( 
		   N'HA', N'Hospital Ambulatory. Outpatient care at a hospital excluding same day surgery and observation beds.' ), ( 
		   N'OC', N'Outpatient Clinic Visit' ), ( 
		   N'OB', N'Observation Bed' ), ( 
		   N'SD', N'Same Day Surgery' ), ( 
		   N'UC', N'Urgent Care' ), ( 
		   N'DI', N'Dialysis' ), ( 
		   N'OT', N'Other non-hospital' ), ( 
		   N'HH', N'Home Health' ), ( 
		   N'HS', N'Hospice' ), ( 
		   N'SN', N'Skilled Nursing Facility' ), ( 
		   N'NH', N'Nursing Home (includes ICF)' ), ( 
		   N'RH', N'Rehab' );
	PRINT 'CHORDS_VDW31_ENCOUNTER_SUBTYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_ENCTYPE_LU
IF OBJECT_ID('CHORDS_VDW31_ENCTYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ENCTYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ENCTYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_ENCTYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(50) NOT NULL, 
				 [DESCRIPTION] nvarchar(500) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ENCTYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_ENCTYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'IP', N'Acute Inpatient Hospital Stay: Inpatient stays, same-day hospital discharges, hospital transfers where the patient was admitted into the hospital. Includes acute inpatient psych and detox hospital stays. [ENCOUNTER_SUBTYPE = AI]' ), ( 
		   N'ED', N'Emergency Department Encounter: Excludes urgent care visits. [ENCOUNTER_SUBTYPE = HA,OC]' ), ( 
		   N'AV', N'Ambulatory Visit: Outpatient clinics, same day surgeries, observation beds, urgent care visits, and other same-day ambulatory hospital encounters. Excludes emergency department encounters). [ENCOUNTER_SUBTYPE = OC, OB, SD, HA, UC, RH, DI, OT]' ), ( 
		   N'TE', N'Telephone Encounters: [ENCOUNTER_SUBTYPE = OT, HH]' ), ( 
		   N'EM', N'E-mail Encounters: [ENCOUNTER_SUBTYPE = OT, HH]' ), ( 
		   N'IS', N'Non-Acute Institutional Stays: Hospice, SNF, rehab, nursing home, residential, overnight non-hospital dialysis and other non-hospital stays. [ENCOUNTER_SUBTYPE = HS, SN, NH, RH,DI, OT]' ), ( 
		   N'OE', N'OE=Other Encounters (not overnight): Hospice visits, home health visits, SNF visits, other non-hospital visits. [ENCOUNTER_SUBTYPE = HS, HH, SN, RH, DI, OT]' ), ( 
		   N'LO', N'Lab Only Encounter: Optional. Lab encounters that cannot be matched to another encounter. Include to link variables from ENCOUNTER table to the PROCEDURES table. [ENCOUNTER_SUBTYPE = OC,OT]' ), ( 
		   N'RO', N'Radiology Only Encounter: Optional. Radiology encounter that cannot be matched to another encounter. Include to link variables from utilization file to procedure file. [ENCOUNTER_SUBTYPE = OC,OT]' );
	PRINT 'CHORDS_VDW31_ENCTYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_ENROLLMENT_BASIS_LU
IF OBJECT_ID('CHORDS_VDW31_ENROLLMENT_BASIS_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ENROLLMENT_BASIS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ENROLLMENT_BASIS_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_ENROLLMENT_BASIS_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ENROLLMENT_BASIS_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_ENROLLMENT_BASIS_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'G', N'Geographic Basis' ), ( 
		   N'I', N'Insurance Basis' ), ( 
		   N'B', N'Both Insurance and Geographic bases' ), ( 
		   N'P', N'Non-enrollee Patient' );
	PRINT 'CHORDS_VDW31_ENROLLMENT_BASIS_LU - Complete';
END;

--VDW_V3.1_TableDefs_GENDER_LU
IF OBJECT_ID('CHORDS_VDW31_GENDER_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_GENDER_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_GENDER_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_GENDER_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(25) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_GENDER_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_GENDER_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'F', N'Female' ), ( 
		   N'M', N'Male' ), ( 
		   N'U', N'Unknown' ), ( 
		   N'O', N'Other' );
	PRINT 'CHORDS_VDW31_GENDER_LU - Complete';
END;

--VDW_V3.1_TableDefs_LANG_USAGE_LU
IF OBJECT_ID('CHORDS_VDW31_LANG_USAGE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_LANG_USAGE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_LANG_USAGE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_LANG_USAGE_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_LANG_USAGE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_LANG_USAGE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'S', N'Spoken (or signed)' ), ( 
		   N'W', N'Written' ), ( 
		   N'B', N'Both spoken and written' ), ( 
		   N'U', N'Unknown' );
	PRINT 'CHORDS_VDW31_LANG_USAGE_LU - Complete';
END;

--VDW_V3.1_TableDefs_MODIFIER_LU
IF OBJECT_ID('CHORDS_VDW31_MODIFIER_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_MODIFIER_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_MODIFIER_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_MODIFIER_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_MODIFIER_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_MODIFIER_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'TX', N'text' ), ( 
		   N'EQ', N'equal' ), ( 
		   N'LT', N'less than' ), ( 
		   N'LE', N'less than or equal to' ), ( 
		   N'GT', N'greater than' ), ( 
		   N'GE', N'greater than or equal to' );
	PRINT 'CHORDS_VDW31_MODIFIER_LU - Complete';
END;

--VDW_V3.1_TableDefs_ONC_SMOKING_STATUS_LU
IF OBJECT_ID('CHORDS_VDW31_ONC_SMOKING_STATUS_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ONC_SMOKING_STATUS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ONC_SMOKING_STATUS_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_ONC_SMOKING_STATUS_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ONC_SMOKING_STATUS_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_ONC_SMOKING_STATUS_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'1', N'current every day smoker' ), ( 
		   N'2', N'current some day smoker' ), ( 
		   N'3', N'former smoker' ), ( 
		   N'4', N'never smoker' ), ( 
		   N'5', N'smoker, current status unknown' ), ( 
		   N'6', N'unknown if ever smoked' );
	PRINT 'CHORDS_VDW31_ONC_SMOKING_STATUS_LU - Complete';
END;

--VDW_V3.1_TableDefs_POSITION_LU.sql
IF OBJECT_ID('CHORDS_VDW31_POSITION_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_POSITION_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_POSITION_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_POSITION_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_POSITION_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_POSITION_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'1', N'Sitting' ), ( 
		   N'2', N'Standing' ), ( 
		   N'3', N'Supine' );
	PRINT 'CHORDS_VDW31_POSITION_LU - Complete';
END;

--VDW_V3.1_TableDefs_PRIMARY_DX_LU
IF OBJECT_ID('CHORDS_VDW31_PRIMARY_DX_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_PRIMARY_DX_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_PRIMARY_DX_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_PRIMARY_DX_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_PRIMARY_DX_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_PRIMARY_DX_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'P', N'Primary Dx' ), ( 
		   N'S', N'Not Primary Dx' ), ( 
		   N'X', N'Primary Dx Status not classifiable' );
	PRINT 'CHORDS_VDW31_PRIMARY_DX_LU - Complete';
END;

--VDW_V3.1_TableDefs_PRINCIPAL_DX_LU
IF OBJECT_ID('CHORDS_VDW31_PRINCIPAL_DX_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_PRINCIPAL_DX_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_PRINCIPAL_DX_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_PRINCIPAL_DX_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_PRINCIPAL_DX_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_PRINCIPAL_DX_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'P', N'Principal Dx' ), ( 
		   N'N', N'Not Principal Dx' ), ( 
		   N'X', N'Principal Dx Status not classifiable' );
	PRINT 'CHORDS_VDW31_PRINCIPAL_DX_LU - Complete';
END;

--VDW_V3.1_TableDefs_PROVIDER_TYPE_LU
IF OBJECT_ID('CHORDS_VDW31_PROVIDER_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_PROVIDER_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_PROVIDER_TYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_PROVIDER_TYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(3) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_PROVIDER_TYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_PROVIDER_TYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'001', N'ACUPUNCTURIST' ), ( 
		   N'002', N'ANESTHESIOLGY ASST' ), ( 
		   N'003', N'AUDIOLOGIST' ), ( 
		   N'004', N'AUDIOLOGY ASSISTANT' ), ( 
		   N'005', N'CARDIAC REHAB THERAPIST' ), ( 
		   N'006', N'CASE MANAGER' ), ( 
		   N'007', N'CERTIFIED NURSE SPECIALIST' ), ( 
		   N'008', N'CERTIFIED REG NURSE ANESTHETIST' ), ( 
		   N'009', N'CHAPLAIN' ), ( 
		   N'010', N'CHEM DEP COUNSELOR, ADULT' ), ( 
		   N'011', N'CHEM DEP COUNSELOR, CHILD/ADOL' ), ( 
		   N'012', N'CHIROPRACTOR' ), ( 
		   N'013', N'CIGNA' ), ( 
		   N'014', N'CLINICAL NURSE SPECIALIST' ), ( 
		   N'015', N'COUMADIN NURSE' ), ( 
		   N'016', N'CPAP SPECIALIST' ), ( 
		   N'017', N'DENTAL ASSISTANT' ), ( 
		   N'018', N'DENTIST' ), ( 
		   N'019', N'DIABETIC NURSE' ), ( 
		   N'020', N'DIETETIC TECH' ), ( 
		   N'021', N'DIETITIAN' ), ( 
		   N'022', N'EEG TECHNICIAN' ), ( 
		   N'023', N'ER TECH' ), ( 
		   N'024', N'EXERCISE PHYSIOLOGIST' ), ( 
		   N'025', N'FELLOW' ), ( 
		   N'026', N'HEALING TOUCH' ), ( 
		   N'027', N'HEALTH EDUCATOR' ), ( 
		   N'028', N'HOME HEALTH AIDE' ), ( 
		   N'029', N'HP PHYSICIAN' ), ( 
		   N'030', N'HYGIENIST' ), ( 
		   N'031', N'INDEPENDENT LAB/X-RAY' ), ( 
		   N'032', N'INF CNTRL PRACT' ), ( 
		   N'033', N'INFUSION THERAPIST' ), ( 
		   N'034', N'INTERPRETER' ), ( 
		   N'035', N'LAB ASSISTANT' ), ( 
		   N'036', N'LAB TECHNICIAN' ), ( 
		   N'037', N'LACTATION CONSULTANT' ), ( 
		   N'038', N'LIC FAM THERAPIST' ), ( 
		   N'039', N'LIC SOCIAL WORKER' ), ( 
		   N'040', N'MASSAGE THERAPIST' ), ( 
		   N'041', N'MEDICAL ASSISTANT' ), ( 
		   N'042', N'MIDLEVEL' ), ( 
		   N'043', N'MIDWIFE' ), ( 
		   N'044', N'MUSIC THERAPIST' ), ( 
		   N'045', N'NOT APPLICABLE' ), ( 
		   N'046', N'NURSE' ), ( 
		   N'047', N'NURSE CLINICIAN' ), ( 
		   N'048', N'NURSE PRACTITIONER' ), ( 
		   N'049', N'OCCUPATIONAL THERAPIST' ), ( 
		   N'050', N'OPHTHALMIC ASSISTANT' ), ( 
		   N'051', N'OPHTHALMIC TECHNICIAN' ), ( 
		   N'052', N'OPTICIAN' ), ( 
		   N'053', N'OPTOMETRIST' ), ( 
		   N'054', N'ORTHO PHY ASST' ), ( 
		   N'055', N'ORTHOPAEDIC' ), ( 
		   N'056', N'OSTEOPATH' ), ( 
		   N'057', N'PERSONAL CARE ATTENDANT' ), ( 
		   N'058', N'PHARM TECH' ), ( 
		   N'059', N'PHARMACIST' ), ( 
		   N'060', N'PHYSICAL THERAPIST' ), ( 
		   N'061', N'PHYSICIAN' ), ( 
		   N'062', N'PHYSICIAN ASSISTANT' ), ( 
		   N'063', N'PODIATRIST' ), ( 
		   N'064', N'PSYCH TECHNICIAN' ), ( 
		   N'065', N'PSYCHOLOGIST' ), ( 
		   N'066', N'PSYCHOTHERAPIST' ), ( 
		   N'067', N'PSYCHOTHERAPIST, ADULT' ), ( 
		   N'068', N'PSYCHOTHERAPIST, CHILD/ADOL' ), ( 
		   N'069', N'PT ASSISTANT' ), ( 
		   N'070', N'RADIATION THERAPIST' ), ( 
		   N'071', N'RADIOLOGY TECHNICIAN' ), ( 
		   N'072', N'RECREATIONAL THERAPIST' ), ( 
		   N'073', N'REGISTERED NURSE' ), ( 
		   N'074', N'REHAB ASSISTANT' ), ( 
		   N'075', N'REHAB THERAPIST' ), ( 
		   N'076', N'REIKI' ), ( 
		   N'077', N'RESIDENT' ), ( 
		   N'078', N'RESOURCE' ), ( 
		   N'079', N'RESPIRATORY THERAPIST' ), ( 
		   N'080', N'SOCIAL WORKER' ), ( 
		   N'081', N'SPEECH PATHOLOGIST CERTIFIED' ), ( 
		   N'082', N'STUDENT' ), ( 
		   N'083', N'SURG TECH' ), ( 
		   N'084', N'SURGEON ASSISTANT' ), ( 
		   N'085', N'THERAPEUTIC AQUATIC SPECIALIST' ), ( 
		   N'086', N'ULTRASOUND TECHNICIAN' ), ( 
		   N'888', N'OTHER' ), ( 
		   N'999', N'UNKNOWN' );
	PRINT 'CHORDS_VDW31_PROVIDER_TYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_PT_LOC_LU
IF OBJECT_ID('CHORDS_VDW31_PT_LOC_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_PT_LOC_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_PT_LOC_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_PT_LOC_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_PT_LOC_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_PT_LOC_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'I', N'Inpatient' ), ( 
		   N'O', N'Outpatient' ), ( 
		   N'E', N'Emergency Department' ), ( 
		   N'H', N'Home' ), ( 
		   N'U', N'Unknown or missing' );
	PRINT 'CHORDS_VDW31_PT_LOC_LU - Complete';
END;

--VDW_V3.1_TableDefs_PX_CODETYPE_LU
IF OBJECT_ID('CHORDS_VDW31_PX_CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_PX_CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_PX_CODETYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_PX_CODETYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_PX_CODETYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_PX_CODETYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'09', N'ICD-9-CM' ), ( 
		   N'10', N'ICD-10-CM' ), ( 
		   N'11', N'ICD-11-CM' ), ( 
		   N'C4', N'CPT-4' ), ( 
		   N'H4', N'HCPCS-4' ), ( 
		   N'RV', N'Revenue code' ), ( 
		   N'LO', N'Local homegrown' ), ( 
		   N'OT', N'Other' );
	PRINT 'CHORDS_VDW31_PX_CODETYPE_LU - Complete';
END;

--VDW_V3.1_TableDefs_RACE_LU
IF OBJECT_ID('CHORDS_VDW31_RACE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RACE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RACE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RACE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(75) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RACE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RACE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'HP', N'Native Hawaiian or Other Pacific Islander' ), ( 
		   N'IN', N'American Indian/Alaska Native' ), ( 
		   N'AS', N'Asian' ), ( 
		   N'BA', N'Black or African American' ), ( 
		   N'WH', N'White' ), ( 
		   N'MU', N'More than one race, particular races unknown or not reported' ), ( 
		   N'UN', N'Unknown or Not Reported' );
	PRINT 'CHORDS_VDW31_RACE_LU - Complete';
END;

--VDW_V3.1_TableDefs_RESULT_LOC_LU
IF OBJECT_ID('CHORDS_VDW31_RESULT_LOC_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RESULT_LOC_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RESULT_LOC_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RESULT_LOC_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RESULT_LOC_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RESULT_LOC_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'L', N'Lab' ), ( 
		   N'P', N'Point of Care' );
	PRINT 'CHORDS_VDW31_RESULT_LOC_LU - Complete';
END;

--VDW_V3.1_TableDefs_RX_BASIS_LU
IF OBJECT_ID('CHORDS_VDW31_RX_BASIS_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RX_BASIS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RX_BASIS_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RX_BASIS_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RX_BASIS_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RX_BASIS_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'01', N'Order to Dispense' ), ( 
		   N'02', N'Order to Administer' ), ( 
		   N'NI', N'No information' ), ( 
		   N'UN', N'Unknown' ), ( 
		   N'OT', N'Other' );
	PRINT 'CHORDS_VDW31_RX_BASIS_LU - Complete';
END;

--VDW_V3.1_TableDefs_RX_FREQUENCY_LU
IF OBJECT_ID('CHORDS_VDW31_RX_FREQUENCY_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RX_FREQUENCY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RX_FREQUENCY_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RX_FREQUENCY_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RX_FREQUENCY_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RX_FREQUENCY_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'01', N'Every day' ), ( 
		   N'02', N'Two times a day (BID)' ), ( 
		   N'03', N'Three times a day (TID)' ), ( 
		   N'04', N'Four times a day (QID)' ), ( 
		   N'05', N'Every morning' ), ( 
		   N'06', N'Every afternoon' ), ( 
		   N'07', N'Before meals' ), ( 
		   N'08', N'After meals' ), ( 
		   N'09', N'As needed (PRN)' ), ( 
		   N'NI', N'No information' ), ( 
		   N'UN', N'Unknown' ), ( 
		   N'OT', N'Other' );
	PRINT 'CHORDS_VDW31_RX_FREQUENCY_LU - Complete';
END;

--VDW_V3.1_TableDefs_RX_QUANTITY_UNIT_LU
IF OBJECT_ID('CHORDS_VDW31_RX_QUANTITY_UNIT_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RX_QUANTITY_UNIT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RX_QUANTITY_UNIT_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RX_QUANTITY_UNIT_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RX_QUANTITY_UNIT_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RX_QUANTITY_UNIT_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'PI', N'Pill' ), ( 
		   N'TA', N'Tablet' ), ( 
		   N'VI', N'Vial' ), ( 
		   N'LI', N'Liquid' ), ( 
		   N'SO', N'Solution' ), ( 
		   N'SU', N'Suspension' ), ( 
		   N'OI', N'Ointment' ), ( 
		   N'CR', N'Cream' ), ( 
		   N'PO', N'Powder' ), ( 
		   N'PA', N'Patch' ), ( 
		   N'IN', N'Inhaler' ), ( 
		   N'KI', N'Kit' ), ( 
		   N'DE', N'Device' ), ( 
		   N'NI', N'No information' ), ( 
		   N'UN', N'Unknown' ), ( 
		   N'OT', N'Other' );
	PRINT 'CHORDS_VDW31_RX_QUANTITY_UNIT_LU - Complete';
END;

--VDW_V3.1_TableDefs_SEXUALLY_ACTV_LU
IF OBJECT_ID('CHORDS_VDW31_SEXUALLY_ACTV_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_SEXUALLY_ACTV_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_SEXUALLY_ACTV_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_SEXUALLY_ACTV_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_SEXUALLY_ACTV_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_SEXUALLY_ACTV_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'Y', N'Yes' ), ( 
		   N'N', N'No' ), ( 
		   N'U', N'Unknown, missing' ), ( 
		   N'X', N'Not asked' ), ( 
		   N'W', N'Not Currently (Was)' );
	PRINT 'CHORDS_VDW31_SEXUALLY_ACTV_LU - Complete';
END;

--VDW_V3.1_TableDefs_SPECIMEN_SOURCE_LU
IF OBJECT_ID('CHORDS_VDW31_SPECIMEN_SOURCE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_SPECIMEN_SOURCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_SPECIMEN_SOURCE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_SPECIMEN_SOURCE_LU]
	( 
				 [ABBREVIATION] nvarchar(25) NOT NULL, 
				 [DESCRIPTION] nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_SPECIMEN_SOURCE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_SPECIMEN_SOURCE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'BLOOD', N'BLOOD' ), ( 
		   N'SERUM', N'SERUM' ), ( 
		   N'PLASMA', N'PLASMA' ), ( 
		   N'SR_PLS', N'serum/plasma' ), ( 
		   N'PPP', N'Platelet Poor Plasma' ), ( 
		   N'CSF', N'cerebral spinal fluid' ), ( 
		   N'URINE', N'URINE' ), ( 
		   N'STOOL', N'STOOL' ), ( 
		   N'NSWAB', N'nasal swab. Any specimen source in your data listed as "nose" should be mapped to "nasal swab"' ), ( 
		   N'NWASH', N'nasal wash' ), ( 
		   N'NPH', N'nasopharyngeal swab' ), ( 
		   N'NPWASH', N'nasopharyngeal wash' ), ( 
		   N'THRT', N'throat, oropharyngeal swab' ), ( 
		   N'SPUTUM', N'SPUTUM' ), ( 
		   N'BAL', N'bronchoalveolar lavage (BAL) specimen' ), ( 
		   N'BALBX', N'BAL biopsy' ), ( 
		   N'OTHER', N'OTHER' ), ( 
		   N' ', N'missing value' ), ( 
		   N'NS', N'not specified' );
	PRINT 'CHORDS_VDW31_SPECIMEN_SOURCE_LU - Complete';
END;

--VDW_V3.1_TableDefs_STAT_LU
IF OBJECT_ID('CHORDS_VDW31_STAT_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_STAT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_STAT_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_STAT_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_STAT_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_STAT_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'E', N'Expedite' ), ( 
		   N'S', N'Stat' ), ( 
		   N'R', N'Routine' ), ( 
		   N'U', N'Unknown or missing' );
	PRINT 'CHORDS_VDW31_STAT_LU - Complete';
END;

--VDW_V3.1_TableDefs_TOBACCO_USER_LU
IF OBJECT_ID('CHORDS_VDW31_TOBACCO_USER_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_TOBACCO_USER_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_TOBACCO_USER_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_TOBACCO_USER_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(75) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_TOBACCO_USER_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_TOBACCO_USER_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'Y', N'Yes / Current (everyday tobacco use)' ), ( 
		   N'N', N'Never (never smoked or used any kind of tobacco and not SHS exposes)' ), ( 
		   N'U', N'Unknown, missing' ), ( 
		   N'X', N'Not asked' ), ( 
		   N'Q', N'Quit / Former' ), ( 
		   N'P', N'Passive /Environmental / Second-hand (never smoked)' ), ( 
		   N'I', N'Infrequent (current someday smoking or tobacco use)' );
	PRINT 'CHORDS_VDW31_TOBACCO_USER_LU - Complete';
END;

--VDW_V3.1_TableDefs_YNQXU_LU.sql
IF OBJECT_ID('CHORDS_VDW31_YNQXU_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_YNQXU_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_YNQXU_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_YNQXU_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_YNQXU_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_YNQXU_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'Y', N'Yes' ), ( 
		   N'N', N'No' ), ( 
		   N'U', N'Unknown, missing' ), ( 
		   N'X', N'Not asked' ), ( 
		   N'Q', N'Quit / Former' );
	PRINT 'CHORDS_VDW31_YNQXU_LU - Complete';
END;

--VDW_V3.1_TableDefs_YNU_LU
IF OBJECT_ID('CHORDS_VDW31_YNU_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_YNU_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_YNU_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_YNU_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_YNU_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_YNU_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'Y', N'Yes' ), ( 
		   N'N', N'No' ), ( 
		   N'U', N'Unknown' );
	PRINT 'CHORDS_VDW31_YNU_LU - Complete';
END;

--VDW_V3.1_TableDefs_YNXU_LU
IF OBJECT_ID('CHORDS_VDW31_YNXU_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_YNXU_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_YNXU_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_YNXU_LU]
	( 
				 [ABBREVIATION] nchar NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_YNXU_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_YNXU_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'Y', N'Yes' ), ( 
		   N'N', N'No' ), ( 
		   N'U', N'Unknown, missing' ), ( 
		   N'X', N'Not asked' );
	PRINT 'CHORDS_VDW31_YNXU_LU - Complete';
END;

--VDW_V3.1_TableDefs_LANGUAGES_ISO_LU
IF OBJECT_ID('CHORDS_VDW31_LANGUAGES_ISO_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_LANGUAGES_ISO_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_LANGUAGES_ISO_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_LANGUAGES_ISO_LU]
	( 
				 [ISO_639-2_CODE] nvarchar(3) NOT NULL, 
				 [ENGLISH_DESCRIPTION] nvarchar(200) NOT NULL, CONSTRAINT [PK_CHORDS_VDW31_LANGUAGES_ISO_LU] PRIMARY KEY CLUSTERED([ISO_639-2_CODE] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_LANGUAGES_ISO_LU]( 
		[ISO_639-2_CODE], 
		[ENGLISH_DESCRIPTION] )
	VALUES( 
		   'akk', 'Akkadian' ), ( 
		   'alb', 'Albanian' ), ( 
		   'ale', 'Aleut' ), ( 
		   'alg', 'Algonquian languages' ), ( 
		   'alt', 'Southern Altai' ), ( 
		   'amh', 'Amharic' ), ( 
		   'ang', 'English, Old (ca.450-1100)' ), ( 
		   'anp', 'Angika' ), ( 
		   'apa', 'Apache languages' ), ( 
		   'ara', 'Arabic' ), ( 
		   'arc', 'Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)' ), ( 
		   'arg', 'Aragonese' ), ( 
		   'arm', 'Armenian' ), ( 
		   'arn', 'Mapudungun; Mapuche' ), ( 
		   'arp', 'Arapaho' ), ( 
		   'art', 'Artificial languages' ), ( 
		   'arw', 'Arawak' ), ( 
		   'asm', 'Assamese' ), ( 
		   'ast', 'Asturian; Bable; Leonese; Asturleonese' ), ( 
		   'ath', 'Athapascan languages' ), ( 
		   'aus', 'Australian languages' ), ( 
		   'ava', 'Avaric' ), ( 
		   'ave', 'Avestan' ), ( 
		   'awa', 'Awadhi' ), ( 
		   'aym', 'Aymara' ), ( 
		   'aze', 'Azerbaijani' ), ( 
		   'bad', 'Banda languages' ), ( 
		   'bai', 'Bamileke languages' ), ( 
		   'bak', 'Bashkir' ), ( 
		   'bal', 'Baluchi' ), ( 
		   'bam', 'Bambara' ), ( 
		   'ban', 'Balinese' ), ( 
		   'baq', 'Basque' ), ( 
		   'bas', 'Basa' ), ( 
		   'bat', 'Baltic languages' ), ( 
		   'bej', 'Beja; Bedawiyet' ), ( 
		   'bel', 'Belarusian' ), ( 
		   'bem', 'Bemba' ), ( 
		   'ben', 'Bengali' ), ( 
		   'ber', 'Berber languages' ), ( 
		   'bho', 'Bhojpuri' ), ( 
		   'bih', 'Bihari languages' ), ( 
		   'bik', 'Bikol' ), ( 
		   'bin', 'Bini; Edo' ), ( 
		   'bis', 'Bislama' ), ( 
		   'bla', 'Siksika' ), ( 
		   'bnt', 'Bantu languages' ), ( 
		   'bos', 'Bosnian' ), ( 
		   'bra', 'Braj' ), ( 
		   'bre', 'Breton' ), ( 
		   'btk', 'Batak languages' ), ( 
		   'bua', 'Buriat' ), ( 
		   'bug', 'Buginese' ), ( 
		   'bul', 'Bulgarian' ), ( 
		   'bur', 'Burmese' ), ( 
		   'byn', 'Blin; Bilin' ), ( 
		   'cad', 'Caddo' ), ( 
		   'cai', 'Central American Indian languages' ), ( 
		   'car', 'Galibi Carib' ), ( 
		   'cat', 'Catalan; Valencian' ), ( 
		   'cau', 'Caucasian languages' ), ( 
		   'ceb', 'Cebuano' ), ( 
		   'cel', 'Celtic languages' ), ( 
		   'cha', 'Chamorro' ), ( 
		   'chb', 'Chibcha' ), ( 
		   'che', 'Chechen' ), ( 
		   'chg', 'Chagatai' ), ( 
		   'chi', 'Chinese' ), ( 
		   'chk', 'Chuukese' ), ( 
		   'chm', 'Mari' ), ( 
		   'chn', 'Chinook jargon' ), ( 
		   'cho', 'Choctaw' ), ( 
		   'chp', 'Chipewyan; Dene Suline' ), ( 
		   'chr', 'Cherokee' ), ( 
		   'chu', 'Church Slavic' ), ( 
		   'chv', 'Chuvash' ), ( 
		   'chy', 'Cheyenne' ), ( 
		   'cmc', 'Chamic languages' ), ( 
		   'cop', 'Coptic' ), ( 
		   'cor', 'Cornish' ), ( 
		   'cos', 'Corsican' ), ( 
		   'cpe', 'Creoles and pidgins, English based' ), ( 
		   'cpf', 'Creoles and pidgins, French-based' ), ( 
		   'cpp', 'Creoles and pidgins, Portuguese-based' ), ( 
		   'cre', 'Cree' ), ( 
		   'crh', 'Crimean Tatar; Crimean Turkish' ), ( 
		   'crp', 'Creoles and pidgins' ), ( 
		   'csb', 'Kashubian' ), ( 
		   'cus', 'Cushitic languages' ), ( 
		   'cze', 'Czech' ), ( 
		   'dak', 'Dakota' ), ( 
		   'dan', 'Danish' ), ( 
		   'dar', 'Dargwa' ), ( 
		   'day', 'Land Dayak languages' ), ( 
		   'del', 'Delaware' ), ( 
		   'den', 'Slave (Athapascan)' ), ( 
		   'dgr', 'Dogrib' ), ( 
		   'din', 'Dinka' ), ( 
		   'div', 'Divehi; Dhivehi; Maldivian' ), ( 
		   'doi', 'Dogri' ), ( 
		   'dra', 'Dravidian languages' ), ( 
		   'dsb', 'Lower Sorbian' ), ( 
		   'dua', 'Duala' ), ( 
		   'dum', 'Dutch, Middle (ca.1050-1350)' ), ( 
		   'dut', 'Dutch; Flemish' ), ( 
		   'dyu', 'Dyula' ), ( 
		   'dzo', 'Dzongkha' ), ( 
		   'efi', 'Efik' ), ( 
		   'egy', 'Egyptian (Ancient)' ), ( 
		   'eka', 'Ekajuk' ), ( 
		   'elx', 'Elamite' ), ( 
		   'eng', 'English' ), ( 
		   'enm', 'English, Middle (1100-1500)' ), ( 
		   'epo', 'Esperanto' ), ( 
		   'est', 'Estonian' ), ( 
		   'ewe', 'Ewe' ), ( 
		   'ewo', 'Ewondo' ), ( 
		   'fan', 'Fang' ), ( 
		   'fao', 'Faroese' ), ( 
		   'fat', 'Fanti' ), ( 
		   'fij', 'Fijian' ), ( 
		   'fil', 'Filipino; Pilipino' ), ( 
		   'fin', 'Finnish' ), ( 
		   'fiu', 'Finno-Ugrian languages' ), ( 
		   'fon', 'Fon' ), ( 
		   'fre', 'French' ), ( 
		   'frm', 'French, Middle (ca.1400-1600)' ), ( 
		   'fro', 'French, Old (842-ca.1400)' ), ( 
		   'frr', 'Northern Frisian' ), ( 
		   'frs', 'Eastern Frisian' ), ( 
		   'fry', 'Western Frisian' ), ( 
		   'ful', 'Fulah' ), ( 
		   'fur', 'Friulian' ), ( 
		   'gaa', 'Ga' ), ( 
		   'gay', 'Gayo' ), ( 
		   'gba', 'Gbaya' ), ( 
		   'gem', 'Germanic languages' ), ( 
		   'geo', 'Georgian' ), ( 
		   'ger', 'German' ), ( 
		   'gez', 'Geez' ), ( 
		   'gil', 'Gilbertese' ), ( 
		   'gla', 'Gaelic; Scottish Gaelic' ), ( 
		   'gle', 'Irish' ), ( 
		   'glg', 'Galician' ), ( 
		   'glv', 'Manx' ), ( 
		   'gmh', 'German, Middle High (ca.1050-1500)' ), ( 
		   'goh', 'German, Old High (ca.750-1050)' ), ( 
		   'gon', 'Gondi' ), ( 
		   'gor', 'Gorontalo' ), ( 
		   'got', 'Gothic' ), ( 
		   'grb', 'Grebo' ), ( 
		   'grc', 'Greek, Ancient (to 1453)' ), ( 
		   'gre', 'Greek' ), ( 
		   'grn', 'Guarani' ), ( 
		   'gsw', 'Swiss German; Alemannic; Alsatian' ), ( 
		   'guj', 'Gujarati' ), ( 
		   'gwi', 'Gwich''in' ), ( 
		   'hai', 'Haida' ), ( 
		   'hat', 'Haitian; Haitian Creole' ), ( 
		   'hau', 'Hausa' ), ( 
		   'haw', 'Hawaiian' ), ( 
		   'heb', 'Hebrew' ), ( 
		   'her', 'Herero' ), ( 
		   'hil', 'Hiligaynon' ), ( 
		   'him', 'Himachali languages' ), ( 
		   'hin', 'Hindi' ), ( 
		   'hit', 'Hittite' ), ( 
		   'hmn', 'Hmong; Mong' ), ( 
		   'hmo', 'Hiri Motu' ), ( 
		   'hrv', 'Croatian' ), ( 
		   'hsb', 'Upper Sorbian' ), ( 
		   'hun', 'Hungarian' ), ( 
		   'hup', 'Hupa' ), ( 
		   'iba', 'Iban' ), ( 
		   'ibo', 'Igbo' ), ( 
		   'ice', 'Icelandic' ), ( 
		   'ido', 'Ido' ), ( 
		   'iii', 'Sichuan Yi; Nuosu' ), ( 
		   'ijo', 'Ijo languages' ), ( 
		   'iku', 'Inuktitut' ), ( 
		   'ile', 'Interlingue; Occidental' ), ( 
		   'ilo', 'Iloko' ), ( 
		   'ina', 'Interlingua (International Auxiliary Language Association)' ), ( 
		   'inc', 'Indic languages' ), ( 
		   'ind', 'Indonesian' ), ( 
		   'ine', 'Indo-European languages' ), ( 
		   'inh', 'Ingush' ), ( 
		   'ipk', 'Inupiaq' ), ( 
		   'ira', 'Iranian languages' ), ( 
		   'iro', 'Iroquoian languages' ), ( 
		   'ita', 'Italian' ), ( 
		   'jav', 'Javanese' ), ( 
		   'jbo', 'Lojban' ), ( 
		   'jpn', 'Japanese' ), ( 
		   'jpr', 'Judeo-Persian' ), ( 
		   'jrb', 'Judeo-Arabic' ), ( 
		   'kaa', 'Kara-Kalpak' ), ( 
		   'kab', 'Kabyle' ), ( 
		   'kac', 'Kachin; Jingpho' ), ( 
		   'kal', 'Kalaallisut; Greenlandic' ), ( 
		   'kam', 'Kamba' ), ( 
		   'kan', 'Kannada' ), ( 
		   'kar', 'Karen languages' ), ( 
		   'kas', 'Kashmiri' ), ( 
		   'kau', 'Kanuri' ), ( 
		   'kaw', 'Kawi' ), ( 
		   'kaz', 'Kazakh' ), ( 
		   'kbd', 'Kabardian' ), ( 
		   'kha', 'Khasi' ), ( 
		   'khi', 'Khoisan languages' ), ( 
		   'khm', 'Central Khmer' ), ( 
		   'kho', 'Khotanese; Sakan' ), ( 
		   'kik', 'Kikuyu; Gikuyu' ), ( 
		   'kin', 'Kinyarwanda' ), ( 
		   'kir', 'Kirghiz; Kyrgyz' ), ( 
		   'kmb', 'Kimbundu' ), ( 
		   'kok', 'Konkani' ), ( 
		   'kom', 'Komi' ), ( 
		   'kon', 'Kongo' ), ( 
		   'kor', 'Korean' ), ( 
		   'kos', 'Kosraean' ), ( 
		   'kpe', 'Kpelle' ), ( 
		   'krc', 'Karachay-Balkar' ), ( 
		   'krl', 'Karelian' ), ( 
		   'kro', 'Kru languages' ), ( 
		   'kru', 'Kurukh' ), ( 
		   'kua', 'Kuanyama; Kwanyama' ), ( 
		   'kum', 'Kumyk' ), ( 
		   'kur', 'Kurdish' ), ( 
		   'kut', 'Kutenai' ), ( 
		   'lad', 'Ladino' ), ( 
		   'lah', 'Lahnda' ), ( 
		   'lam', 'Lamba' ), ( 
		   'lao', 'Lao' ), ( 
		   'lat', 'Latin' ), ( 
		   'lav', 'Latvian' ), ( 
		   'lez', 'Lezghian' ), ( 
		   'lim', 'Limburgan; Limburger; Limburgish' ), ( 
		   'lin', 'Lingala' ), ( 
		   'lit', 'Lithuanian' ), ( 
		   'lol', 'Mongo' ), ( 
		   'loz', 'Lozi' ), ( 
		   'ltz', 'Luxembourgish; Letzeburgesch' ), ( 
		   'lua', 'Luba-Lulua' ), ( 
		   'lub', 'Luba-Katanga' ), ( 
		   'lug', 'Ganda' ), ( 
		   'lui', 'Luiseno' ), ( 
		   'lun', 'Lunda' ), ( 
		   'luo', 'Luo (Kenya and Tanzania)' ), ( 
		   'lus', 'Lushai' ), ( 
		   'mac', 'Macedonian' ), ( 
		   'mad', 'Madurese' ), ( 
		   'mag', 'Magahi' ), ( 
		   'mah', 'Marshallese' ), ( 
		   'mai', 'Maithili' ), ( 
		   'mak', 'Makasar' ), ( 
		   'mal', 'Malayalam' ), ( 
		   'man', 'Mandingo' ), ( 
		   'mao', 'Maori' ), ( 
		   'map', 'Austronesian languages' ), ( 
		   'mar', 'Marathi' ), ( 
		   'mas', 'Masai' ), ( 
		   'may', 'Malay' ), ( 
		   'mdf', 'Moksha' ), ( 
		   'mdr', 'Mandar' ), ( 
		   'men', 'Mende' ), ( 
		   'mga', 'Irish, Middle (900-1200)' ), ( 
		   'mic', 'Mi''kmaq; Micmac' ), ( 
		   'min', 'Minangkabau' ), ( 
		   'mis', 'Uncoded languages' ), ( 
		   'mkh', 'Mon-Khmer languages' ), ( 
		   'mlg', 'Malagasy' ), ( 
		   'mlt', 'Maltese' ), ( 
		   'mnc', 'Manchu' ), ( 
		   'mni', 'Manipuri' ), ( 
		   'mno', 'Manobo languages' ), ( 
		   'moh', 'Mohawk' ), ( 
		   'mon', 'Mongolian' ), ( 
		   'mos', 'Mossi' ), ( 
		   'mul', 'Multiple languages' ), ( 
		   'mun', 'Munda languages' ), ( 
		   'mus', 'Creek' ), ( 
		   'mwl', 'Mirandese' ), ( 
		   'mwr', 'Marwari' ), ( 
		   'myn', 'Mayan languages' ), ( 
		   'myv', 'Erzya' ), ( 
		   'nah', 'Nahuatl languages' ), ( 
		   'nai', 'North American Indian languages' ), ( 
		   'nap', 'Neapolitan' ), ( 
		   'nau', 'Nauru' ), ( 
		   'nav', 'Navajo; Navaho' ), ( 
		   'nbl', 'Ndebele, South; South Ndebele' ), ( 
		   'nde', 'Ndebele, North; North Ndebele' ), ( 
		   'ndo', 'Ndonga' ), ( 
		   'nds', 'Low German; Low Saxon; German, Low; Saxon, Low' ), ( 
		   'nep', 'Nepali' ), ( 
		   'new', 'Nepal Bhasa; Newari' ), ( 
		   'nia', 'Nias' ), ( 
		   'nic', 'Niger-Kordofanian languages' ), ( 
		   'niu', 'Niuean' ), ( 
		   'nno', 'Norwegian Nynorsk; Nynorsk, Norwegian' ), ( 
		   'nob', 'Bokmål, Norwegian; Norwegian Bokmål' ), ( 
		   'nog', 'Nogai' ), ( 
		   'non', 'Norse, Old' ), ( 
		   'nor', 'Norwegian' ), ( 
		   'nqo', 'N''Ko' ), ( 
		   'nso', 'Pedi; Sepedi; Northern Sotho' ), ( 
		   'nub', 'Nubian languages' ), ( 
		   'nwc', 'Classical Newari; Old Newari; Classical Nepal Bhasa' ), ( 
		   'nya', 'Chichewa; Chewa; Nyanja' ), ( 
		   'nym', 'Nyamwezi' ), ( 
		   'nyn', 'Nyankole' ), ( 
		   'nyo', 'Nyoro' ), ( 
		   'nzi', 'Nzima' ), ( 
		   'oci', 'Occitan (post 1500)' ), ( 
		   'oji', 'Ojibwa' ), ( 
		   'ori', 'Oriya' ), ( 
		   'orm', 'Oromo' ), ( 
		   'osa', 'Osage' ), ( 
		   'oss', 'Ossetian; Ossetic' ), ( 
		   'ota', 'Turkish, Ottoman (1500-1928)' ), ( 
		   'oto', 'Otomian languages' ), ( 
		   'paa', 'Papuan languages' ), ( 
		   'pag', 'Pangasinan' ), ( 
		   'pal', 'Pahlavi' ), ( 
		   'pam', 'Pampanga; Kapampangan' ), ( 
		   'pan', 'Panjabi; Punjabi' ), ( 
		   'pap', 'Papiamento' ), ( 
		   'pau', 'Palauan' ), ( 
		   'peo', 'Persian, Old (ca.600-400 B.C.)' ), ( 
		   'per', 'Persian' ), ( 
		   'phi', 'Philippine languages' ), ( 
		   'phn', 'Phoenician' ), ( 
		   'pli', 'Pali' ), ( 
		   'pol', 'Polish' ), ( 
		   'pon', 'Pohnpeian' ), ( 
		   'por', 'Portuguese' ), ( 
		   'pra', 'Prakrit languages' ), ( 
		   'pro', 'Provençal, Old (to 1500);Occitan, Old (to 1500)' ), ( 
		   'pus', 'Pushto; Pashto' ), ( 
		   'que', 'Quechua' ), ( 
		   'raj', 'Rajasthani' ), ( 
		   'rap', 'Rapanui' ), ( 
		   'rar', 'Rarotongan; Cook Islands Maori' ), ( 
		   'roa', 'Romance languages' ), ( 
		   'roh', 'Romansh' ), ( 
		   'rom', 'Romany' ), ( 
		   'rum', 'Romanian; Moldavian; Moldovan' ), ( 
		   'run', 'Rundi' ), ( 
		   'rup', 'Aromanian; Arumanian; Macedo-Romanian' ), ( 
		   'rus', 'Russian' ), ( 
		   'sad', 'Sandawe' ), ( 
		   'sag', 'Sango' ), ( 
		   'sah', 'Yakut' ), ( 
		   'sai', 'South American Indian languages' ), ( 
		   'sal', 'Salishan languages' ), ( 
		   'sam', 'Samaritan Aramaic' ), ( 
		   'san', 'Sanskrit' ), ( 
		   'sas', 'Sasak' ), ( 
		   'sat', 'Santali' ), ( 
		   'scn', 'Sicilian' ), ( 
		   'sco', 'Scots' ), ( 
		   'sel', 'Selkup' ), ( 
		   'sem', 'Semitic languages' ), ( 
		   'sga', 'Irish, Old (to 900)' ), ( 
		   'sgn', 'Sign Languages' ), ( 
		   'shn', 'Shan' ), ( 
		   'sid', 'Sidamo' ), ( 
		   'sin', 'Sinhala; Sinhalese' ), ( 
		   'sio', 'Siouan languages' ), ( 
		   'sit', 'Sino-Tibetan languages' ), ( 
		   'sla', 'Slavic languages' ), ( 
		   'slo', 'Slovak' ), ( 
		   'slv', 'Slovenian' ), ( 
		   'sma', 'Southern Sami' ), ( 
		   'sme', 'Northern Sami' ), ( 
		   'smi', 'Sami languages' ), ( 
		   'smj', 'Lule Sami' ), ( 
		   'smn', 'Inari Sami' ), ( 
		   'smo', 'Samoan' ), ( 
		   'sms', 'Skolt Sami' ), ( 
		   'sna', 'Shona' ), ( 
		   'snd', 'Sindhi' ), ( 
		   'snk', 'Soninke' ), ( 
		   'sog', 'Sogdian' ), ( 
		   'som', 'Somali' ), ( 
		   'son', 'Songhai languages' ), ( 
		   'sot', 'Sotho, Southern' ), ( 
		   'spa', 'Spanish; Castilian' ), ( 
		   'srd', 'Sardinian' ), ( 
		   'srn', 'Sranan Tongo' ), ( 
		   'srp', 'Serbian' ), ( 
		   'srr', 'Serer' ), ( 
		   'ssa', 'Nilo-Saharan languages' ), ( 
		   'ssw', 'Swati' ), ( 
		   'suk', 'Sukuma' ), ( 
		   'sun', 'Sundanese' ), ( 
		   'sus', 'Susu' ), ( 
		   'sux', 'Sumerian' ), ( 
		   'swa', 'Swahili' ), ( 
		   'swe', 'Swedish' ), ( 
		   'syc', 'Classical Syriac' ), ( 
		   'syr', 'Syriac' ), ( 
		   'tah', 'Tahitian' ), ( 
		   'tai', 'Tai languages' ), ( 
		   'tam', 'Tamil' ), ( 
		   'tat', 'Tatar' ), ( 
		   'tel', 'Telugu' ), ( 
		   'tem', 'Timne' ), ( 
		   'ter', 'Tereno' ), ( 
		   'tet', 'Tetum' ), ( 
		   'tgk', 'Tajik' ), ( 
		   'tgl', 'Tagalog' ), ( 
		   'tha', 'Thai' ), ( 
		   'tib', 'Tibetan' ), ( 
		   'tig', 'Tigre' ), ( 
		   'tir', 'Tigrinya' ), ( 
		   'tiv', 'Tiv' ), ( 
		   'tkl', 'Tokelau' ), ( 
		   'tlh', 'Klingon; tlhIngan-Hol' ), ( 
		   'tli', 'Tlingit' ), ( 
		   'tmh', 'Tamashek' ), ( 
		   'tog', 'Tonga (Nyasa)' ), ( 
		   'ton', 'Tonga (Tonga Islands)' ), ( 
		   'tpi', 'Tok Pisin' ), ( 
		   'tsi', 'Tsimshian' ), ( 
		   'tsn', 'Tswana' ), ( 
		   'tso', 'Tsonga' ), ( 
		   'tuk', 'Turkmen' ), ( 
		   'tum', 'Tumbuka' ), ( 
		   'tup', 'Tupi languages' ), ( 
		   'tur', 'Turkish' ), ( 
		   'tut', 'Altaic languages' ), ( 
		   'tvl', 'Tuvalu' ), ( 
		   'twi', 'Twi' ), ( 
		   'tyv', 'Tuvinian' ), ( 
		   'udm', 'Udmurt' ), ( 
		   'uga', 'Ugaritic' ), ( 
		   'uig', 'Uighur; Uyghur' ), ( 
		   'ukr', 'Ukrainian' ), ( 
		   'umb', 'Umbundu' ), ( 
		   'und', 'Undetermined' ), ( 
		   'urd', 'Urdu' ), ( 
		   'uzb', 'Uzbek' ), ( 
		   'vai', 'Vai' ), ( 
		   'ven', 'Venda' ), ( 
		   'vie', 'Vietnamese' ), ( 
		   'vol', 'Volapük' ), ( 
		   'vot', 'Votic' ), ( 
		   'wak', 'Wakashan languages' ), ( 
		   'wal', 'Wolaitta; Wolaytta' ), ( 
		   'war', 'Waray' ), ( 
		   'was', 'Washo' ), ( 
		   'wel', 'Welsh' ), ( 
		   'wen', 'Sorbian languages' ), ( 
		   'wln', 'Walloon' ), ( 
		   'wol', 'Wolof' ), ( 
		   'xal', 'Kalmyk; Oirat' ), ( 
		   'xho', 'Xhosa' ), ( 
		   'yao', 'Yao' ), ( 
		   'yap', 'Yapese' ), ( 
		   'yid', 'Yiddish' ), ( 
		   'yor', 'Yoruba' ), ( 
		   'ypk', 'Yupik languages' ), ( 
		   'zap', 'Zapotec' ), ( 
		   'zbl', 'Blissymbols; Blissymbolics; Bliss' ), ( 
		   'zen', 'Zenaga' ), ( 
		   'zgh', 'Standard Moroccan Tamazight' ), ( 
		   'zha', 'Zhuang; Chuang' ), ( 
		   'znd', 'Zande languages' ), ( 
		   'zul', 'Zulu' ), ( 
		   'zun', 'Zuni' ), ( 
		   'zxx', 'No linguistic content; Not applicable' ), ( 
		   'zza', 'Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki' );
END;