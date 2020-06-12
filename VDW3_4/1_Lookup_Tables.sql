SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*****************************************
ABN_IND_LU
Changes:
*****************************************/

PRINT '-----------------------------------------------------'
IF OBJECT_ID('ABN_IND_LU') IS NOT NULL
BEGIN
	PRINT 'ABN_IND_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ABN_IND_LU - Creating';
	CREATE TABLE ABN_IND_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_ABN_IND_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO ABN_IND_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'AB', 'abnormal' ), ( 
		   'C', 'critical' ), ( 
		   'AH', 'abnormal high' ), ( 
		   'CH', 'critical high' ), ( 
		   'AL', 'abnormal low' ), ( 
		   'CL', 'critical low' ), ( 
		   'IN', 'inconclusive' ), ( 
		   'UK', 'unknown' ), ( 
		   'NL', 'normal' );
	PRINT 'ABN_IND_LU - Complete';
END;

/*****************************************
ADMITTING_SOURCE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('ADMITTING_SOURCE_LU') IS NOT NULL
BEGIN
	PRINT 'ADMITTING_SOURCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ADMITTING_SOURCE_LU - Creating';
	CREATE TABLE ADMITTING_SOURCE_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_ADMITTING_SOURCE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];

	INSERT INTO ADMITTING_SOURCE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'AV', 'Ambulatory Visit' ), ( 
		   'ED', 'Emergency Department' ), ( 
		   'AF', 'Adult Foster Home' ), ( 
		   'AL', 'Assisted Living Facility' ), ( 
		   'HH', 'Home Health' ), ( 
		   'HS', 'Hospice' ), ( 
		   'HO', 'Home / Self Care' ), ( 
		   'IP', 'Other Acute Inpatient Hospital' ), ( 
		   'NH', 'Nursing Home (Includes ICF)' ), ( 
		   'OT', 'Other' ), ( 
		   'RS', 'Residential Facility' ), ( 
		   'RH', 'Rehabilitation Facility' ), ( 
		   'SN', 'Skilled Nursing Facility' ), ( 
		   'UN', 'Unknown' );
	PRINT 'ADMITTING_SOURCE_LU - Complete';
END;

/*****************************************
BENEFIT_TYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('BENEFIT_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'BENEFIT_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'BENEFIT_TYPE_LU - Creating';
	CREATE TABLE BENEFIT_TYPE_LU
	( 
				 ABBREVIATION nchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_BENEFIT_TYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO BENEFIT_TYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'CU', 'Current insurance or benefit information' ), (
		   'EN', 'Enrollment insurance or benefit information' ), ( 
		   'PR', 'Primary payer on claim or encounter' ), ( 
		   'PA', 'Payer on claim with unknown rank or order' ), ( 
		   'SR', 'Self-reported insurance or benefit' ), (
		   'NI', 'No benefit information availible' );
END;

/*****************************************
BENEFIT_CAT_LU
Changes: 'SP' value changed to 'NC'.  Updated description
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('BENEFIT_CAT_LU') IS NOT NULL
BEGIN
	PRINT 'BENEFIT_CAT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'BENEFIT_CAT_LU - Creating';
	CREATE TABLE BENEFIT_CAT_LU
	( 
				 ABBREVIATION nchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(120) NOT NULL, 
				 CONSTRAINT [PK_BENEFIT_CAT_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO BENEFIT_CAT_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'CC', 'Correctional Care' ), (
		   'CO', 'Commercial/Private Insurance' ), ( 
		   'CP', 'Children''s  Healthcare Insurance Program' ), ( 
		   'MC', 'Medicare' ), ( 
		   'MD', 'Medicaid' ), (
		   'OG', 'Other Government' ), (
		   'NC', 'No coverage used/not covered by insurance - includes Self-Pay/Uninsured/Private Pay (excluding correctional care). '), (
		   'OT', 'Other Insurance' ), (
		   'UN', 'Unknown Insurance'), (
		   'WC', 'Workers Compensation'), (
		   'NI', 'No Benefit Information Available');
END;

/*****************************************
BP_TYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('BP_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'BP_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'BP_TYPE_LU - Creating';
	CREATE TABLE BP_TYPE_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_BP_TYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO BP_TYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   N'R', N'Rooming' ), ( 
		   N'O', N'Orthostatic' ), ( 
		   N'M', N'Multiple' ), ( 
		   N'E', N'Extended' );
END;

/*****************************************
CAUSETYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('CAUSETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CAUSETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CAUSETYPE_LU - Creating';
	CREATE TABLE CAUSETYPE_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CAUSETYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO CAUSETYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'I', 'Immediate/Primary' ), ( 
		   'U', 'Underlying' ), ( 
		   'C', 'Contributory' ), ( 
		   'O', 'Other' );
	PRINT 'CAUSETYPE_LU - Complete';
END;

/*****************************************
ADDRESS_TYPE_CODE_LU
Changes:
	Updated CA to CO for Corrections address valid value
*****************************************/
IF OBJECT_ID('ADDRESS_TYPE_CODE_LU') IS NOT NULL
BEGIN
	PRINT 'ADDRESS_TYPE_CODE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ADDRESS_TYPE_CODE_LU - Creating';
	CREATE TABLE ADDRESS_TYPE_CODE_LU
	( 
				 ABBREVIATION nchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_ADDRESS_TYPE_CODE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO ADDRESS_TYPE_CODE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'CO', 'Corrections address' ), ( 
		   'DO', 'Dormitory (college)' ), ( 
		   'HC', 'Healthcare facility' ), ( 
		   'HL', 'Homeless' ), ( 
		   'HS', 'Human Services' ), (
		   'IN', 'Incomplete address' ), ( 
		   'SL', 'Supported living' ), ( 
		   'GA', 'Geocoded address (other)' );
	PRINT 'ADDRESS_TYPE_CODE_LU - Complete';
END;

/*****************************************
CODETYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CODETYPE_LU - Creating';
	CREATE TABLE CODETYPE_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CODETYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO CODETYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'C', 'CPT' ), ( 
		   'I', 'ICD9' ), ( 
		   'H', 'HCPCS' ), ( 
		   'L', 'local home-grown' ), ( 
		   'O', 'other' );
	PRINT 'CODETYPE_LU - Complete';
END;

/*****************************************
CONFIDENCE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('CONFIDENCE_LU') IS NOT NULL
BEGIN
	PRINT 'CONFIDENCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CONFIDENCE_LU - Creating';
	CREATE TABLE CONFIDENCE_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CONFIDENCE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO CONFIDENCE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'E', 'Excellent' ), ( 
		   'F', 'Fair' ), ( 
		   'P', 'Poor' ), (
		   'U', 'Unknown');
	PRINT 'CONFIDENCE_LU - Complete';
END;

/*****************************************
DEPARTMENT_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('DEPARTMENT_LU') IS NOT NULL
BEGIN
	PRINT 'DEPARTMENT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'DEPARTMENT_LU - Creating';
	CREATE TABLE DEPARTMENT_LU
	( 
				 ABBREVIATION nvarchar(4) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_DEPARTMENT_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO DEPARTMENT_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'ACUP', 'Acupuncture' ), ( 
		   'ALGY', 'Allergy' ), ( 
		   'AMBU', 'Ambulance Services' ), ( 
		   'ANES', 'Anesthesiology' ), ( 
		   'AUD', 'Audiology' ), ( 
		   'CARD', 'Cardiology' ), ( 
		   'CASR', 'Cast Room' ), ( 
		   'CHEM', 'Chemical and Alcohol Dependency' ), ( 
		   'CHIR', 'Chiropractic' ), ( 
		   'CMHL', 'Community Health' ), ( 
		   'CRIT', 'Critical Care Medicine' ), ( 
		   'CRMG', 'Care Management' ), ( 
		   'DENT', 'Dental' ), ( 
		   'DERM', 'Dermatology' ), ( 
		   'DIAL', 'Dialysis' ), ( 
		   'DME', 'Durable Medical Equipment' ), ( 
		   'EDUC', 'Education' ), ( 
		   'ENDO', 'Endocrinology' ), ( 
		   'ENT', 'Otolaryngology' ), ( 
		   'ER', 'Emergency Room' ), ( 
		   'FP', 'Family Practice' ), ( 
		   'GEN', 'Genetics' ), ( 
		   'GER', 'Gerontology/Geriatrics' ), ( 
		   'GI', 'Gastro-Intestinal Medicine' ), ( 
		   'HAP', 'Health Appraisals' ), ( 
		   'HEP', 'Hepatology' ), ( 
		   'HH', 'Home Health' ), ( 
		   'HOSP', 'Hospital Care' ), ( 
		   'HSPC', 'Hospice' ), ( 
		   'ICF', 'Intermediate Care Facility' ), ( 
		   'IM', 'Internal Medicine' ), ( 
		   'IMUN', 'Immunology' ), ( 
		   'IND', 'Industrial Medicine' ), ( 
		   'INF', 'Infectious Disease' ), ( 
		   'INFU', 'Infusion Center' ), ( 
		   'IR', 'Injection Room' ), ( 
		   'LAB', 'Laboratory' ), ( 
		   'MH', 'Mental Health' ), ( 
		   'NATU', 'Naturopathy' ), ( 
		   'NEPH', 'Nephrology' ), ( 
		   'NEUR', 'Neurology' ), ( 
		   'NEWB', 'Newborn' ), ( 
		   'NRSG', 'Neurosurgery' ), ( 
		   'NUCL', 'Nuclear Medicine' ), ( 
		   'NUT', 'Nutrition' ), ( 
		   'OBGN', 'Obstetrics/Gynecology' ), ( 
		   'OCTH', 'Occupational Therapy' ), ( 
		   'ONC', 'Oncology' ), ( 
		   'OPTH', 'Ophthalmology' ), ( 
		   'OPTO', 'Optometry' ), ( 
		   'ORTH', 'Orthopedics' ), ( 
		   'OST', 'Osteopathy' ), ( 
		   'PAL', 'Palliative Care' ), ( 
		   'PATH', 'Pathology' ), ( 
		   'PC', 'Primary Care' ), ( 
		   'PEDS', 'Pediatrics' ), ( 
		   'PERI', 'Perinatology' ), ( 
		   'PHYS', 'Physiatry' ), ( 
		   'POD', 'Podiatry' ), ( 
		   'PSRG', 'Plastic Surgery' ), ( 
		   'PT', 'Physical Therapy' ), ( 
		   'PULM', 'Pulmonary Medicine' ), ( 
		   'RAD', 'Radiology' ), ( 
		   'RADT', 'Radiation Therapy' ), ( 
		   'RECT', 'Recreational Therapy' ), ( 
		   'REHB', 'Rehabilitation' ), ( 
		   'RESP', 'Respiratory Therapy' ), ( 
		   'RHEU', 'Rheumatology' ), ( 
		   'RN', 'Registered Nurse' ), ( 
		   'SNF', 'Skilled Nursing Facility' ), ( 
		   'SPOR', 'Sports Medicine' ), ( 
		   'SPTH', 'Speech Therapy' ), ( 
		   'SURG', 'General Surgery' ), ( 
		   'TRAN', 'Transplant' ), ( 
		   'URG', 'Urgent Care' ), ( 
		   'URO', 'Urology' ), ( 
		   'OTH', 'Other' ), ( 
		   'UNK', 'Unknown' );
	PRINT 'DEPARTMENT_LU - Complete';
END;

/*****************************************
DISCHARGE_DISPOSITION_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('DISCHARGE_DISPOSITION_LU') IS NOT NULL
BEGIN
	PRINT 'DISCHARGE_DISPOSITION_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'DISCHARGE_DISPOSITION_LU - Creating';
	CREATE TABLE DISCHARGE_DISPOSITION_LU
	( 
				 ABBREVIATION nchar NOT NULL,
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT PK_DISCHARGE_DISPOSITION_LU PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO DISCHARGE_DISPOSITION_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'A', 'Alive' ), ( 
		   'E', 'Expired' ), ( 
		   'U', 'Unknown' );
	PRINT 'DISCHARGE_DISPOSITION_LU - Complete';
END;

/*****************************************
DISCHARGE_STATUS_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('DISCHARGE_STATUS_LU') IS NOT NULL
BEGIN
	PRINT 'DISCHARGE_STATUS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'DISCHARGE_STATUS_LU - Creating';
	CREATE TABLE DISCHARGE_STATUS_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_DISCHARGE_STATUS_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO DISCHARGE_STATUS_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'AF', 'Adult Foster Home' ), ( 
		   'AL', 'Assisted Living Facility' ), ( 
		   'AM', 'Against Medical Advice' ), ( 
		   'AW', 'Absent without leave' ), ( 
		   'EX', 'Expired' ), ( 
		   'HH', 'Home Health' ), ( 
		   'HS', 'Hospice' ), ( 
		   'HO', 'Home / Self Care' ), ( 
		   'IP', 'Other Acute Inpatient Hospital' ), ( 
		   'NH', 'Nursing Home (Includes ICF)' ), ( 
		   'OT', 'Other' ), ( 
		   'RS', 'Residential Facility' ), ( 
		   'RH', 'Rehabilitation Facility' ), ( 
		   'SH', 'Still In Hospital' ), ( 
		   'SN', 'Skilled Nursing Facility' ), ( 
		   'UN', 'Unknown' );
	PRINT 'DISCHARGE_STATUS_LU - Complete';
END;

/*****************************************
DTIMPUTE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('DTIMPUTE_LU') IS NOT NULL
BEGIN
	PRINT 'DTIMPUTE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'DTIMPUTE_LU - Creating';
	CREATE TABLE DTIMPUTE_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_DTIMPUTE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO DTIMPUTE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'M', 'Month of date imputed' ), ( 
		   'D', 'Day of date imputed' ), ( 
		   'B', 'Both month and day imputed' ), ( 
		   'N', 'Not imputed' );
	PRINT 'DTIMPUTE_LU - Complete';
END;

/*****************************************
DX_CODETYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('DX_CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'DX_CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'DX_CODETYPE_LU - Creating';
	CREATE TABLE DX_CODETYPE_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_DX_CODETYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO DX_CODETYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '07', 'ICD-7-CM (including ICD-7)' ), ( 
		   '08', 'ICD-8-CM (including ICD-8)' ), ( 
		   '09', 'ICD-9-CM (including ICD-9)' ), ( 
		   '10', 'ICD-10-CM (including ICD-10)' ), ( 
		   '11', 'ICD-11-CM (including ICD-11)' ), ( 
		   'SM', 'SNOMED' ), ( 
		   'IM', 'IMO' ), ( 
		   'OT', 'Other' ), ( 
		   'UN', 'Unknown' );
	PRINT 'DX_CODETYPE_LU - Complete';
END;

/*****************************************
DX_ORIGIN_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('DX_ORIGIN_LU') IS NOT NULL
BEGIN
	PRINT 'DX_ORIGIN_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'DX_ORIGIN_LU - Creating';
	CREATE TABLE DX_ORIGIN_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_DX_ORIGIN_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO DX_ORIGIN_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'OD', 'Order' ), ( 
		   'BI', 'Billing' ), ( 
		   'CL', 'Claim' ), ( 
		   'PR', 'Problem list' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
	PRINT 'DX_ORIGIN_LU - Complete';
END;

/*****************************************
ENCOUNTER_SUBTYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('ENCOUNTER_SUBTYPE_LU') IS NOT NULL
BEGIN
	PRINT 'ENCOUNTER_SUBTYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ENCOUNTER_SUBTYPE_LU - Creating';
	CREATE TABLE ENCOUNTER_SUBTYPE_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_ENCOUNTER_SUBTYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO ENCOUNTER_SUBTYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'AI', 'Acute Inpatient Stay. Excludes observation bed.' ), ( 
		   'HA', 'Hospital Ambulatory. Outpatient care at a hospital excluding same day surgery and observation beds.' ), ( 
		   'OC', 'Outpatient Clinic Visit' ), ( 
		   'OB', 'Observation Bed' ), ( 
		   'SD', 'Same Day Surgery' ), ( 
		   'UC', 'Urgent Care' ), ( 
		   'DI', 'Dialysis' ), ( 
		   'OT', 'Other non-hospital' ), ( 
		   'HH', 'Home Health' ), ( 
		   'HS', 'Hospice' ), ( 
		   'SN', 'Skilled Nursing Facility' ), ( 
		   'NH', 'Nursing Home (includes ICF)' ), ( 
		   'RH', 'Rehab' );
	PRINT 'ENCOUNTER_SUBTYPE_LU - Complete';
END;

/*****************************************
ENCTYPE_LU
Changes: Summer 2020 - Added TV and TO values; Updated descriptions for TE and EM.
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('ENCTYPE_LU') IS NOT NULL
BEGIN
	PRINT 'ENCTYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ENCTYPE_LU - Creating';
	CREATE TABLE ENCTYPE_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(500) NOT NULL, 
				 CONSTRAINT [PK_ENCTYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO ENCTYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'IP', 'Acute Inpatient Hospital Stay: Inpatient stays, same-day hospital discharges, hospital transfers where the patient was admitted into the hospital. Includes acute inpatient psych and detox hospital stays. [ENCOUNTER_SUBTYPE = AI]' ), ( 
		   'ED', 'Emergency Department Encounter: Excludes urgent care visits. [ENCOUNTER_SUBTYPE = HA,OC]' ), ( 
		   'AV', 'Ambulatory Visit: Outpatient clinics, same day surgeries, observation beds, urgent care visits, and other same-day ambulatory hospital encounters. Excludes emergency department encounters). [ENCOUNTER_SUBTYPE = OC, OB, SD, HA, UC, RH, DI, OT]' ), ( 
		   'EM', 'E-mail Encounters, now including all asynchronous electronic communication (includes email and portal messaging)' ), ( 
		   'TE', 'Telephone Encounters, now including all synchronous audio-only communication (including telephone calls)' ), ( 
		   'TV', 'Telehealth Encounter with synchronous audio and video' ), ( 
		   'TO', 'All other synchronous Telehealth Encounters that do not fit in other telehealth encounter types.' ), ( 
		   'IS', 'Non-Acute Institutional Stays: Hospice, SNF, rehab, nursing home, residential, overnight non-hospital dialysis and other non-hospital stays. [ENCOUNTER_SUBTYPE = HS, SN, NH, RH,DI, OT]' ), ( 
		   'OE', 'OE=Other Encounters (not overnight): Hospice visits, home health visits, SNF visits, other non-hospital visits. [ENCOUNTER_SUBTYPE = HS, HH, SN, RH, DI, OT]' ), ( 
		   'LO', 'Lab Only Encounter: Optional. Lab encounters that cannot be matched to another encounter. Include to link variables from ENCOUNTER table to the PROCEDURES table. [ENCOUNTER_SUBTYPE = OC,OT]' ), ( 
		   'RO', 'Radiology Only Encounter: Optional. Radiology encounter that cannot be matched to another encounter. Include to link variables from utilization file to procedure file. [ENCOUNTER_SUBTYPE = OC,OT]' );
	PRINT 'ENCTYPE_LU - Complete';
END;

/*****************************************
ENROLLMENT_BASIS_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('ENROLLMENT_BASIS_LU') IS NOT NULL
BEGIN
	PRINT 'ENROLLMENT_BASIS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ENROLLMENT_BASIS_LU - Creating';
	CREATE TABLE ENROLLMENT_BASIS_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_ENROLLMENT_BASIS_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO ENROLLMENT_BASIS_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'G', 'Geographic Basis' ), ( 
		   'I', 'Insurance Basis' ), ( 
		   'B', 'Both Insurance and Geographic bases' ), ( 
		   'P', 'Non-enrollee Patient' ), (
		   'U', 'Unknown');
	PRINT 'ENROLLMENT_BASIS_LU - Complete';
END;

/*****************************************
GENDER_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('GENDER_LU') IS NOT NULL
BEGIN
	PRINT 'GENDER_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'GENDER_LU - Creating';
	CREATE TABLE GENDER_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(25) NOT NULL, 
				 CONSTRAINT [PK_GENDER_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO GENDER_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'F', 'Female' ), ( 
		   'M', 'Male' ), ( 
		   'U', 'Unknown' ), ( 
		   'O', 'Other' );
	PRINT 'GENDER_LU - Complete';
END;

/*****************************************
LANG_USAGE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('LANG_USAGE_LU') IS NOT NULL
BEGIN
	PRINT 'LANG_USAGE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'LANG_USAGE_LU - Creating';
	CREATE TABLE LANG_USAGE_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_LANG_USAGE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO LANG_USAGE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'S', 'Spoken (or signed)' ), ( 
		   'W', 'Written' ), ( 
		   'B', 'Both spoken and written' ), ( 
		   'U', 'Unknown' );
	PRINT 'LANG_USAGE_LU - Complete';
END;

/*****************************************
MODIFIER_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('MODIFIER_LU') IS NOT NULL
BEGIN
	PRINT 'MODIFIER_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'MODIFIER_LU - Creating';
	CREATE TABLE MODIFIER_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_MODIFIER_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO MODIFIER_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'TX', 'text' ), ( 
		   'EQ', 'equal' ), ( 
		   'LT', 'less than' ), ( 
		   'LE', 'less than or equal to' ), ( 
		   'GT', 'greater than' ), ( 
		   'GE', 'greater than or equal to' );
	PRINT 'MODIFIER_LU - Complete';
END;

/*****************************************
ONC_SMOKING_STATUS_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('ONC_SMOKING_STATUS_LU') IS NOT NULL
BEGIN
	PRINT 'ONC_SMOKING_STATUS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'ONC_SMOKING_STATUS_LU - Creating';
	CREATE TABLE ONC_SMOKING_STATUS_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_ONC_SMOKING_STATUS_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO ONC_SMOKING_STATUS_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '1', 'current every day smoker' ), ( 
		   '2', 'current some day smoker' ), ( 
		   '3', 'former smoker' ), ( 
		   '4', 'never smoker' ), ( 
		   '5', 'smoker, current status unknown' ), ( 
		   '6', 'unknown if ever smoked' );
	PRINT 'ONC_SMOKING_STATUS_LU - Complete';
END;

/*****************************************
POSITION_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('POSITION_LU') IS NOT NULL
BEGIN
	PRINT 'POSITION_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'POSITION_LU - Creating';
	CREATE TABLE POSITION_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_POSITION_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO POSITION_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '1', 'Sitting' ), ( 
		   '2', 'Standing' ), ( 
		   '3', 'Supine' );
	PRINT 'POSITION_LU - Complete';
END;

/*****************************************
PRIMARY_DX_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PRIMARY_DX_LU') IS NOT NULL
BEGIN
	PRINT 'PRIMARY_DX_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PRIMARY_DX_LU - Creating';
	CREATE TABLE PRIMARY_DX_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_PRIMARY_DX_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PRIMARY_DX_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'P', 'Primary Dx' ), ( 
		   'S', 'Not Primary Dx' ), ( 
		   'X', 'Primary Dx Status not classifiable' );
	PRINT 'PRIMARY_DX_LU - Complete';
END;

/*****************************************
PRINCIPAL_DX_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PRINCIPAL_DX_LU') IS NOT NULL
BEGIN
	PRINT 'PRINCIPAL_DX_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PRINCIPAL_DX_LU - Creating';
	CREATE TABLE PRINCIPAL_DX_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_PRINCIPAL_DX_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PRINCIPAL_DX_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'P', 'Principal Dx' ), ( 
		   'N', 'Not Principal Dx' ), ( 
		   'X', 'Principal Dx Status not classifiable' );
	PRINT 'PRINCIPAL_DX_LU - Complete';
END;

/*****************************************
PROVIDER_TYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PROVIDER_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'PROVIDER_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PROVIDER_TYPE_LU - Creating';
	CREATE TABLE PROVIDER_TYPE_LU
	( 
				 ABBREVIATION nvarchar(3) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_PROVIDER_TYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PROVIDER_TYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '001', 'ACUPUNCTURIST' ), ( 
		   '002', 'ANESTHESIOLGY ASST' ), ( 
		   '003', 'AUDIOLOGIST' ), ( 
		   '004', 'AUDIOLOGY ASSISTANT' ), ( 
		   '005', 'CARDIAC REHAB THERAPIST' ), ( 
		   '006', 'CASE MANAGER' ), ( 
		   '007', 'CERTIFIED NURSE SPECIALIST' ), ( 
		   '008', 'CERTIFIED REG NURSE ANESTHETIST' ), ( 
		   '009', 'CHAPLAIN' ), ( 
		   '010', 'CHEM DEP COUNSELOR, ADULT' ), ( 
		   '011', 'CHEM DEP COUNSELOR, CHILD/ADOL' ), ( 
		   '012', 'CHIROPRACTOR' ), ( 
		   '013', 'CIGNA' ), ( 
		   '014', 'CLINICAL NURSE SPECIALIST' ), ( 
		   '015', 'COUMADIN NURSE' ), ( 
		   '016', 'CPAP SPECIALIST' ), ( 
		   '017', 'DENTAL ASSISTANT' ), ( 
		   '018', 'DENTIST' ), ( 
		   '019', 'DIABETIC NURSE' ), ( 
		   '020', 'DIETETIC TECH' ), ( 
		   '021', 'DIETITIAN' ), ( 
		   '022', 'EEG TECHNICIAN' ), ( 
		   '023', 'ER TECH' ), ( 
		   '024', 'EXERCISE PHYSIOLOGIST' ), ( 
		   '025', 'FELLOW' ), ( 
		   '026', 'HEALING TOUCH' ), ( 
		   '027', 'HEALTH EDUCATOR' ), ( 
		   '028', 'HOME HEALTH AIDE' ), ( 
		   '029', 'HP PHYSICIAN' ), ( 
		   '030', 'HYGIENIST' ), ( 
		   '031', 'INDEPENDENT LAB/X-RAY' ), ( 
		   '032', 'INF CNTRL PRACT' ), ( 
		   '033', 'INFUSION THERAPIST' ), ( 
		   '034', 'INTERPRETER' ), ( 
		   '035', 'LAB ASSISTANT' ), ( 
		   '036', 'LAB TECHNICIAN' ), ( 
		   '037', 'LACTATION CONSULTANT' ), ( 
		   '038', 'LIC FAM THERAPIST' ), ( 
		   '039', 'LIC SOCIAL WORKER' ), ( 
		   '040', 'MASSAGE THERAPIST' ), ( 
		   '041', 'MEDICAL ASSISTANT' ), ( 
		   '042', 'MIDLEVEL' ), ( 
		   '043', 'MIDWIFE' ), ( 
		   '044', 'MUSIC THERAPIST' ), ( 
		   '045', 'NOT APPLICABLE' ), ( 
		   '046', 'NURSE' ), ( 
		   '047', 'NURSE CLINICIAN' ), ( 
		   '048', 'NURSE PRACTITIONER' ), ( 
		   '049', 'OCCUPATIONAL THERAPIST' ), ( 
		   '050', 'OPHTHALMIC ASSISTANT' ), ( 
		   '051', 'OPHTHALMIC TECHNICIAN' ), ( 
		   '052', 'OPTICIAN' ), ( 
		   '053', 'OPTOMETRIST' ), ( 
		   '054', 'ORTHO PHY ASST' ), ( 
		   '055', 'ORTHOPAEDIC' ), ( 
		   '056', 'OSTEOPATH' ), ( 
		   '057', 'PERSONAL CARE ATTENDANT' ), ( 
		   '058', 'PHARM TECH' ), ( 
		   '059', 'PHARMACIST' ), ( 
		   '060', 'PHYSICAL THERAPIST' ), ( 
		   '061', 'PHYSICIAN' ), ( 
		   '062', 'PHYSICIAN ASSISTANT' ), ( 
		   '063', 'PODIATRIST' ), ( 
		   '064', 'PSYCH TECHNICIAN' ), ( 
		   '065', 'PSYCHOLOGIST' ), ( 
		   '066', 'PSYCHOTHERAPIST' ), ( 
		   '067', 'PSYCHOTHERAPIST, ADULT' ), ( 
		   '068', 'PSYCHOTHERAPIST, CHILD/ADOL' ), ( 
		   '069', 'PT ASSISTANT' ), ( 
		   '070', 'RADIATION THERAPIST' ), ( 
		   '071', 'RADIOLOGY TECHNICIAN' ), ( 
		   '072', 'RECREATIONAL THERAPIST' ), ( 
		   '073', 'REGISTERED NURSE' ), ( 
		   '074', 'REHAB ASSISTANT' ), ( 
		   '075', 'REHAB THERAPIST' ), ( 
		   '076', 'REIKI' ), ( 
		   '077', 'RESIDENT' ), ( 
		   '078', 'RESOURCE' ), ( 
		   '079', 'RESPIRATORY THERAPIST' ), ( 
		   '080', 'SOCIAL WORKER' ), ( 
		   '081', 'SPEECH PATHOLOGIST CERTIFIED' ), ( 
		   '082', 'STUDENT' ), ( 
		   '083', 'SURG TECH' ), ( 
		   '084', 'SURGEON ASSISTANT' ), ( 
		   '085', 'THERAPEUTIC AQUATIC SPECIALIST' ), ( 
		   '086', 'ULTRASOUND TECHNICIAN' ), ( 
		   '888', 'OTHER' ), ( 
		   '999', 'UNKNOWN' );
	PRINT 'PROVIDER_TYPE_LU - Complete';
END;

/*****************************************
PT_LOC_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PT_LOC_LU') IS NOT NULL
BEGIN
	PRINT 'PT_LOC_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PT_LOC_LU - Creating';
	CREATE TABLE PT_LOC_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_PT_LOC_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PT_LOC_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'I', 'Inpatient' ), ( 
		   'O', 'Outpatient' ), ( 
		   'E', 'Emergency Department' ), ( 
		   'H', 'Home' ), ( 
		   'U', 'Unknown or missing' );
	PRINT 'PT_LOC_LU - Complete';
END;

/*****************************************
PX_CODETYPE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PX_CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'PX_CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PX_CODETYPE_LU - Creating';
	CREATE TABLE PX_CODETYPE_LU
	( 
				 ABBREVIATION nchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_PX_CODETYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PX_CODETYPE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '09', 'ICD-9-CM' ), ( 
		   '10', 'ICD-10-CM' ), ( 
		   '11', 'ICD-11-CM' ), ( 
		   'C4', 'CPT-4' ), ( 
		   'H4', 'HCPCS-4' ), ( 
		   'RV', 'Revenue code' ), ( 
		   'LO', 'Local homegrown' ), ( 
		   'OT', 'Other' );
	PRINT 'PX_CODETYPE_LU - Complete';
END;

/*****************************************
RACE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('RACE_LU') IS NOT NULL
BEGIN
	PRINT 'RACE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'RACE_LU - Creating';
	CREATE TABLE RACE_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(75) NOT NULL, 
				 CONSTRAINT [PK_RACE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO RACE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'HP', 'Native Hawaiian or Other Pacific Islander' ), ( 
		   'IN', 'American Indian/Alaska Native' ), ( 
		   'AS', 'Asian' ), ( 
		   'BA', 'Black or African American' ), ( 
		   'WH', 'White' ), ( 
		   'MU', 'More than one race, particular races unknown or not reported' ), ( 
		   'UN', 'Unknown or Not Reported' );
	PRINT 'RACE_LU - Complete';
END;

/*****************************************
RESULT_LOC_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('RESULT_LOC_LU') IS NOT NULL
BEGIN
	PRINT 'RESULT_LOC_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'RESULT_LOC_LU - Creating';
	CREATE TABLE RESULT_LOC_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_RESULT_LOC_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO RESULT_LOC_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'L', 'Lab' ), ( 
		   'P', 'Point of Care' );
	PRINT 'RESULT_LOC_LU - Complete';
END;

/*****************************************
RX_BASIS_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('RX_BASIS_LU') IS NOT NULL
BEGIN
	PRINT 'RX_BASIS_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'RX_BASIS_LU - Creating';
	CREATE TABLE RX_BASIS_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_RX_BASIS_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO RX_BASIS_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '01', 'Order to Dispense' ), ( 
		   '02', 'Order to Administer' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
	PRINT 'RX_BASIS_LU - Complete';
END;

/*****************************************
RX_FREQUENCY_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('RX_FREQUENCY_LU') IS NOT NULL
BEGIN
	PRINT 'RX_FREQUENCY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'RX_FREQUENCY_LU - Creating';
	CREATE TABLE RX_FREQUENCY_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_RX_FREQUENCY_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO RX_FREQUENCY_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   '01', 'Every day' ), ( 
		   '02', 'Two times a day (BID)' ), ( 
		   '03', 'Three times a day (TID)' ), ( 
		   '04', 'Four times a day (QID)' ), ( 
		   '05', 'Every morning' ), ( 
		   '06', 'Every afternoon' ), ( 
		   '07', 'Before meals' ), ( 
		   '08', 'After meals' ), ( 
		   '09', 'As needed (PRN)' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
	PRINT 'RX_FREQUENCY_LU - Complete';
END;

/*****************************************
RX_QUANTITY_UNIT_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('RX_QUANTITY_UNIT_LU') IS NOT NULL
BEGIN
	PRINT 'RX_QUANTITY_UNIT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'RX_QUANTITY_UNIT_LU - Creating';
	CREATE TABLE RX_QUANTITY_UNIT_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_RX_QUANTITY_UNIT_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO RX_QUANTITY_UNIT_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'PI', 'Pill' ), ( 
		   'TA', 'Tablet' ), ( 
		   'VI', 'Vial' ), ( 
		   'LI', 'Liquid' ), ( 
		   'SO', 'Solution' ), ( 
		   'SU', 'Suspension' ), ( 
		   'OI', 'Ointment' ), ( 
		   'CR', 'Cream' ), ( 
		   'PO', 'Powder' ), ( 
		   'PA', 'Patch' ), ( 
		   'IN', 'Inhaler' ), ( 
		   'KI', 'Kit' ), ( 
		   'DE', 'Device' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
	PRINT 'RX_QUANTITY_UNIT_LU - Complete';
END;

/*****************************************
SEXUALLY_ACTV_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('SEXUALLY_ACTV_LU') IS NOT NULL
BEGIN
	PRINT 'SEXUALLY_ACTV_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'SEXUALLY_ACTV_LU - Creating';
	CREATE TABLE SEXUALLY_ACTV_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_SEXUALLY_ACTV_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO SEXUALLY_ACTV_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'Y', 'Yes' ), ( 
		   'N', 'No' ), ( 
		   'U', 'Unknown, missing' ), ( 
		   'X', 'Not asked' ), ( 
		   'W', 'Not Currently (Was)' );
	PRINT 'SEXUALLY_ACTV_LU - Complete';
END;

/*****************************************
SPECIMEN_SOURCE_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('SPECIMEN_SOURCE_LU') IS NOT NULL
BEGIN
	PRINT 'SPECIMEN_SOURCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'SPECIMEN_SOURCE_LU - Creating';
	CREATE TABLE SPECIMEN_SOURCE_LU
	( 
				 ABBREVIATION nvarchar(6) NOT NULL, 
				 DESCRIPTION nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_SPECIMEN_SOURCE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO SPECIMEN_SOURCE_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'BLOOD', 'BLOOD' ), ( 
		   'SERUM', 'SERUM' ), ( 
		   'PLASMA', 'PLASMA' ), ( 
		   'SR_PLS', 'serum/plasma' ), ( 
		   'PPP', 'Platelet Poor Plasma' ), ( 
		   'CSF', 'cerebral spinal fluid' ), ( 
		   'URINE', 'URINE' ), ( 
		   'STOOL', 'STOOL' ), ( 
		   'NSWAB', 'nasal swab. Any specimen source in your data listed as "nose" should be mapped to "nasal swab"' ), ( 
		   'NWASH', 'nasal wash' ), ( 
		   'NPH', 'nasopharyngeal swab' ), ( 
		   'NPWASH', 'nasopharyngeal wash' ), ( 
		   'THRT', 'throat, oropharyngeal swab' ), ( 
		   'SPUTUM', 'SPUTUM' ), ( 
		   'BAL', 'bronchoalveolar lavage (BAL) specimen' ), ( 
		   'BALBX', 'BAL biopsy' ), ( 
		   'OTHER', 'OTHER' ), ( 
		   ' ', 'missing value' ), ( 
		   'NS', 'not specified' );
	PRINT 'SPECIMEN_SOURCE_LU - Complete';
END;

/*****************************************
STAT_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('STAT_LU') IS NOT NULL
BEGIN
	PRINT 'STAT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'STAT_LU - Creating';
	CREATE TABLE STAT_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_STAT_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO STAT_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'E', 'Expedite' ), ( 
		   'S', 'Stat' ), ( 
		   'R', 'Routine' ), ( 
		   'U', 'Unknown or missing' );
	PRINT 'STAT_LU - Complete';
END;

/*****************************************
TOBACCO_USER_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('TOBACCO_USER_LU') IS NOT NULL
BEGIN
	PRINT 'TOBACCO_USER_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'TOBACCO_USER_LU - Creating';
	CREATE TABLE TOBACCO_USER_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(75) NOT NULL, 
				 CONSTRAINT [PK_TOBACCO_USER_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO TOBACCO_USER_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'Y', 'Yes / Current (everyday tobacco use)' ), ( 
		   'N', 'Never (never smoked or used any kind of tobacco and not SHS exposes)' ), ( 
		   'U', 'Unknown, missing' ), ( 
		   'X', 'Not asked' ), ( 
		   'Q', 'Quit / Former' ), ( 
		   'P', 'Passive /Environmental / Second-hand (never smoked)' ), ( 
		   'I', 'Infrequent (current someday smoking or tobacco use)' );
	PRINT 'TOBACCO_USER_LU - Complete';
END;

/*****************************************
YNQXU_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('YNQXU_LU') IS NOT NULL
BEGIN
	PRINT 'YNQXU_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'YNQXU_LU - Creating';
	CREATE TABLE YNQXU_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_YNQXU_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO YNQXU_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'Y', 'Yes' ), ( 
		   'N', 'No' ), ( 
		   'U', 'Unknown, missing' ), ( 
		   'X', 'Not asked' ), ( 
		   'Q', 'Quit / Former' );
	PRINT 'YNQXU_LU - Complete';
END;

/*****************************************
YNU_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('YNU_LU') IS NOT NULL
BEGIN
	PRINT 'YNU_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'YNU_LU - Creating';
	CREATE TABLE YNU_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_YNU_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO YNU_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'Y', 'Yes' ), ( 
		   'N', 'No' ), ( 
		   'U', 'Unknown' );
	PRINT 'YNU_LU - Complete';
END;

/*****************************************
YNXU_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('YNXU_LU') IS NOT NULL
BEGIN
	PRINT 'YNXU_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'YNXU_LU - Creating';
	CREATE TABLE YNXU_LU
	( 
				 ABBREVIATION nchar NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT PK_YNXU_LU PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO YNXU_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'Y', 'Yes' ), ( 
		   'N', 'No' ), ( 
		   'U', 'Unknown, missing' ), ( 
		   'X', 'Not asked' );
	PRINT 'YNXU_LU - Complete';
END;

/*****************************************
LANGUAGES_ISO_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('LANGUAGES_ISO_LU') IS NOT NULL
BEGIN
	PRINT 'LANGUAGES_ISO_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'LANGUAGES_ISO_LU - Creating';
	CREATE TABLE LANGUAGES_ISO_LU
	( 
				 [ISO_639-2_CODE] nvarchar(3) NOT NULL, 
				 ENGLISH_DESCRIPTION nvarchar(200) NOT NULL, CONSTRAINT [PK_LANGUAGES_ISO_LU] PRIMARY KEY CLUSTERED([ISO_639-2_CODE] ASC)
	)
	ON [PRIMARY];
	INSERT INTO LANGUAGES_ISO_LU( 
		[ISO_639-2_CODE], 
		ENGLISH_DESCRIPTION )
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
		   'zza', 'Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki' ), (
		   'aar', 'Afar'), (
		   'abk', 'Abkhazian'), (
		   'ace', 'Achinese'), (
		   'ach', 'Acoli'), (
		   'ada', 'Adangme'), (
		   'ady', 'Adyghe; Adygei'), (
		   'afa', 'Afro-Asiatic languages'), (
		   'afh', 'Afrihili'), (
		   'afr', 'Afrikaans'), (
		   'ain', 'Ainu'), (
		   'aka', 'Akan'), (
		   'sqi', 'Albanian'), (
		   'hye', 'Armenian'), (
		   'eus', 'Basque'), (
		   'bod', 'Tibetan'), (
		   'mya', 'Burmese'), (
		   'ces', 'Czech'), (
		   'zho', 'Chinese'), (
		   'cym', 'Welsh'), (
		   'deu', 'German'), (
		   'nld', 'Dutch; Flemish'), (
		   'ell', 'Greek, Modern (1453-)'), (
		   'fas', 'Persian'), (
		   'fra', 'French'), (
		   'kat', 'Georgian'), (
		   'isl', 'Icelandic'), (
		   'mkd', 'Macedonian'), (
		   'mri', 'Maori'), (
		   'msa', 'Malay'), (
		   'ron', 'Romanian; Moldavian; Moldovan'), (
		   'slk', 'Slovak');
END;

/*****************************************
GENDER_IDENTITY_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('GENDER_IDENTITY_LU') IS NOT NULL
BEGIN
	PRINT 'GENDER_IDENTITY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'GENDER_IDENTITY_LU - Creating';
	CREATE TABLE GENDER_IDENTITY_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_GENDER_IDENTITY_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO GENDER_IDENTITY_LU( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'M', 'MAN' ), ( 
		   'F', 'WOMAN' ), ( 
		   'TM', 'TRANSGENDER MALE (FEMALE TO MALE)' ), ( 
		   'TF', 'TRANSGENDER FEMALE (MALE TO FEMALE)' ), ( 
		   'GW', 'GENDER QUEER' ), ( 
		   'SE', 'SOMETHING ELSE' ), ( 
		   'MU', 'MULTIPLE GENDER CATEGORIES' ), ( 
		   'DC', 'DECLINED TO ANSWER' ), ( 
		   'NI', 'NO INFORMATION' ), ( 
		   'UN', 'UNKNOWN' ), ( 
		   'OT', 'OTHER' );
		   
	PRINT 'GENDER_IDENTITY_LU - Complete';
END;

/*****************************************
SEXUAL_ORIENTATION
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('SEXUAL_ORIENTATION_LU') IS NOT NULL
BEGIN
	PRINT 'SEXUAL_ORIENTATION_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'SEXUAL_ORIENTATION_LU - Creating';
	CREATE TABLE SEXUAL_ORIENTATION_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_SEXUAL_ORIENTATION_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO SEXUAL_ORIENTATION_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'AS', 'ASEXUAL' ), ( 
		   'BI', 'BISEXUAL' ), ( 
		   'GA', 'GAY' ), ( 
		   'LE', 'LESBIAN' ), ( 
		   'QU', 'QUEER' ), ( 
		   'QS', 'QUESTIONING' ), ( 
		   'ST', 'STRAIGHT' ), ( 
		   'SE', 'SOMETHING ELSE' ), ( 
		   'MU', 'MULTIPLE SEXUAL ORIENTATIONS' ), ( 
		   'DC', 'DECLINED TO ANSWER' ), ( 
		   'NI', 'NO INFORMATION' ), (
		   'UN', 'UNKNOWN' ), ( 
		   'OT', 'UNKNOWN' );
		   
	PRINT 'SEXUAL_ORIENTATION_LU - Complete';
END;

/*****************************************
PROVIDER_SPECIALTY_LU
Changes:
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PROVIDER_SPECIALTY_LU') IS NOT NULL
BEGIN
	PRINT 'PROVIDER_SPECIALTY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PROVIDER_SPECIALTY_LU - Creating';
	CREATE TABLE PROVIDER_SPECIALTY_LU
	( 
				 SPECIALTY nvarchar(3) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_PROVIDER_SPECIALTY_LU] PRIMARY KEY CLUSTERED([SPECIALTY] ASC)
	)
	ON [PRIMARY];
	INSERT INTO PROVIDER_SPECIALTY_LU( 
		SPECIALTY, 
		DESCRIPTION )
	VALUES( 	
		   'ADO', 'Adolescent Medicine' ), ( 
		   'AER', 'Aerospace Medicine' ), ( 
		   'ALC', 'Chemical Dependency' ), ( 
		   'ALL', 'Allergy' ), (  
		   'ANC', 'Ancillary Services' ), ( 
		   'ANE', 'Anesthesiology' ), ( 
		   'ATH', 'Sports Medicine' ), (           
		   'AUD', 'Audiology' ), ( 
		   'BON', 'Bone And Mineral' ), ( 
		   'CAR', 'Cardiology' ), ( 
		   'CAV', 'Cardiovascular Surgery' ), (           
		   'CHR', 'Chiropractor' ), ( 
		   'CLC', 'Clinical Cardiac Electrophysiology' ), (   
		   'COL', 'Colon & Rectal Surgery' ), ( 
		   'COM', 'Complimentary & Alternative Medicine' ), ( 
		   'CON', 'Continuing Care' ), ( 
		   'CRI', 'Critical Care' ), ( 
		   'DEN', 'Dentistry' ), ( 
		   'DER', 'Dermatology' ), ( 
		   'DOR', 'D.O.R.' ), ( 
		   'EDU', 'Medical Education' ), ( 
		   'EME', 'Emergency Medicine' ), ( 
		   'EMI', 'EMI' ), ( 
		   'END', 'Endocrinology' ), ( 
		   'ENT', 'Otolaryngology' ), ( 
		   'FAM', 'Family Medicine' ), ( 
		   'FLX', 'Flexible' ), ( 
		   'GAS', 'Gastroenterology' ), ( 
		   'GEN', 'Genetics' ), (                     
		   'GER', 'Gerontology' ), (                               
		   'HAN', 'Hand Surgery' ), (                       
		   'HOM', 'Home Health' ), ( 
		   'HOS', 'Hospital' ), ( 
		   'HYM', 'Hyperbaric Medicine' ), ( 
		   'HYP', 'Hypertension' ), ( 
		   'IMG', 'General Internal Medicine' ), ( 
		   'INF', 'Infectious Disease' ), ( 
		   'LAB', 'Laboratory' ), ( 
		   'MEN', 'Mental Health' ), ( 
		   'MGM', 'Care Management' ), ( 
		   'MID', 'Midlevel' ), ( 
		   'MUL', 'Multispecialty' ), ( 
		   'NEH', 'Nephrology' ), ( 
		   'NEO', 'Neonatology' ), (                      
		   'NES', 'Neurosurgery' ), ( 
		   'NEU', 'Neurology' ), ( 
		   'NOB', 'No Boards' ), (                    
		   'NUM', 'Nuclear Medicine' ), (                 
		   'NUR', 'Nurse' ), ( 
		   'NUT', 'Nutrition' ), ( 
		   'OBO', 'Gynecologic Oncology' ), ( 
		   'OBS', 'Obstetrics – Gynecology' ), ( 
		   'OCM', 'Occupational Health' ), ( 
		   'ONC', 'Oncology' ), ( 
		   'ONS', 'Surgical Oncology' ), ( 
		   'OPH', 'Ophthalmology' ), ( 
		   'OPL', 'Optical' ), ( 
		   'OPT', 'Optometry' ), ( 
		   'ORA', 'Oral Surgery' ), ( 
		   'ORD', 'Orthodontia' ), ( 
		   'ORT', 'Orthopedics' ), ( 
		   'OTO', 'Otolaryngology' ), ( 
		   'PAI', 'Pain Management' ), ( 
		   'PAT', 'Pathology' ), ( 
		   'PED', 'Pediatrics' ), ( 
		   'PES', 'Pediatric Subspecialty' ), ( 
		   'PEY', 'Perinatology' ), (                       
		   'PHA', 'Pharmacy' ), ( 
		   'PHT', 'Physical Therapy' ), ( 
		   'PHY', 'Physiatry' ), ( 
		   'PLA', 'Plastic Surgery' ), ( 
		   'POD', 'Podiatry' ), ( 
		   'PRE', 'Preventive Medicine' ), (                
		   'PRO', 'Prosthodontia' ), ( 
		   'PSY', 'Psychiatry' ), ( 
		   'PUB', 'Public Health' ), (                      
		   'PUL', 'Pulmonary Medicine' ), ( 
		   'RAD', 'Radiology' ), ( 
		   'REH', 'Rehabilitation Medicine' ), ( 
		   'RES', 'Respiratory Therapy' ), ( 
		   'RHE', 'Rheumatology' ), ( 
		   'ROP', 'Radiation Oncology' ), ( 
		   'SLC', 'Sleep Center' ), ( 
		   'SOC', 'Social Services' ), ( 
		   'SPP', 'Speech Pathology' ), ( 
		   'SUR', 'Surgery' ), ( 
		   'TEE', 'Teen Clinic' ), ( 
		   'TOX', 'Medical Toxicology' ), (       
		   'TRN', 'Transportation/Non-Emergency' ), ( 
		   'TRS', 'Transplant Surgery' ), ( 
		   'UNK', 'Unknown' ), ( 
		   'URG', 'Urgent Care' ), (                  
		   'URO', 'Urology' ), ( 
		   'VAS', 'Vascular Surgery' );
		   
	PRINT 'PROVIDER_SPECIALTY_LU - Complete';
END;

/*****************************************
PRO_SURVEY_LU
Changes: New Summer 2019
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PRO_SURVEY_LU') IS NOT NULL
BEGIN
	PRINT 'PRO_SURVEY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PRO_SURVEY_LU - Creating';
	CREATE TABLE PRO_SURVEY_LU
	( 
				 ABBREVIATION nvarchar(15) NOT NULL, 
				 DESCRIPTION nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_PRO_SURVEY_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PRO_SURVEY_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'PHQ', 'Patient Health Questionnaire' ), ( 
		   'GAD', 'General Anxiety Disorder' ), ( 
		   'EPDS', 'Edinburgh Postnatal Depression Scale' ), ( 
		   'AHC-HRSN', 'Accountable Health Communities Health-Related Social Needs' ), ( 
		   'PRAPARE', 'Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
		   
	PRINT 'PRO_SURVEY_LU - Complete';
END;

/*****************************************
PRO_SURVEY_TYPE_LU
Changes: New Summer 2019
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('PRO_SURVEY_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'PRO_SURVEY_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'PRO_SURVEY_TYPE_LU - Creating';
	CREATE TABLE PRO_SURVEY_TYPE_LU
	( 
				 ABBREVIATION nvarchar(15) NOT NULL, 
				 DESCRIPTION nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_PRO_SURVEY_TYPE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO PRO_SURVEY_TYPE_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'PHQ-2', 'Patient Health Questionnaire-2' ), ( 
		   'PHQ-4', 'Patient Health Questionnaire-4' ), ( 
		   'PHQ-9', 'Patient Health Questionnaire-9' ), ( 
		   'PHQ-A', 'Patient Health Questionnaire-9 Modified for Adolescents' ), ( 
		   'GAD-2', 'Generalized Anxiety Disorder 2-item' ), (
		   'GAD-7', 'Generalized Anxiety Disorder 7-item' ), ( 
		   'EPDS', 'Edinburgh Postnatal Depression Scale' ), ( 
		   'AHC-HRSN', 'Accountable Health Communities Health-Related Social Needs' ), ( 
		   'PRAPARE', 'Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
		   
	PRINT 'PRO_SURVEY_TYPE_LU - Complete';
END;

/*****************************************
QUESTION_DOMAIN_LU
Changes: New Summer 2019
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('QUESTION_DOMAIN_LU') IS NOT NULL
BEGIN
	PRINT 'QUESTION_DOMAIN_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'QUESTION_DOMAIN_LU - Creating';
	CREATE TABLE QUESTION_DOMAIN_LU
	( 
				 ABBREVIATION nvarchar(36) NOT NULL, 
				 DESCRIPTION nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_QUESTION_DOMAIN_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO QUESTION_DOMAIN_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'FOOD_INSECURITY', 'Food Insecurity' ), ( 
		   'HOUSING_INSTABILITY', 'Housing Instability' ), ( 
		   'BEHAVIORAL_HEALTH', 'Behavioral Health' );
		   
	PRINT 'QUESTION_DOMAIN_LU - Complete';
END;

/*****************************************
RESPONSE_SOURCE_LU
Changes: New Summer 2019
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('RESPONSE_SOURCE_LU') IS NOT NULL
BEGIN
	PRINT 'RESPONSE_SOURCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'RESPONSE_SOURCE_LU - Creating';
	CREATE TABLE RESPONSE_SOURCE_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_RESPONSE_SOURCE_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO RESPONSE_SOURCE_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'PT', 'Patient' ), ( 
		   'PR', 'Parent' ), ( 
		   'PX', 'Proxy' ), ( 
		   'LG', 'Legal Guardian' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
		   
	PRINT 'RESPONSE_SOURCE_LU - Complete';
END;

/*****************************************
SURVEY_ADMINISTERED_BY_LU
Changes: New Summer 2019
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('SURVEY_ADMINISTERED_BY_LU') IS NOT NULL
BEGIN
	PRINT 'SURVEY_ADMINISTERED_BY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'SURVEY_ADMINISTERED_BY_LU - Creating';
	CREATE TABLE SURVEY_ADMINISTERED_BY_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_SURVEY_ADMINISTERED_BY_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO SURVEY_ADMINISTERED_BY_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'MD', 'Physician' ), ( 
		   'PA', 'Physician Assistant' ), ( 
		   'RN', 'Nurse' ), ( 
		   'MA', 'Medical Assistant' ), ( 
		   'HC', 'Health Care Partner' ), ( 
		   'PN', 'Patient Navigator' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
		   
	PRINT 'SURVEY_ADMINISTERED_BY_LU - Complete';
END;

/*****************************************
MEDIUM_LU
Changes: New Summer 2019
*****************************************/
PRINT '-----------------------------------------------------'
IF OBJECT_ID('MEDIUM_LU') IS NOT NULL
BEGIN
	PRINT 'MEDIUM_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'MEDIUM_LU - Creating';
	CREATE TABLE MEDIUM_LU
	( 
				 ABBREVIATION nvarchar(2) NOT NULL, 
				 DESCRIPTION nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_MEDIUM_LU] PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
	)
	ON [PRIMARY];
	INSERT INTO MEDIUM_LU ( 
		ABBREVIATION, 
		DESCRIPTION )
	VALUES( 
		   'PA', 'Paper' ), ( 
		   'EC', 'Electronic (includes personal or tablet computer, web kiosks, smartphone)' ), ( 
		   'PH', 'Telephonic' ), ( 
		   'IV', 'Telephonic with interactive voice response (IVR) technology' ), ( 
		   'NI', 'No information' ), ( 
		   'UN', 'Unknown' ), ( 
		   'OT', 'Other' );
		   
	PRINT 'MEDIUM_LU - Complete';
END;