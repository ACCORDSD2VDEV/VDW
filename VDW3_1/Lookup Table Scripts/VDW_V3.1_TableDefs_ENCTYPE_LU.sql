IF OBJECT_ID('CHORDS_VDW31_ENCTYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_ENCTYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_ENCTYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_ENCTYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(50) NOT NULL, 
				 [DESCRIPTION] nvarchar(500) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_ENCTYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_ENCTYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'IP', N'Acute Inpatient Hospital Stay: Inpatient stays, same-day hospital discharges, hospital transfers where the patient was admitted into the hospital. Includes acute inpatient psych and detox hospital stays. [ENCOUNTER_SUBTYPE = AI]' ), ( 
		   N'ED', N'Emergency Department Encounter: Excludes urgent care visits. [ENCOUNTER_SUBTYPE = HA,OC]' ), ( 
		   N'AV', N'Ambulatory Visit: Outpatient clinics, same day surgeries, observation beds, urgent care visits, and other same-day ambulatory hospital encounters. Excludes emergency department encounters). [ENCOUNTER_SUBTYPE = OC, OB, SD, HA, UC, RH, DI, OT]' ), ( 
		   N'TE', N'Telephone Encounters: [ENCOUNTER_SUBTYPE = OT, HH]' ), ( 
		   N'EM', N'E-mail Encounters: [ENCOUNTER_SUBTYPE = OT, HH]' ), ( 
		   N'IS', N'Non-Acute Institutional Stays: Hospice, SNF, rehab, nursing home, residential, overnight non-hospital dialysis and other non-hospital stays. [ENCOUNTER_SUBTYPE = HS, SN, NH, RH,DI, OT]' ), ( 
		   N'OE', N'OE=Other Encounters (not overnight): Hospice visits, home health visits, SNF visits, other non-hospital visits. [ENCOUNTER_SUBTYPE = HS, HH, SN, RH, DI, OT]' ), ( 
		   N'LO', N'Lab Only Encounter: Optional. Lab encounters that cannot be matched to another encounter. Include to link variables from ENCOUNTER table to the PROCEDURES table. [ENCOUNTER_SUBTYPE = OC,OT]' ), ( 
		   N'RO', N'Radiology Only Encounter: Optional. Radiology encounter that cannot be matched to another encounter. Include to link variables from utilization file to procedure file. [ENCOUNTER_SUBTYPE = OC,OT]' );
	PRINT 'CHORDS_VDW31_ENCTYPE_LU - Complete';
END;