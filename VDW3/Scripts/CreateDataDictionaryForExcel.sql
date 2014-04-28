SELECT Table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'


DECLARE @tableName sysname
DECLARE table_cursor CURSOR FAST_FORWARD  FOR 
SELECT Table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

OPEN table_cursor

FETCH NEXT FROM table_cursor 
INTO @tableName

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT TABLE_NAME,
            COLUMN_NAME,
            Data_type + COALESCE('(' + Cast(Character_Maximum_length as varchar) + ')' ,'') DataType, 
            IS_NULLABLE

    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE
    TABLE_NAME = @tableName



    FETCH NEXT FROM table_cursor 
    INTO @tableName
END
CLOSE table_cursor
DEALLOCATE table_cursor