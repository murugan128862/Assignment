CREATE DATABASE BOOKSTORE;

USE BOOKSTORE;

CREATE TABLE Author
(
	Name VARCHAR(255),
	Address VARCHAR(255) NOT NULL UNIQUE,
	URL VARCHAR(255)
	PRIMARY KEY(Name)
)
CREATE TABLE Publisher
(
	Name VARCHAR(255),
	Address VARCHAR(255),
	Phone VARCHAR(255),
	URL INT
	PRIMARY KEY(Name)
)
CREATE TABLE Customer
(
	Email VARCHAR(255) NOT NULL,
	Name VARCHAR(255),
	Phone VARCHAR(255),
	Address VARCHAR(255),
	PRIMARY KEY(Email)
)
CREATE TABLE Book
(
	ISBN VARCHAR(255),
	PublisherName VARCHAR(255) NOT NULL REFERENCES Publisher(Name),
	AuthorName VARCHAR(255) NOT NULL REFERENCES Author(Name),
	AuthorAddress VARCHAR(255) NOT NULL REFERENCES Author(Address),
	Year int,
	Title VARCHAR(255),
	Price numeric(19,0)

)
CREATE TABLE ShoppingBasket
(
	ID int,
	CustomerEmail VARCHAR(255) NOT NULL REFERENCES Customer(Email)
	PRIMARY KEY(ID)
)
CREATE TABLE ShoppingBasket_Book
(
	ShoppingBasketID int NOT NULL REFERENCES ShoppingBasket(ID),
	BookISBN VARCHAR(255) NOT NULL REFERENCES Book(ISBN)
)
CREATE TABLE Warehouse
(
	Code int,
	Phone VARCHAR(255),
	Address VARCHAR(255),
	PRIMARY KEY(Code)
)
CREATE TABLE Warehouse_Book
(
	WarehouseCode int NOT NULL REFERENCES Warehouse(Code),
	BookISBN VARCHAR(255) NOT NULL REFERENCES Book(ISBN),
	Count int
)