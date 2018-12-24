USE Bank

go

CREATE OR ALTER PROCEDURE usp_WithdrawMoney(@account INT,@moneyAmount MONEY)
AS
BEGIN

   DECLARE @CurrBalance MONEY = (SELECT Balance From Accounts WHERE Id = @account)

	IF(@CurrBalance < 0)
		BEGIN
			ROLLBACK;
			RAISERROR('Negativ Amount', 25, 1)
			RETURN;
		END

	IF (@CurrBalance - @moneyAmount < 0)
		BEGIN;
			throw 50000, 'Invalid account!', 1
			--RAISERROR('Invalid account!', 25, 2)
			--RETURN;
		END
	
	UPDATE Accounts SET Balance = Balance - @moneyAmount
	WHERE Id = @account
	
END

EXEC usp_WithdrawMoney 2,10000

SELECT * FROM Accounts

