IF OBJECT_ID('CHORDS_VDW31_RX_QUANTITY_UNIT_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_RX_QUANTITY_UNIT_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_RX_QUANTITY_UNIT_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_RX_QUANTITY_UNIT_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_RX_QUANTITY_UNIT_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_RX_QUANTITY_UNIT_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'PI', N'Pill' ), ( 
		   N'TA', N'Tablet' ), ( 
		   N'VI', N'Vial' ), ( 
		   N'LI', N'Liquid' ), ( 
		   N'SO', N'Solution' ), ( 
		   N'SU', N'Suspension' ), ( 
		   N'OI', N'Ointment' ), ( 
		   N'CR', N'Cream' ), ( 
		   N'PO', N'Powder' ), ( 
		   N'PA', N'Patch' ), ( 
		   N'IN', N'Inhaler' ), ( 
		   N'KI', N'Kit' ), ( 
		   N'DE', N'Device' ), ( 
		   N'NI', N'No information' ), ( 
		   N'UN', N'Unknown' ), ( 
		   N'OT', N'Other' );
	PRINT 'CHORDS_VDW31_RX_QUANTITY_UNIT_LU - Complete';
END;