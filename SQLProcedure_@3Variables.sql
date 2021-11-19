CREATE PROCEDURE Threeparameters @CusGrade  int ,
@CusCountry varchar(200), @OpeningAmt Decimal(10,2)
As
begin
Select * AGENTS 
WHERE AGENT_CODE IN( SELECT AGENT_CODE FROM CUSTOMER 
					WHERE CUSTOMER.CUST_COUNTRY=@CusCountry and @CusGrade>@Cus
End;

EXEC Threeparameters @CusGrade=1,@CusCountry='UK', @OpeningAmt=5000.00;