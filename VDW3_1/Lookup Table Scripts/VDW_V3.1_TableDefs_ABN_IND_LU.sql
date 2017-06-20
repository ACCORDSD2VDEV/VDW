IF OBJECT_ID('CHORDS_VDW31_ABN_IND_LU') IS NOT NULL
BEGIN
	 PRINT 'CHORDS_VDW31_ABN_IND_LU Already Exists';
END;
ELSE
BEGIN
	 PRINT 'CHORDS_VDW31_ABN_IND_LU - Creating';
	 SET QUOTED_IDENTIFIER ON;
	 CREATE TABLE [CHORDS_VDW31_ABN_IND_LU]
	 (
					  [ABBREVIATION]    nvarchar(2) NOT NULL,
					  [DESCRIPTION]     nvarchar(50) NOT NULL,
					  CONSTRAINT [PK_CHORDS_VDW31_ABN_IND_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	 )
	 ON [PRIMARY];
	 INSERT INTO [CHORDS_VDW31_ABN_IND_LU](
		  [ABBREVIATION],
		  [DESCRIPTION] )
	 VALUES (
			  N'AB',
			  N'abnormal' ), (
			  N'C',
			  N'critical' ), (
			  N'AH',
			  N'abnormal high' ), (
			  N'CH',
			  N'critical high' ), (
			  N'AL',
			  N'abnormal low' ), (
			  N'CL',
			  N'critical low' ), (
			  N'IN',
			  N'inconclusive' ), (
			  N'UK',
			  N'unknown' ), (
			  N'NL',
			  N'normal' );
	 PRINT 'CHORDS_VDW31_ABN_IND_LU - Complete';
END;