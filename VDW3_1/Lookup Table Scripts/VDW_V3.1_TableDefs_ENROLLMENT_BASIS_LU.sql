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