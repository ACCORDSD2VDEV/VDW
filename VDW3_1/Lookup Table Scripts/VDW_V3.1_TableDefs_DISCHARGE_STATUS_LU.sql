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