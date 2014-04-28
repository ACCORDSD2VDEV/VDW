CREATE TABLE DEATH (
PERSON_ID           CHAR(12) NOT NULL,
DEATHDT	            DATE,
DTIMPUTE	        Char(1),
SOURCE	            Char(1) NOT NULL,
CONFIDENCE	        Char(1) NOT NULL
);

CREATE UNIQUE INDEX PIndex ON DEATH(PERSON_ID);
/*------------------------------------------------------------*/

CREATE TABLE CAUSE_OF_DEATH (
PERSON_ID           CHAR(12) NOT NULL,
COD	                Char(6),
DX_CODETYPE	        Char(2),
CAUSETYPE	          Char(1),
SOURCE	            Char(1) NOT NULL,
CONFIDENCE	        Char(1) NOT NULL
);

CREATE UNIQUE INDEX PIndex ON CAUSE_OF_DEATH (PERSON_ID, COD);
/*------------------------------------------------------------*/

CREATE TABLE DEMOGRAPHICS
(
PERSON_ID           CHAR(12) NOT NULL,
MRN	                Char(9) NOT NULL,
BIRTH_DATE	        DATE,
GENDER	            Char(1) NOT NULL DEFAULT 'U',
PRIMARY_LANGUAGE    CHAR(3) NOT NULL DEFAULT 'unk',
NEEDS_INTERPRETER   CHAR(1) NOT NULL DEFAULT 'U', 
RACE1   	          Char(2) NOT NULL,
RACE2	              Char(2) NOT NULL,
RACE3	              Char(2) NOT NULL,
RACE4	              Char(2) NOT NULL,
RACE5	              Char(2) NOT NULL,    
HISPANIC	          Char(1) NOT NULL
);

CREATE UNIQUE INDEX PIndex ON DEMOGRAPHICS (PERSON_ID);
/*------------------------------------------------------------*/

CREATE TABLE DIAGNOSES
(
PERSON_ID           CHAR(12) NOT NULL,
ENCTYPE             CHAR(2) NOT NULL,
ENC_ID	            CHAR(32) NOT NULL,
PROVIDER	          CHAR(15) NOT NULL,
DIAGPROVIDER	      CHAR(15) NOT NULL,
ADATE               DATE NOT NULL,
DX	                CHAR(10) NOT NULL,
ORIGDX	            CHAR(10) NOT NULL,
DX_CODETYPE	        CHAR(2) NOT NULL,
PRINCIPAL_DX        CHAR(1) NOT NULL,
PRIMARY_DX          CHAR(1) NOT NULL
);

-- NO UNIQUE IDENTIFIER
/*------------------------------------------------------------*/

CREATE TABLE ENCOUNTERS
(
PERSON_ID           CHAR(12) NOT NULL,
ADATE	              DATE NOT NULL,
ENC_ID              CHAR(32) NOT NULL,
DDATE	              DATE,
PROVIDER	          CHAR(15) NOT NULL,     
ENC_COUNT	          NUMERIC(3) NOT NULL,
DRG_VERSION	        CHAR(1),
DRG_VALUE	          CHAR(4),
ENCTYPE	            CHAR(2) NOT NULL,
ENCOUNTER_SUBTYPE	  CHAR(2) NOT NULL,
FACILITY_CODE	      CHAR(12) NOT NULL,
DISCHARGE_DISPOSITION	CHAR(1),
DISCHARGE_STATUS	  CHAR(2),
ADMITTING_SOURCE	  CHAR(2),
DEPARTMENT	        CHAR(4)
);


CREATE UNIQUE INDEX PIndex ON ENCOUNTERS (ENC_ID);
/*------------------------------------------------------------*/

CREATE TABLE ENROLLMENT
(
PERSON_ID           CHAR(12) NOT NULL,
ENR_START	          DATE NOT NULL,
ENR_END             DATE NOT NULL,
INS_MEDICAID	      CHAR(1) NOT NULL,
INS_COMMERCIAL	    CHAR(1) NOT NULL,
INS_PRIVATEPAY	    CHAR(1) NOT NULL,
INS_STATESUBSIDIZED CHAR(1) NOT NULL,
INS_SELFFUNDED	    CHAR(1) NOT NULL,
INS_HIGHDEDUCTIBLE  CHAR(1) NOT NULL,
INS_MEDICARE	      CHAR(1) NOT NULL,
INS_MEDICARE_A	    CHAR(1) NOT NULL,
INS_MEDICARE_B	    CHAR(1) NOT NULL,
INS_MEDICARE_C	    CHAR(1) NOT NULL,
INS_MEDICARE_D	    CHAR(1) NOT NULL,
INS_OTHER	          CHAR(1) NOT NULL,
PLAN_HMO	          CHAR(1) NOT NULL,
PLAN_POS	          CHAR(1) NOT NULL,
PLAN_PPO	          CHAR(1) NOT NULL,
PLAN_INDEMNITY	    CHAR(1) NOT NULL,
DRUGCOV	            CHAR(1) NOT NULL,
OUTSIDE_UTILIZATION CHAR(1) NOT NULL,
ENROLLMENT_BASIS    CHAR(1) NOT NULL,
PCC	                CHAR(4),
PCP	                CHAR(15)
);

CREATE UNIQUE INDEX PIndex ON ENROLLMENT (PERSON_ID, ENR_START);
/*------------------------------------------------------------*/

CREATE TABLE EVERNDC
(
NDC	                Char(11),
GENERIC         	  Char(105),
BRAND	              Char(105),
GPI	                Char(14),
AHFS1	              Char(8),
AHFS2	              Char(8),
AHFS3	              Char(8),
AHFS4	              Char(8),
AHFS5	              Char(8),
AHFS6	              Char(8),
AHFS7	              Char(8)
);

CREATE UNIQUE INDEX pIndex ON EVERNDC (NDC, GENERIC);
/*------------------------------------------------------------*/


CREATE TABLE LAB_RESULTS
(
PERSON_ID           CHAR(12) NOT NULL,
RESULT_DT             DATE NOT NULL,
RESULT_TM             TIME,
LAB_DT                DATE NOT NULL,
LAB_TM                TIME,
TEST_TYPE             CHAR(20) NOT NULL, 
LOINC                 CHAR(10),
STAT                  CHAR(1) NOT NULL,
PT_LOC                CHAR(1) NOT NULL,
RESULT_LOC            CHAR(1) NOT NULL,  
LOCAL_CD              CHAR(25) NOT NULL,    
BATTERY_CD            VARCHAR(255) NOT NULL,
PX                    CHAR(6) NOT NULL,        
CODETYPE              CHAR(1) NOT NULL,  
ORDER_ID              CHAR(35) NOT NULL,  
ORDER_DT              DATE,   
RESULT_C              CHAR(8) NOT NULL,
MODIFIER              CHAR(2) NOT NULL, 
RESULT_UNIT           CHAR(11),     
NORMAL_LOW_C          CHAR(8), 
MODIFIER_LOW          CHAR(2),       
NORMAL_HIGH_C         CHAR(8),        
MODIFIER_HIGH         CHAR(2),
ABN_IND               CHAR(2) NOT NULL,
ORDER_PROV            CHAR(15),  
ORDER_DEPT            CHAR(4),      
FACILITY_CODE         CHAR(12), 
SPECIMEN_ID           CHAR(35),  
SPECIMEN_SOURCE       CHAR(6),
ROW_ID								CHAR(8)
);

CREATE UNIQUE INDEX PIndex ON LAB_RESULTS (LOINC, TEST_TYPE, ORDER_ID);
/*------------------------------------------------------------*/

CREATE TABLE PHARMACY
(
PERSON_ID           CHAR(12) NOT NULL,
RXDATE	           DATE NOT NULL,
NDC	               Char(11) NOT NULL,     
RXSUP	             SMALLINT NOT NULL,
RXAMT	             NUMERIC(16,10) NOT NULL,
RXMD	             Char(15) NOT NULL
);

CREATE UNIQUE INDEX PIndex ON PHARMACY (NDC, RXDATE, PERSON_ID);
/*------------------------------------------------------------*/

CREATE TABLE PROCEDURES
(
PERSON_ID           CHAR(12) NOT NULL,
PROVIDER	          CHAR(15) NOT NULL,
PROCDATE            DATE NOT NULL,
ENC_ID	            Char(32) NOT NULL,
PERFORMINGPROVIDER	Char(15) NOT NULL,
ADATE               DATE NOT NULL,
ENCTYPE             CHAR(2) NOT NULL,
PX	                Char(10) NOT NULL,
ORIGPX	            Char(10) NOT NULL,
PX_CODETYPE	        Char(2) NOT NULL,
PXCNT	              NUMERIC(7) NOT NULL,
CPTMOD1	            Char(2),
CPTMOD2	            Char(2),
CPTMOD3	            Char(2)
);

-- NO UNIQUE IDENTIFIER
/*------------------------------------------------------------*/

CREATE TABLE PROVIDER_SPECIALTY
(
PROVIDER                     CHAR(15) NOT NULL,     
SPECIALTY                    CHAR(3) NOT NULL DEFAULT 'UNK',             
SPECIALTY2                   CHAR(3),
SPECIALTY3		               CHAR(3),
SPECIALTY4		               CHAR(3), 
PROVIDER_TYPE                CHAR(3) NOT NULL DEFAULT '999',         
PROVIDER_BIRTH_YEAR          NUMERIC(4),    
PROVIDER_GENDER              CHAR(1) NOT NULL DEFAULT 'U',       
PROVIDER_RACE                CHAR(2) NOT NULL DEFAULT 'UN',         
PROVIDER_HISPANIC            CHAR(1) NOT NULL DEFAULT 'U',     
YEAR_GRADUATED               NUMERIC(4)
);

CREATE UNIQUE INDEX PIndex ON PROVIDER_SPECIALTY (PROVIDER);
/*------------------------------------------------------------*/

CREATE TABLE SOCIAL_HISTORY (
ENC_ID	              CHAR(32) NOT NULL,
PERSON_ID           CHAR(12) NOT NULL,
CONTACT_DATE	        DATE NOT NULL,
TOBACCO_PAK_PER_DY	  CHAR(20),
TOBACCO_USED_YEARS	  CHAR(20),
TOBACCO_COMMENT	      CHAR(255),
UNSPECIFIED_TOBACCO   CHAR(1),
SMOKING_QUIT_DATE     	  DATETIME,
SMOKELESS_QUIT_DATE       DATETIME,
CIGARETTES_YN	        CHAR(1) NOT NULL,
PIPES_YN	            CHAR(1) NOT NULL,
CIGARS_YN	            CHAR(1) NOT NULL,
SNUFF_YN	            CHAR(1) NOT NULL,
CHEW_YN	              CHAR(1) NOT NULL,
ALCOHOL_OZ_PER_WK   	CHAR(15),
ALCOHOL_COMMENT	      CHAR(255),
IV_DRUG_USER_YN	      CHAR(1) NOT NULL DEFAULT 'N',
ILLICIT_DRUG_FREQ	    CHAR(5),
ILLICIT_DRUG_COMMENT  CHAR(255),
FEMALE_PARTNER_YN	    CHAR(1) NOT NULL,
MALE_PARTNER_YN	      CHAR(1) NOT NULL,
CONDOM_YN	            CHAR(1) NOT NULL,
PILL_YN	              CHAR(1) NOT NULL,
DIAPHRAGM_YN	        CHAR(1) NOT NULL,
IUD_YN	              CHAR(1) NOT NULL,
SURGICAL_YN	          CHAR(1) NOT NULL,
SPERMICIDE_YN	        CHAR(1) NOT NULL,
IMPLANT_YN	          CHAR(1) NOT NULL,
RHYTHM_YN  	          CHAR(1) NOT NULL,
INJECTION_YN	        CHAR(1) NOT NULL,
SPONGE_YN	            CHAR(1) NOT NULL,
BC_INSERTS_YN	        CHAR(1) NOT NULL,
ABSTINENCE_YN	        CHAR(1) NOT NULL,
SEX_COMMENT	          CHAR(255),
YEARS_EDUCATION	      CHAR(15),
TOBACCO_USER	        CHAR(1) NOT NULL,
ALCOHOL_USER	        CHAR(1) NOT NULL,
ILL_DRUG_USER	        CHAR(1) NOT NULL,
SEXUALLY_ACTV	        CHAR(1) NOT NULL,
ONC_SMOKING_STATUS    CHAR(1)
);

CREATE UNIQUE INDEX PIndex ON SOCIAL_HISTORY (PERSON_ID, CONTACT_DATE, ENC_ID);
/*------------------------------------------------------------*/

CREATE TABLE VITAL_SIGNS
(
PERSON_ID                         CHAR(12) NOT NULL,
MEASURE_DATE	                    DATE,
MEASURE_TIME                      TIME,
ENCTYPE	                          CHAR(2) NOT NULL,
HT_RAW	                          varchar(16), 
WT_RAW	                          varchar(16),  
HT	                              NUMERIC(7,3),
WT	                              NUMERIC(8,4),
BMI_RAW	                          varchar(16),					
DIASTOLIC	                        NUMERIC(3),	
SYSTOLIC	                        NUMERIC(3),
DIASTOLIC_RAW	                  varchar(16),
SYSTOLIC_RAW	                  varchar(16),	
BP_TYPE	                          CHAR(1),
POSITION	                        CHAR(1),
HEAD_CIR_RAW	                  varchar(16),
RESPIR_RAW	                      varchar(16),
TEMP_RAW	                      varchar(16),		
PULSE_RAW	                      VARCHAR(16)
);

-- NO UNIQUE IDENTIFIER
/*------------------------------------------------------------*/

CREATE TABLE TUMOR
(
PERSON_ID            CHAR(12) NOT NULL,
DXDATE	             DATE NOT NULL,             
ICDOSITE	           CHAR(4) NOT NULL,
STAGEGEN             CHAR(1) NOT NULL,
SS1977	             CHAR(1),
SS2000	             CHAR(1),
STAGEAJ	             CHAR(4) NOT NULL,           
AJCC_Ed	             CHAR(1),
AJCC_GRP             CHAR(2),
AJCC_FULL_DER        CHAR(20),
MORPH	               CHAR(4) NOT NULL,
BEHAV	               CHAR(1) NOT NULL,
GRADE	               CHAR(1) NOT NULL,
DXYEAR	             NUMERIC(4) NOT NULL,     
DXAGE	               NUMERIC(3) NOT NULL,    
BDATE	               DATE NOT NULL,       
GENDER	             CHAR(1) NOT NULL,     
RACE1	               CHAR(2) NOT NULL,      
RACE2	               CHAR(2) NOT NULL,       
RACE3	               CHAR(2) NOT NULL,      
RACE4	               CHAR(2) NOT NULL,      
RACE5	               CHAR(2) NOT NULL,      
HISPANIC	           CHAR(1) NOT NULL,       
CLASS	               CHAR(2) NOT NULL,
SEQUENCE	           CHAR(2) NOT NULL,
VITAL	               CHAR(1) NOT NULL,
DCAUSE	             CHAR(6),
DOD	                 DATE,
DT_FU	               DATE, 
LATERALITY	         CHAR(1) NOT NULL,
IDPLAN	             CHAR(2) NOT NULL,
DCNFRM	             CHAR(1) NOT NULL,
DSTZ	               CHAR(3),          
DAJC1T_P	           CHAR(5),
DAJC1N_P	           CHAR(5),
DAJC1M_P	           CHAR(5),
DAJC1T_C	           CHAR(5),
DAJC1N_C	           CHAR(5),
DAJC1M_C	           CHAR(5),
DSRG_FAC	           CHAR(2) NOT NULL,
DRAD_FAC	           CHAR(2) NOT NULL,
DCHM_FAC	           CHAR(2) NOT NULL,
DHRM_FAC	           CHAR(2) NOT NULL,
DIMM_FAC	           CHAR(2) NOT NULL,
DOTH_FAC	           CHAR(2) NOT NULL,
DNDI	               CHAR(2) NOT NULL,
DNDX	               CHAR(2) NOT NULL,
DTMRK1	             CHAR(1),
DTMRK2	             CHAR(1),
DTMRK3	             CHAR(1),
CLN_STG	             char(4) NOT NULL,
EOD	                 CHAR(12),
DT_SURG	             DATE,
DT_CHEMO	           DATE,
DT_HORM	             DATE,
DT_RAD	             DATE,
DT_BRM	             DATE,
DT_OTH	             DATE,
R_N_SURG	           CHAR(1) NOT NULL,
R_N_CHEMO	           CHAR(2) NOT NULL,
R_N_HORM	           CHAR(1) NOT NULL,
R_N_RAD	             CHAR(1) NOT NULL,
R_N_BRM	             CHAR(1) NOT NULL,
R_N_OTH	             CHAR(1) NOT NULL,
DSRG_SUM	           CHAR(2) NOT NULL,
DRAD_SUM	           CHAR(2) NOT NULL,
DCHM_SUM	           CHAR(2) NOT NULL,
DHRM_SUM	           CHAR(2) NOT NULL,
DIMM_SUM	           CHAR(2) NOT NULL,
DOTH_SUM	           CHAR(2) NOT NULL,
CS_SZ	               CHAR(3),
CS_EXT	             CHAR(3),
CS_NODES	           CHAR(3),
CS_NODES_EVAL	       CHAR(1),
CS_METS	             CHAR(2),
CS_METS_EVAL	       CHAR(1),
SSF1	               CHAR(3),
SSF2	               CHAR(3),
SSF3	               CHAR(3),
SSF4	               CHAR(3),
SSF5	               CHAR(3),
SSF6	               CHAR(3),
SSF7	               CHAR(3),
SSF8	               CHAR(3),
SSF9	               CHAR(3),
SSF10	               CHAR(3),
SSF11	               CHAR(3),
SSF12	               CHAR(3),
SSF13	               CHAR(3),
SSF14	               CHAR(3),
SSF15	               CHAR(3),
SSF16	               CHAR(3),
SSF17	               CHAR(3),
SSF18	               CHAR(3),
SSF19	               CHAR(3),
SSF20	               CHAR(3),
SSF21	               CHAR(3),
SSF22	               CHAR(3),
SSF23	               CHAR(3),
SSF24	               CHAR(3),
SSF25	               CHAR(3),
PAL_FAC	             CHAR(1) NOT NULL,
PAL_SUM	             CHAR(1) NOT NULL,
DER_T6	             CHAR(3),
DER_T6_D	           CHAR(1),
DER_N6	             CHAR(3),
DER_N6_D	           CHAR(1),
DER_M6	             CHAR(3),
DER_M6_D	           CHAR(1),
DER_T7	             CHAR(3),
DER_T7_D	           CHAR(1),
DER_N7	             CHAR(3),
DER_N7_D	           CHAR(1),
DER_M7	             CHAR(3),
DER_M7_D	           CHAR(1),
DER_SS2000F	         CHAR(1),
RECUR_DT	           DATETIME,
RECUR_TYPE	         CHAR(2) NOT NULL,                  
RECUR_FL	           CHAR(2),
DATA_SOURCE          CHAR(4)
);

CREATE UNIQUE INDEX PIndex ON TUMOR (PERSON_ID, DXDATE, SEQUENCE);

/*------------------------------------------------------------*/

CREATE TABLE LANGUAGES
(
PERSON_ID      CHAR(12) NOT NULL,
LANG_ISO       CHAR(3),
LANG_USAGE     CHAR(1),
LANG_PRIMARY   CHAR(1)
);

CREATE UNIQUE INDEX PIndex ON LANGUAGES (PERSON_ID, LANG_ISO);
