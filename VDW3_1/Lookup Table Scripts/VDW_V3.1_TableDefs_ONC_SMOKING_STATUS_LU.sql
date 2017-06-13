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