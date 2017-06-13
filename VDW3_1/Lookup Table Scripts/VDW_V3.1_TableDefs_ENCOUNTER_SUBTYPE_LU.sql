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