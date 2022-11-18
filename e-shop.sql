-- online e-shop
-- drop database onlineshop;
-- create database onlineshop;
use onlineshop;

create table Customer
(
CustomerID varchar(10) not null,
First_Name varchar(20) NOT NULL,
Last_Name varchar(40) NOT NULL,
Email varchar(320) NOT NULL,
Phone_Number char(12) NULL,
city varchar(20) NOT NULL,
country varchar(32) NOT NULL,

primary key (CustomerID)
);

-- Employee

create table Employee
(
EmployeeID varchar(10) NOT NULL,
First_Name varchar(20) NOT NULL,
Last_Name varchar(40) NOT NULL,
Email varchar(320) NOT NULL,
Phone_Number char(12) NULL,
city varchar(20) NOT NULL,
country varchar(32) NOT NULL,

primary key (EmployeeID)
);

-- Product_Type

create table Product_Type
(
Product_TypeID varchar(10) not null,
Product_Type_Name varchar(100) not null,
Product_Type_Desc varchar(100) not null,

primary key (Product_TypeID)
);


-- Product

create table Product
(
ProductID varchar(10) not null,
Product_Title varchar(100) not null,
Product_desc varchar(100) null,
Unit_Price float not null,
languages varchar(10) null,
genre varchar(10) null,
Product_TypeID varchar(10) not null,
EmployeeID varchar(10) NOT NULL,
Release_Date varchar(20) null,

primary key (ProductID),
foreign key(Product_TypeID) 
        references Product_Type(Product_TypeID),
foreign key(EmployeeID) 
        references Employee(EmployeeID) 
);



-- ORDER_STATUS 

create table Order_Status
(
status_Order_ID VARCHAR(10) not null,
status varchar(40) not null,

primary key (Status_Order_ID)
);

-- Payment 

create table Payment
(
PaymentID varchar(10) NOT NULL,
payment_date DATE NULL,
total_amount float NOT NULL,
payment_type varchar(16) NOT NULL,

primary key (PaymentID)
);

-- Customer_Order 

create table Customer_Order 
(
Customer_OrderID varchar(10) NOT NULL,
CustomerID varchar(10) NOT NULL,
PaymentID varchar(10) NOT NULL,
status_Order_ID varchar(10) NOT NULL,
Order_Purchase_Timestamp DATE NULL,
Order_Approved_At DATE NULL,
Delivery_Date DATE NULL,

primary key (Customer_OrderID),
foreign key(CustomerID) 
        references Customer(CustomerID),
foreign key(status_Order_ID) 
        references Order_Status(status_Order_ID),
foreign key(PaymentID) 
        references Payment(PaymentID) 
);


-- Order_Products 

create table Order_Products
(
Customer_OrderID varchar(10) NOT NULL,
Order_ProductID varchar(10) NOT NULL,
ProductID varchar(10) NOT NULL,
EmployeeID varchar(10) NOT NULL,
quantity integer NOT NULL,

primary key (Order_ProductID),
foreign key(Customer_OrderID) 
        references Customer_Order (Customer_OrderID),
foreign key(ProductID) 
        references Product(ProductID),
foreign key(EmployeeID) 
        references Employee(EmployeeID) 
);

