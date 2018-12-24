CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY,
Username VARCHAR(30) UNIQUE NOT NULL,
Password VARCHAR(26) UNIQUE NOT NULL,
ProfilePicture BINARY(900),
LastLoginTime DATETIME,
IsDeleted BIT
)

INSERT INTO Users(UserName,Password,ProfilePicture,LastLoginTime,IsDeleted) 
VALUES('Pesho','123a4',NULL,'2017-8-12',1),
	  ('Gosho','45hj',NULL,'2017-5-18',0),
	  ('Ivo','tdydik',NULL,'2017-7-12',1),
	  ('kiro','ttyi',NULL,'2017-4-26',0),
	  ('niki','aagd',NULL,'2017-3-5',1),
	  ('kiki','aag',NULL,'2017-3-5',1)



	  ALTER TABLE Users
	  ADD CHECK(LEN(Password)>=5)
select*from Users