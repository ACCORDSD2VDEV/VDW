IF OBJECT_ID('CHORDS_VDW31_RACE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RACE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RACE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RACE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(75) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RACE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RACE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'HP', N'Native Hawaiian or Other Pacific Islander' ), ( 
		   N'IN', N'American Indian/Alaska Native' ), ( 
		   N'AS', N'Asian' ), ( 
		   N'BA', N'Black or African American' ), ( 
		   N'WH', N'White' ), ( 
		   N'MU', N'More than one race, particular races unknown or not reported' ), ( 
		   N'UN', N'Unknown or Not Reported' );
	PRINT 'CHORDS_VDW31_RACE_LU - Complete';
END;