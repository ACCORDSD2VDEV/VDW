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