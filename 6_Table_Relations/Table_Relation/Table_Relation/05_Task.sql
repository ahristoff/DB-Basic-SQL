USE TableRelation

CREATE TABLE Cities(
CityID INT Primary Key IDENTITY,
Name VARCHAR(50)
)

CREATE TABLE Customers(
CustomerID INT Primary Key IDENTITY,
Name VARCHAR(50),
Birthday DATE,
CityID INT
)

CREATE TABLE Orders(
OrderID INT Primary Key IDENTITY,
CustomerID INT
)

CREATE TABLE ItemTypes(
ItemTypeID INT Primary Key IDENTITY,
Name VARCHAR(50)
)

CREATE TABLE Items(
ItemID INT Primary Key IDENTITY,
Name VARCHAR(50),
ItemTypeID INT
)

CREATE TABLE OrderItems(
OrderID INT NOT NULL,
ItemID INT NOT NULL
)



ALTER TABLE Customers
ADD 
CONSTRAINT FK_Customers_Cities
FOREIGN KEY (CityID)
REFERENCES Cities(CityID) ON DELETE CASCADE

ALTER TABLE Orders
ADD 
CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)

ALTER TABLE Items
ADD 
CONSTRAINT FK_Items_ItemTypes
FOREIGN KEY (ItemTypeID)
REFERENCES ItemTypes(ItemTypeID)

ALTER TABLE OrderItems
ADD 
CONSTRAINT PK_OrdersItems
PRIMARY KEY(OrderID,ItemID),

CONSTRAINT FK_OrdersItems_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID),

CONSTRAINT FK_OrdersItems_Items
FOREIGN KEY (ItemID)
REFERENCES Items(ItemID)



SELECT*FROM Orders
SELECT*FROM Customers
SELECT*FROM Cities
SELECT*FROM Items
SELECT*FROM ItemTypes
SELECT*FROM OrderItems



--DROP TABLE OrderItems
--DROP TABLE Items
--DROP TABLE ItemTypes
--DROP TABLE Orders
--DROP TABLE Customers
--DROP TABLE Cities
