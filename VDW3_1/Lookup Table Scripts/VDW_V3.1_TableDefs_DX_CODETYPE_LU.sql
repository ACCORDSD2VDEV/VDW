IF OBJECT_ID('CHORDS_VDW31_DX_CODETYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_DX_CODETYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_DX_CODETYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_DX_CODETYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(2) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_DX_CODETYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_DX_CODETYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'07', N'''ICD-7-CM'' (including ''ICD-7'')' ), ( 
		   N'08', N'''ICD-8-CM'' (including ''ICD-8'')' ), ( 
		   N'09', N'''ICD-9-CM'' (including ''ICD-9'')' ), ( 
		   N'10', N'''ICD-10-CM'' (including ''ICD-10'')' ), ( 
		   N'11', N'''ICD-11-CM'' (including ''ICD-11'')' ), ( 
		   N'OT', N'Other' ), ( 
		   N'UN', N'Unknown' );
	PRINT 'CHORDS_VDW31_DX_CODETYPE_LU - Complete';
END;