use Restaurant_data
go

create table Dim_Restaurant(
restaurant_id int identity(1,1) primary key,
restaurant_name varchar(100) not null
);

select * from Dim_Restaurant

CREATE TABLE Dim_Branch (
    branch_id INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_id INT NOT NULL,
    branch_name VARCHAR(100) NOT NULL,

    FOREIGN KEY (restaurant_id) REFERENCES Dim_Restaurant(restaurant_id)
);

select * from Dim_Branch

CREATE TABLE Dim_Item (
    item_id INT IDENTITY(1,1) PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    dish_price FLOAT NOT NULL
);

select * from Dim_Item

CREATE TABLE Fact_Sales (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    branch_id INT NOT NULL,
    item_id INT NOT NULL,
    odate DATE NOT NULL,
    quantity_prep INT NOT NULL,
    quantity_sold INT NOT NULL,
    income FLOAT NOT NULL,
    total_investment FLOAT NOT NULL,

    FOREIGN KEY (branch_id) REFERENCES Dim_Branch(branch_id),
    FOREIGN KEY (item_id) REFERENCES Dim_Item(item_id)
);


select * from Fact_Sales
select * from Dim_Branch
select * from Dim_Item
select * from Dim_Restaurant




---if entered data wrong

DELETE FROM Fact_Sales;
DELETE FROM Dim_Item;
DELETE FROM Dim_Branch;
DELETE FROM Dim_Restaurant;

DBCC CHECKIDENT ('Fact_Sales', RESEED, 0);
DBCC CHECKIDENT ('Dim_Item', RESEED, 0);
DBCC CHECKIDENT ('Dim_Branch', RESEED, 0);
DBCC CHECKIDENT ('Dim_Restaurant', RESEED, 0);

