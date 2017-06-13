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