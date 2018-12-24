USE Bank

GO

CREATE FUNCTION ufn_CalculateFutureValue (@sum MONEY, @yearlyInterestRate FLOAT, @numberOfYears INT)
RETURNS DECIMAL(20,4)
AS
BEGIN

DECLARE @FK MONEY = ROUND(@sum*(POWER((1+@yearlyInterestRate),@numberOfYears)),4)

RETURN @FK
END

GO
SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)



