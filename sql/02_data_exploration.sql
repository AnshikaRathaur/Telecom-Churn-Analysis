-- Data exploration: Gender, Contract, Customer Status, State, Internet Type

DECLARE @sql NVARCHAR(MAX);

SELECT @sql =
    N'SELECT Gender,
             COUNT(Gender) AS TotalCount,
             COUNT(Gender) * 100.0 /
             (SELECT COUNT(*) FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N') AS Percentage
      FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N'
      GROUP BY Gender;'
FROM sys.tables
WHERE object_id = 1221579390;

EXEC sp_executesql @sql;


DECLARE @sql NVARCHAR(MAX);

SELECT @sql =
    N'SELECT Contract,
             COUNT(Contract) AS TotalCount,
             COUNT(Contract) * 1.0 /
             (SELECT COUNT(*) FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N') AS Percentage
      FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N'
      GROUP BY Contract;'
FROM sys.tables
WHERE object_id = 1221579390;

EXEC sp_executesql @sql;


DECLARE @sql NVARCHAR(MAX);

SELECT @sql =
    N'SELECT Customer_Status,
             COUNT(Customer_Status) AS TotalCount,
             SUM(Total_Revenue) AS TotalRev,
             SUM(Total_Revenue) * 100.0 /
             (SELECT SUM(Total_Revenue) FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N') AS RevPercentage
      FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N'
      GROUP BY Customer_Status;'
FROM sys.tables
WHERE object_id = 1221579390;

EXEC sp_executesql @sql;



DECLARE @sql NVARCHAR(MAX);

SELECT @sql =
    N'SELECT State,
             COUNT(State) AS TotalCount,
             COUNT(State) * 1.0 /
             (SELECT COUNT(*) FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N') AS Percentage
      FROM '
    + QUOTENAME(SCHEMA_NAME(schema_id))
    + N'.'
    + QUOTENAME(name)
    + N'
      GROUP BY State
      ORDER BY Percentage DESC;'
FROM sys.tables
WHERE object_id = 1221579390;

EXEC sp_executesql @sql;


Select DISTINCT Internet_type
FROM [stg _Churn]
