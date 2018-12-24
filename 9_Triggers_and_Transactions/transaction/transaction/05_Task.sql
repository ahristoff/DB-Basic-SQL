USE Bank

GO

CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DECIMAL(18, 4))
AS
BEGIN
	BEGIN TRAN
		IF(@Amount<0)
			BEGIN
			--RAISERROR('Negativ Amount', 16, 1)
			ROLLBACK
			RETURN
		END

		UPDATE Accounts
		SET Balance = Balance - @Amount
		WHERE Id = @SenderId

		IF(@@ROWCOUNT<>1)
			BEGIN
				--RAISERROR('', 16, 1)
				ROLLBACK
				RETURN
			END

		DECLARE @FinalAmount DECIMAL(18,4) = (SELECT Balance FROM Accounts WHERE Id = @SenderId)

		IF(@FinalAmount < 0)
			BEGIN
				--RAISERROR('', 16, 1)
				ROLLBACK
				RETURN
			END

		UPDATE Accounts
		SET Balance = Balance + @Amount
		WHERE Id = @ReceiverId

		IF(@@ROWCOUNT<>1)
			BEGIN
				--RAISERROR('', 16, 1)
				ROLLBACK
				RETURN
			END

	COMMIT


END

EXEC usp_TransferMoney 1, 111, 10

SELECT * FROM Accounts

------------------------------------------------------------------------------------

CREATE PROCEDURE usp_TransferMoney(@senderId INT, @receiverId INT, @amount MONEY) 
AS 
BEGIN 
	DECLARE @SenderBalance MONEY = (SELECT ac.Balance FROM Accounts AS ac WHERE ac.Id =	nderId) 
	BEGIN TRAN 
		IF(@amount < 0) 
		BEGIN 
			ROLLBACK 
		END 
		ELSE 
		BEGIN 
			IF(@SenderBalance - @amount >= 0) 
			BEGIN 
				EXEC usp_WithdrawMoney @senderId, @amount 
				EXEC usp_DepositMoney @receiverId, @amount 
				COMMIT 
			END 
			ELSE 
			BEGIN 
				ROLLBACK 
			END 
		END 
END 
