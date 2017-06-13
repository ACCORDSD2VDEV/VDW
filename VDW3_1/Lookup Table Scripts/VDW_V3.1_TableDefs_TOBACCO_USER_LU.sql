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