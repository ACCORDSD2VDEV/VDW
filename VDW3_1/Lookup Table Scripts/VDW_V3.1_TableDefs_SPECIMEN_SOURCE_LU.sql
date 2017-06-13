IF OBJECT_ID('CHORDS_VDW31_SPECIMEN_SOURCE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_SPECIMEN_SOURCE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_SPECIMEN_SOURCE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_SPECIMEN_SOURCE_LU]
	( 
				 [ABBREVIATION] nvarchar(25) NOT NULL, 
				 [DESCRIPTION] nvarchar(100) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_SPECIMEN_SOURCE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_SPECIMEN_SOURCE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'BLOOD', N'BLOOD' ), ( 
		   N'SERUM', N'SERUM' ), ( 
		   N'PLASMA', N'PLASMA' ), ( 
		   N'SR_PLS', N'serum/plasma' ), ( 
		   N'PPP', N'Platelet Poor Plasma' ), ( 
		   N'CSF', N'cerebral spinal fluid' ), ( 
		   N'URINE', N'URINE' ), ( 
		   N'STOOL', N'STOOL' ), ( 
		   N'NSWAB', N'nasal swab. Any specimen source in your data listed as "nose" should be mapped to "nasal swab"' ), ( 
		   N'NWASH', N'nasal wash' ), ( 
		   N'NPH', N'nasopharyngeal swab' ), ( 
		   N'NPWASH', N'nasopharyngeal wash' ), ( 
		   N'THRT', N'throat, oropharyngeal swab' ), ( 
		   N'SPUTUM', N'SPUTUM' ), ( 
		   N'BAL', N'bronchoalveolar lavage (BAL) specimen' ), ( 
		   N'BALBX', N'BAL biopsy' ), ( 
		   N'OTHER', N'OTHER' ), ( 
		   N' ', N'missing value' ), ( 
		   N'NS', N'not specified' );
	PRINT 'CHORDS_VDW31_SPECIMEN_SOURCE_LU - Complete';
END;