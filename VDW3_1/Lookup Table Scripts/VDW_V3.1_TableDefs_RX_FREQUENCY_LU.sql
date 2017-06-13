IF OBJECT_ID('CHORDS_VDW31_RX_FREQUENCY_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RX_FREQUENCY_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RX_FREQUENCY_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RX_FREQUENCY_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RX_FREQUENCY_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RX_FREQUENCY_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'01', N'Every day' ), ( 
		   N'02', N'Two times a day (BID)' ), ( 
		   N'03', N'Three times a day (TID)' ), ( 
		   N'04', N'Four times a day (QID)' ), ( 
		   N'05', N'Every morning' ), ( 
		   N'06', N'Every afternoon' ), ( 
		   N'07', N'Before meals' ), ( 
		   N'08', N'After meals' ), ( 
		   N'09', N'As needed (PRN)' ), ( 
		   N'NI', N'No information' ), ( 
		   N'UN', N'Unknown' ), ( 
		   N'OT', N'Other' );
	PRINT 'CHORDS_VDW31_RX_FREQUENCY_LU - Complete';
END;