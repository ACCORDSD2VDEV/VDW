/*TABLEREPLACEMENTINFILE*/
/*****************************************************************************
Script for validating data contained in individual fields. It will create a number
of temporary tables then validate a field in the VDW against the values from the 
temporary tables.  If the value does not exist as expected, it gets added to the 
#ChordsValueResults table where it will be displayed in the output.  SQL Server 
by default will ignore case.

Most of the tables are based on the the DDL Lookup Tables script.  

To update the script for partner use:

1) Copy each of the Lookup table creation and insert statements into the
    TempTable Lookup Value Creation section below.  Delete the primary key 
    constraint statement and any "ON [PRIMARY]" statements.  Don't copy
    any PRINT statements

2) Update the DataValidation table section to add the TargetTable, TargetColumn, 
    RefTable, RefColumn to create the mapping of values to table.  
*****************************************************************************/

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

CREATE TABLE #CHORDSValueResults
( 
	TargetTable varchar(250),
	TargetColumn varchar(250),
	UnexpectedValue varchar(250)
);

/*****************************************************************************
BEGIN TempTable Lookup Value creation
*****************************************************************************/
CREATE TABLE #ABN_IND_LU
(
	ABBREVIATION NVARCHAR(2) NOT NULL,
	DESCRIPTION  NVARCHAR(50) NOT NULL,
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ABN_IND_LU
(
	ABBREVIATION,
	DESCRIPTION
)
VALUES      (
       'AB', 'abnormal'), (
       'C', 'critical'), (
       'AH', 'abnormal high'), (
       'CH', 'critical high'), (
       'AL', 'abnormal low'), (
       'CL', 'critical low'), (
       'IN', 'inconclusive'), (
       'UK', 'unknown'), (
       'NL', 'normal');

CREATE TABLE #ADMITTING_SOURCE_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ADMITTING_SOURCE_LU( 
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

CREATE TABLE #BENEFIT_TYPE_LU
( 
	ABBREVIATION nchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #BENEFIT_TYPE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'CU', 'Current insurance or benefit information' ), (
	   'EN', 'Enrollment insurance or benefit information' ), ( 
	   'PR', 'Primary payer on claim or encounter' ), ( 
	   'PA', 'Payer on claim with unknown rank or order' ), ( 
	   'SR', 'Self-reported insurance or benefit' ), (
	   'NI', 'No benefit information availible' );

CREATE TABLE #BENEFIT_CAT_LU
( 
	ABBREVIATION nchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #BENEFIT_CAT_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'CC', 'Correctional Care' ), (
	   'CO', 'Commercial/Private Insurance' ), ( 
	   'CP', 'Children''s  Healthcare Insurance Program' ), ( 
	   'MC', 'Medicare' ), ( 
	   'MD', 'Medicaid' ), (
	   'OG', 'Other Government' ), (
	   'SP', 'Self-Pay/Uninsured/Private Pay' ), (
	   'OT', 'Other Insurance' ), (
	   'UN', 'Unknown Insurance'), (
	   'WC', 'Workers Compensation'), (
	   'NI', 'No Benefit Information Available');

CREATE TABLE #BP_TYPE_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #BP_TYPE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   N'R', N'Rooming' ), ( 
	   N'O', N'Orthostatic' ), ( 
	   N'M', N'Multiple' ), ( 
	   N'E', N'Extended' );

CREATE TABLE #CAUSETYPE_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #CAUSETYPE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'I', 'Immediate/Primary' ), ( 
	   'U', 'Underlying' ), ( 
	   'C', 'Contributory' ), ( 
	   'O', 'Other' );

CREATE TABLE #ADDRESS_TYPE_CODE_LU
( 
	ABBREVIATION nchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ADDRESS_TYPE_CODE_LU( 
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

CREATE TABLE #CODETYPE_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #CODETYPE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'C', 'CPT' ), ( 
	   'I', 'ICD9' ), ( 
	   'H', 'HCPCS' ), ( 
	   'L', 'local home-grown' ), ( 
	   'O', 'other' );

CREATE TABLE #CONFIDENCE_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #CONFIDENCE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'E', 'Excellent' ), ( 
	   'F', 'Fair' ), ( 
	   'P', 'Poor' ), (
	   'U', 'Unknown');

CREATE TABLE #DEPARTMENT_LU
( 
	ABBREVIATION nvarchar(4) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #DEPARTMENT_LU( 
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

CREATE TABLE #DISCHARGE_DISPOSITION_LU
( 
	ABBREVIATION nchar NOT NULL,
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #DISCHARGE_DISPOSITION_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'A', 'Alive' ), ( 
	   'E', 'Expired' ), ( 
	   'U', 'Unknown' );

CREATE TABLE #DISCHARGE_STATUS_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #DISCHARGE_STATUS_LU( 
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

CREATE TABLE #DTIMPUTE_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #DTIMPUTE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'M', 'Month of date imputed' ), ( 
	   'D', 'Day of date imputed' ), ( 
	   'B', 'Both month and day imputed' ), ( 
	   'N', 'Not imputed' );

CREATE TABLE #DX_CODETYPE_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #DX_CODETYPE_LU( 
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

CREATE TABLE #DX_ORIGIN_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #DX_ORIGIN_LU( 
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

CREATE TABLE #ENCOUNTER_SUBTYPE_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(100) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ENCOUNTER_SUBTYPE_LU( 
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

CREATE TABLE #ENCTYPE_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(500) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ENCTYPE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'IP', 'Acute Inpatient Hospital Stay: Inpatient stays, same-day hospital discharges, hospital transfers where the patient was admitted into the hospital. Includes acute inpatient psych and detox hospital stays. [ENCOUNTER_SUBTYPE = AI]' ), ( 
	   'ED', 'Emergency Department Encounter: Excludes urgent care visits. [ENCOUNTER_SUBTYPE = HA,OC]' ), ( 
	   'AV', 'Ambulatory Visit: Outpatient clinics, same day surgeries, observation beds, urgent care visits, and other same-day ambulatory hospital encounters. Excludes emergency department encounters). [ENCOUNTER_SUBTYPE = OC, OB, SD, HA, UC, RH, DI, OT]' ), ( 
	   'TE', 'Telephone Encounters: [ENCOUNTER_SUBTYPE = OT, HH]' ), ( 
	   'EM', 'E-mail Encounters: [ENCOUNTER_SUBTYPE = OT, HH]' ), ( 
	   'IS', 'Non-Acute Institutional Stays: Hospice, SNF, rehab, nursing home, residential, overnight non-hospital dialysis and other non-hospital stays. [ENCOUNTER_SUBTYPE = HS, SN, NH, RH,DI, OT]' ), ( 
	   'OE', 'OE=Other Encounters (not overnight): Hospice visits, home health visits, SNF visits, other non-hospital visits. [ENCOUNTER_SUBTYPE = HS, HH, SN, RH, DI, OT]' ), ( 
	   'LO', 'Lab Only Encounter: Optional. Lab encounters that cannot be matched to another encounter. Include to link variables from ENCOUNTER table to the PROCEDURES table. [ENCOUNTER_SUBTYPE = OC,OT]' ), ( 
	   'RO', 'Radiology Only Encounter: Optional. Radiology encounter that cannot be matched to another encounter. Include to link variables from utilization file to procedure file. [ENCOUNTER_SUBTYPE = OC,OT]' );

CREATE TABLE #ENROLLMENT_BASIS_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ENROLLMENT_BASIS_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'G', 'Geographic Basis' ), ( 
	   'I', 'Insurance Basis' ), ( 
	   'B', 'Both Insurance and Geographic bases' ), ( 
	   'P', 'Non-enrollee Patient' ), (
	   'U', 'Unknown');

CREATE TABLE #GENDER_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(25) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #GENDER_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'F', 'Female' ), ( 
	   'M', 'Male' ), ( 
	   'U', 'Unknown' ), ( 
	   'O', 'Other' );

CREATE TABLE #LANG_USAGE_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #LANG_USAGE_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'S', 'Spoken (or signed)' ), ( 
	   'W', 'Written' ), ( 
	   'B', 'Both spoken and written' ), ( 
	   'U', 'Unknown' );

CREATE TABLE #MODIFIER_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #MODIFIER_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'TX', 'text' ), ( 
	   'EQ', 'equal' ), ( 
	   'LT', 'less than' ), ( 
	   'LE', 'less than or equal to' ), ( 
	   'GT', 'greater than' ), ( 
	   'GE', 'greater than or equal to' );

CREATE TABLE #ONC_SMOKING_STATUS_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #ONC_SMOKING_STATUS_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   '1', 'current every day smoker' ), ( 
	   '2', 'current some day smoker' ), ( 
	   '3', 'former smoker' ), ( 
	   '4', 'never smoker' ), ( 
	   '5', 'smoker, current status unknown' ), ( 
	   '6', 'unknown if ever smoked' );

CREATE TABLE #POSITION_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #POSITION_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   '1', 'Sitting' ), ( 
	   '2', 'Standing' ), ( 
	   '3', 'Supine' );

CREATE TABLE #PRIMARY_DX_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #PRIMARY_DX_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'P', 'Primary Dx' ), ( 
	   'S', 'Not Primary Dx' ), ( 
	   'X', 'Primary Dx Status not classifiable' );

CREATE TABLE #PRINCIPAL_DX_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #PRINCIPAL_DX_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'P', 'Principal Dx' ), ( 
	   'N', 'Not Principal Dx' ), ( 
	   'X', 'Principal Dx Status not classifiable' );

CREATE TABLE #PROVIDER_TYPE_LU
( 
	ABBREVIATION nvarchar(3) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #PROVIDER_TYPE_LU( 
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

CREATE TABLE #PT_LOC_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #PT_LOC_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'I', 'Inpatient' ), ( 
	   'O', 'Outpatient' ), ( 
	   'E', 'Emergency Department' ), ( 
	   'H', 'Home' ), ( 
	   'U', 'Unknown or missing' );

CREATE TABLE #PX_CODETYPE_LU
( 
	ABBREVIATION nchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #PX_CODETYPE_LU( 
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

CREATE TABLE #RACE_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(75) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #RACE_LU( 
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

CREATE TABLE #RESULT_LOC_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #RESULT_LOC_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'L', 'Lab' ), ( 
	   'P', 'Point of Care' );

CREATE TABLE #RX_BASIS_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #RX_BASIS_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   '01', 'Order to Dispense' ), ( 
	   '02', 'Order to Administer' ), ( 
	   'NI', 'No information' ), ( 
	   'UN', 'Unknown' ), ( 
	   'OT', 'Other' );

CREATE TABLE #RX_FREQUENCY_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #RX_FREQUENCY_LU( 
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

CREATE TABLE #RX_QUANTITY_UNIT_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #RX_QUANTITY_UNIT_LU( 
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

CREATE TABLE #SEXUALLY_ACTV_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #SEXUALLY_ACTV_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'Y', 'Yes' ), ( 
	   'N', 'No' ), ( 
	   'U', 'Unknown, missing' ), ( 
	   'X', 'Not asked' ), ( 
	   'W', 'Not Currently (Was)' );

CREATE TABLE #SPECIMEN_SOURCE_LU
( 
	ABBREVIATION nvarchar(6) NOT NULL, 
	DESCRIPTION nvarchar(100) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #SPECIMEN_SOURCE_LU( 
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

CREATE TABLE #STAT_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #STAT_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'E', 'Expedite' ), ( 
	   'S', 'Stat' ), ( 
	   'R', 'Routine' ), ( 
	   'U', 'Unknown or missing' );

CREATE TABLE #TOBACCO_USER_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(75) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #TOBACCO_USER_LU( 
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

CREATE TABLE #YNQXU_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #YNQXU_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'Y', 'Yes' ), ( 
	   'N', 'No' ), ( 
	   'U', 'Unknown, missing' ), ( 
	   'X', 'Not asked' ), ( 
	   'Q', 'Quit / Former' );

CREATE TABLE #YNU_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #YNU_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'Y', 'Yes' ), ( 
	   'N', 'No' ), ( 
	   'U', 'Unknown' );

CREATE TABLE #YNXU_LU
( 
	ABBREVIATION nchar NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #YNXU_LU( 
	ABBREVIATION, 
	DESCRIPTION )
VALUES( 
	   'Y', 'Yes' ), ( 
	   'N', 'No' ), ( 
	   'U', 'Unknown, missing' ), ( 
	   'X', 'Not asked' );

CREATE TABLE #LANGUAGES_ISO_LU
( 
	[ISO_639-2_CODE] nvarchar(3) NOT NULL, 
	ENGLISH_DESCRIPTION nvarchar(200) NOT NULL
);

INSERT INTO #LANGUAGES_ISO_LU( 
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

CREATE TABLE #GENDER_IDENTITY_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #GENDER_IDENTITY_LU( 
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
	   
CREATE TABLE #SEXUAL_ORIENTATION_LU
( 
	ABBREVIATION nvarchar(2) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL, 
	PRIMARY KEY CLUSTERED(ABBREVIATION ASC)
);

INSERT INTO #SEXUAL_ORIENTATION_LU ( 
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
	   
CREATE TABLE #PROVIDER_SPECIALTY_LU
( 
	SPECIALTY nvarchar(3) NOT NULL, 
	DESCRIPTION nvarchar(50) NOT NULL
);

INSERT INTO #PROVIDER_SPECIALTY_LU( 
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

/*****************************************************************************
END TempTable Lookup Value creation
*****************************************************************************/

/*****************************************************************************
BEGIN DataValidation table creation.  Stores the mapping from one temp table 
to the field in the VDW.
*****************************************************************************/

DECLARE @datavalidation TABLE
(PK           INT IDENTITY(1, 1) PRIMARY KEY,
 TargetTable  VARCHAR(250),
 TargetColumn VARCHAR(250),
 RefTable     VARCHAR(250),
 RefColumn    VARCHAR(250)
);

INSERT INTO @datavalidation
VALUES		(
			'DEMOGRAPHICS',	'PRIMARY_LANGUAGE',	'LANGUAGES_ISO_LU',	'[ISO_639-2_CODE]'), (
			'DEMOGRAPHICS',	'GENDER_IDENTITY',	'GENDER_IDENTITY_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'GENDER',	'GENDER_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'RACE1',	'RACE_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'RACE2',	'RACE_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'RACE3',	'RACE_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'RACE4',	'RACE_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'RACE5',	'RACE_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'SEXUAL_ORIENTATION',	'SEXUAL_ORIENTATION_LU'	,'ABBREVIATION'), (
			'DEMOGRAPHICS',	'NEEDS_INTERPRETER',	'YNU_LU',	'ABBREVIATION'), (
			'DEMOGRAPHICS',	'HISPANIC',	'YNU_LU',	'ABBREVIATION');

INSERT INTO @datavalidation
VALUES		(
			'ENCOUNTERS', 'ADMITTING_SOURCE', 'ADMITTING_SOURCE_LU', 'ABBREVIATION'	), (
			'ENCOUNTERS', 'DEPARTMENT', 'DEPARTMENT_LU', 'ABBREVIATION'	), (
			'ENCOUNTERS', 'DISCHARGE_DISPOSITION', 'DISCHARGE_DISPOSITION_LU', 'ABBREVIATION'	), (
			'ENCOUNTERS', 'DISCHARGE_STATUS', 'DISCHARGE_STATUS_LU', 'ABBREVIATION'	), (
			'ENCOUNTERS', 'ENCOUNTER_SUBTYPE', 'ENCOUNTER_SUBTYPE_LU', 'ABBREVIATION'	), (
			'ENCOUNTERS', 'ENCTYPE', 'ENCTYPE_LU', 'ABBREVIATION');
/*****************************************************************************
END DataValidation table creation.
*****************************************************************************/


/*****************************************************************************
BEGIN Tablename replacement check.  Will update the values in the DataValidation
table if the CHORDS_TABLENAMES table exists. 
*****************************************************************************/

IF OBJECT_ID('CHORDS_TABLENAMES') IS NOT NULL
BEGIN
    UPDATE a
      SET
          a.TargetTable = b.NEW_NAME
    FROM   @datavalidation a
           JOIN CHORDS_TABLENAMES b
                ON b.ORG_NAME = a.TargetTable;
END;

/*****************************************************************************
END Tablename replacement check.
*****************************************************************************/

/*****************************************************************************
BEGIN Table value validation.  Will iterate through the datavalidation table
to generate dyanmic SQL that will validate the values.  If a value if found
that does not exist in the list of acceptable values, the output will be
dispalyed as an unexpected value.
*****************************************************************************/

  
DECLARE @SQL NVARCHAR(3000);
DECLARE @TargetColumn VARCHAR(250);
DECLARE @TargetTable VARCHAR(250);
DECLARE @RefColumn VARCHAR(250);
DECLARE @RefTable VARCHAR(250);
DECLARE @max INT;
DECLARE @counter INT = 1;
	
SELECT
       @max = COUNT(*)
FROM
     @datavalidation;

WHILE @counter < @max
    BEGIN
	   SELECT @TargetTable = TargetTable from @datavalidation where PK = @counter;
	   SELECT  @TargetColumn = TargetColumn from @datavalidation where PK = @counter;
	   SELECT  @RefColumn = RefColumn from @datavalidation where PK = @counter;
	   SELECT  @RefTable = RefTable from @datavalidation where PK = @counter;

	   SET @SQL = 
		  'INSERT INTO #CHORDSValueResults  
		   SELECT ''' + @TargetTable + ''', ''' 
				+ @TargetColumn  + ''', 
				c.TargetColumn 
		   FROM (
				SELECT *
				FROM (
					SELECT DISTINCT ' + @TargetColumn +' as TargetColumn 
					FROM
						' + @TargetTable + '
					) a
				LEFT JOIN (
					SELECT ' + @RefColumn + ' as RefColumn 
					FROM #' + @RefTable + ' ) b 
					ON b.RefColumn = a.TargetColumn
				WHERE b.RefColumn is NULL
		   ) c
		   WHERE c.TargetColumn IS NOT NULL;';
	   EXEC sp_executesql @SQL
	   SET @counter = @counter + 1;
    END;
    
SELECT
       *
FROM
     #CHORDSValueResults;

/*****************************************************************************
END Table value validation.
*****************************************************************************/