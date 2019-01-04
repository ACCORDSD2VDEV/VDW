DECLARE @datavalidation TABLE
(TableName      VARCHAR(250),
 ColumnName     VARCHAR(250),
 IsNullable     VARCHAR(4),
 CharaterLength INT,
 [Precision]    TINYINT,
 [Scale]        INT
);

INSERT INTO @datavalidation
VALUES      (
       'CENSUS_DEMOG', 'CENSUS_YEAR', 'NO', NULL, 10, 0), (
       'CENSUS_DEMOG', 'GEOCODE', 'NO', 15, NULL, NULL), (
       'CENSUS_DEMOG', 'BLOCK', 'YES', 3, NULL, NULL), (
       'CENSUS_DEMOG', 'CENSUS_DATA_SRC', 'YES', 26, NULL, NULL), (
       'CENSUS_DEMOG', 'CHORDS_GEOLEVEL', 'YES', 10, NULL, NULL), (
       'CENSUS_DEMOG', 'STATE', 'YES', 2, NULL, NULL), (
       'CENSUS_DEMOG', 'COUNTY', 'YES', 3, NULL, NULL), (
       'CENSUS_DEMOG', 'TRACT', 'YES', 6, NULL, NULL), (
       'CENSUS_DEMOG', 'BLOCKGP', 'YES', 1, NULL, NULL), (
       'CENSUS_DEMOG', 'HOUSES_N', 'YES', NULL, 10, 0), (
       'CENSUS_DEMOG', 'RA_NHS_WH', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_NHS_BL', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_NHS_AM', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_NHS_AS', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_NHS_HA', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_NHS_OT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_NHS_ML', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_WH', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_BL', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_AM', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_AS', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_HA', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_OT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RA_HIS_ML', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_OCCUPIED', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_OWN', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_RENT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_FORRENT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_FORSALE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_RENTSOLD', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_SEASONAL', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_MIGRANT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSES_UNOCC_OTHER', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION1', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION2', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION3', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION4', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION5', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION6', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION7', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'EDUCATION8', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'MEDFAMINCOME', 'YES', NULL, 10, 0), (
       'CENSUS_DEMOG', 'FAMINCOME1', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME2', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME3', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME4', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME5', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME6', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME7', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME8', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME9', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME10', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME11', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME12', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME13', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME14', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME15', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMINCOME16', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'MEDHOUSINCOME', 'YES', NULL, 10, 0), (
       'CENSUS_DEMOG', 'HOUSINCOME1', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME2', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME3', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME4', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME5', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME6', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME7', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME8', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME9', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME10', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME11', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME12', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME13', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME14', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME15', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSINCOME16', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_LT_50', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_50_74', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_75_99', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_100_124', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_125_149', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_150_174', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_175_184', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_185_199', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'POV_GT_200', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'ENGLISH_SPEAKER', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'SPANISH_SPEAKER', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'BORNINUS', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'MOVEDINLAST12MON', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'MARRIED', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'DIVORCED', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'DISABILITY', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'UNEMPLOYMENT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'UNEMPLOYMENT_MALE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'INS_MEDICARE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'INS_MEDICAID', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HH_NOCAR', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HH_PUBLIC_ASSISTANCE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HMOWNER_COSTS_MORT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HMOWNER_COSTS_NO_MORT', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOMES_MEDVALUE', 'YES', NULL, 10, 0), (
       'CENSUS_DEMOG', 'PCT_CROWDING', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FEMALE_HEAD_OF_HH', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'MGR_FEMALE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'MGR_MALE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'RESIDENTS_65', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'SAME_RESIDENCE', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'FAMPOVERTY', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'HOUSPOVERTY', 'YES', NULL, 11, 10), (
       'CENSUS_DEMOG', 'ZIP', 'YES', 5, NULL, NULL);

INSERT INTO @datavalidation
VALUES      (
       'EVERNDC', 'NDC', 'NO', 11, NULL, NULL), (
       'EVERNDC', 'GENERIC', 'NO', 105, NULL, NULL), (
       'EVERNDC', 'BRAND', 'YES', 105, NULL, NULL), (
       'EVERNDC', 'GPI', 'YES', 14, NULL, NULL), (
       'EVERNDC', 'AHFS1', 'YES', 8, NULL, NULL), (
       'EVERNDC', 'AHFS2', 'YES', 8, NULL, NULL), (
       'EVERNDC', 'AHFS3', 'YES', 8, NULL, NULL), (
       'EVERNDC', 'AHFS4', 'YES', 8, NULL, NULL), (
       'EVERNDC', 'AHFS5', 'YES', 8, NULL, NULL), (
       'EVERNDC', 'AHFS6', 'YES', 8, NULL, NULL), (
       'EVERNDC', 'AHFS7', 'YES', 8, NULL, NULL);

SELECT
       a.TableName,
       a.ColumnName,
       isnull(a.Precision, 0) ExpectedNumericPrecision,
       isnull(b.NUMERIC_PRECISION, 0) ActualNumericPrecision,
       isnull(a.Scale, 0) ExpectedNumericScale,
       isnull(b.NUMERIC_SCALE, 0) ActualNumericScale,
       isnull(a.CharaterLength, 0) ExpectedCharaterLength,
       ISNULL(b.CHARACTER_MAXIMUM_LENGTH, 0) ActualCharacterLength,
       a.IsNullable ExpectedISNullable,
       b.IS_NULLABLE ActualExpectedISNullable,
       CASE
           WHEN b.COLUMN_NAME IS NULL
           THEN 'TABLE OR COLUMN MISSING'
           WHEN b.COLUMN_NAME IS NOT NULL
                AND (isnull(a.CharaterLength, 0) = ISNULL(b.CHARACTER_MAXIMUM_LENGTH, 0)
                     AND isnull(a.Precision, 0) = isnull(b.NUMERIC_PRECISION, 0)
                     AND (isnull(a.Scale, 0) = isnull(b.NUMERIC_SCALE, 0))
                     AND a.IsNullable = b.Is_Nullable)
           THEN 'OK'
           ELSE 'CONFIG-MISMATCH'
       END AS Result
FROM
     @datavalidation a
     LEFT JOIN INFORMATION_SCHEMA.COLUMNS b
          ON a.TableName = b.TABLE_NAME
             AND a.ColumnName = b.COLUMN_NAME;
