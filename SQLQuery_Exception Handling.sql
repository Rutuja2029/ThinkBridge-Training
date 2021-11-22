--Demo Exceptional Handling
BEGIN TRY
DECLARE @num int, @msg varchar(200);
SET @num=5/0
PRINT 'Not possible: Divide by Zero Exception'
END TRY

BEGIN CATCH
PRINT 'Dont you try dividing a number by zero'
--SET @msg = (SELECT ERROR_MESSAGE())
--PRINT @msg;
Select ERROR_NUMBER() AS ErrorNumber, 
	   ERROR_SEVERITY() As ErrorSeverity,
	   ERROR_STATE() As ErrorState,
	   ERROR_PROCEDURE() AS ErrorProcedure,
	   Error_LINE() As ErrorLine,
	   Error_MESSAGE() AS ErrorMessage

End CATCH
Go
--------------------------------------------------
--TRY CATCH--
CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO

DECLARE @r2 decimal;
EXEC usp_divide 10, 0, @r2 output;
PRINT @r2;

DECLARE @r decimal;
EXEC usp_divide 10, 2, @r output;
PRINT @r;
--------------------------------------------------------------
BEGIN
BEGIN TRY 
DECLARE @OUTPUT varchar(200);
SELECT @OUTPUT = AGENTS.AGENT_NAME FROM AGENTS 
WHERE AGENT_NAME = 'Hemant';
If @OUTPUT IS NULL
BEGIN
PRINT 'Name not found'
RAISERROR('Record not found',11,1);
END
ELSE
SELECT @OUTPUT As AGENT
END TRY
BEGIN CATCH
Print 'Catch block';
Throw;
END CATCH
END
------------------------------------------------------------------


