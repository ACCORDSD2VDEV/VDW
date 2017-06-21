IF OBJECT_ID('CHORDS_VDW31_PROVIDER_TYPE_LU') IS NOT NULL
BEGIN
	PRINT 'CHORDS_VDW31_PROVIDER_TYPE_LU Already Exists';
END;
ELSE
BEGIN
	PRINT 'CHORDS_VDW31_PROVIDER_TYPE_LU - Creating';
	CREATE TABLE [CHORDS_VDW31_PROVIDER_TYPE_LU]
	( 
				 [ABBREVIATION] nvarchar(3) NOT NULL, 
				 [DESCRIPTION] nvarchar(50) NOT NULL, 
				 CONSTRAINT [PK_CHORDS_VDW31_PROVIDER_TYPE_LU] PRIMARY KEY CLUSTERED([ABBREVIATION] ASC)
	)
	ON [PRIMARY];
	INSERT INTO [CHORDS_VDW31_PROVIDER_TYPE_LU]( 
		[ABBREVIATION], 
		[DESCRIPTION] )
	VALUES( 
		   N'001', N'ACUPUNCTURIST' ), ( 
		   N'002', N'ANESTHESIOLGY ASST' ), ( 
		   N'003', N'AUDIOLOGIST' ), ( 
		   N'004', N'AUDIOLOGY ASSISTANT' ), ( 
		   N'005', N'CARDIAC REHAB THERAPIST' ), ( 
		   N'006', N'CASE MANAGER' ), ( 
		   N'007', N'CERTIFIED NURSE SPECIALIST' ), ( 
		   N'008', N'CERTIFIED REG NURSE ANESTHETIST' ), ( 
		   N'009', N'CHAPLAIN' ), ( 
		   N'010', N'CHEM DEP COUNSELOR, ADULT' ), ( 
		   N'011', N'CHEM DEP COUNSELOR, CHILD/ADOL' ), ( 
		   N'012', N'CHIROPRACTOR' ), ( 
		   N'013', N'CIGNA' ), ( 
		   N'014', N'CLINICAL NURSE SPECIALIST' ), ( 
		   N'015', N'COUMADIN NURSE' ), ( 
		   N'016', N'CPAP SPECIALIST' ), ( 
		   N'017', N'DENTAL ASSISTANT' ), ( 
		   N'018', N'DENTIST' ), ( 
		   N'019', N'DIABETIC NURSE' ), ( 
		   N'020', N'DIETETIC TECH' ), ( 
		   N'021', N'DIETITIAN' ), ( 
		   N'022', N'EEG TECHNICIAN' ), ( 
		   N'023', N'ER TECH' ), ( 
		   N'024', N'EXERCISE PHYSIOLOGIST' ), ( 
		   N'025', N'FELLOW' ), ( 
		   N'026', N'HEALING TOUCH' ), ( 
		   N'027', N'HEALTH EDUCATOR' ), ( 
		   N'028', N'HOME HEALTH AIDE' ), ( 
		   N'029', N'HP PHYSICIAN' ), ( 
		   N'030', N'HYGIENIST' ), ( 
		   N'031', N'INDEPENDENT LAB/X-RAY' ), ( 
		   N'032', N'INF CNTRL PRACT' ), ( 
		   N'033', N'INFUSION THERAPIST' ), ( 
		   N'034', N'INTERPRETER' ), ( 
		   N'035', N'LAB ASSISTANT' ), ( 
		   N'036', N'LAB TECHNICIAN' ), ( 
		   N'037', N'LACTATION CONSULTANT' ), ( 
		   N'038', N'LIC FAM THERAPIST' ), ( 
		   N'039', N'LIC SOCIAL WORKER' ), ( 
		   N'040', N'MASSAGE THERAPIST' ), ( 
		   N'041', N'MEDICAL ASSISTANT' ), ( 
		   N'042', N'MIDLEVEL' ), ( 
		   N'043', N'MIDWIFE' ), ( 
		   N'044', N'MUSIC THERAPIST' ), ( 
		   N'045', N'NOT APPLICABLE' ), ( 
		   N'046', N'NURSE' ), ( 
		   N'047', N'NURSE CLINICIAN' ), ( 
		   N'048', N'NURSE PRACTITIONER' ), ( 
		   N'049', N'OCCUPATIONAL THERAPIST' ), ( 
		   N'050', N'OPHTHALMIC ASSISTANT' ), ( 
		   N'051', N'OPHTHALMIC TECHNICIAN' ), ( 
		   N'052', N'OPTICIAN' ), ( 
		   N'053', N'OPTOMETRIST' ), ( 
		   N'054', N'ORTHO PHY ASST' ), ( 
		   N'055', N'ORTHOPAEDIC' ), ( 
		   N'056', N'OSTEOPATH' ), ( 
		   N'057', N'PERSONAL CARE ATTENDANT' ), ( 
		   N'058', N'PHARM TECH' ), ( 
		   N'059', N'PHARMACIST' ), ( 
		   N'060', N'PHYSICAL THERAPIST' ), ( 
		   N'061', N'PHYSICIAN' ), ( 
		   N'062', N'PHYSICIAN ASSISTANT' ), ( 
		   N'063', N'PODIATRIST' ), ( 
		   N'064', N'PSYCH TECHNICIAN' ), ( 
		   N'065', N'PSYCHOLOGIST' ), ( 
		   N'066', N'PSYCHOTHERAPIST' ), ( 
		   N'067', N'PSYCHOTHERAPIST, ADULT' ), ( 
		   N'068', N'PSYCHOTHERAPIST, CHILD/ADOL' ), ( 
		   N'069', N'PT ASSISTANT' ), ( 
		   N'070', N'RADIATION THERAPIST' ), ( 
		   N'071', N'RADIOLOGY TECHNICIAN' ), ( 
		   N'072', N'RECREATIONAL THERAPIST' ), ( 
		   N'073', N'REGISTERED NURSE' ), ( 
		   N'074', N'REHAB ASSISTANT' ), ( 
		   N'075', N'REHAB THERAPIST' ), ( 
		   N'076', N'REIKI' ), ( 
		   N'077', N'RESIDENT' ), ( 
		   N'078', N'RESOURCE' ), ( 
		   N'079', N'RESPIRATORY THERAPIST' ), ( 
		   N'080', N'SOCIAL WORKER' ), ( 
		   N'081', N'SPEECH PATHOLOGIST CERTIFIED' ), ( 
		   N'082', N'STUDENT' ), ( 
		   N'083', N'SURG TECH' ), ( 
		   N'084', N'SURGEON ASSISTANT' ), ( 
		   N'085', N'THERAPEUTIC AQUATIC SPECIALIST' ), ( 
		   N'086', N'ULTRASOUND TECHNICIAN' ), ( 
		   N'888', N'OTHER' ), ( 
		   N'999', N'UNKNOWN' );
	PRINT 'CHORDS_VDW31_PROVIDER_TYPE_LU - Complete';
END;