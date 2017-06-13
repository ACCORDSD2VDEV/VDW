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
	PRINT 'CHORDS_VDW31_CODETYPE_LU - Creating';
END;