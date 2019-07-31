DROP TABLE ItemOrder;
DROP TABLE Customer1;
DROP TABLE Tshirt;
DROP TABLE ComicBook;
DROP TABLE StoreItems;

	-- @ /home/draigoza/Desktop/MasterOwl_Sales/my_tables.sql;

create table StoreItems(ItemId varchar(10), price decimal(10,2), PRIMARY KEY(ItemId));

create table ComicBook(ItemId varchar(10), ISBN number, title varchar(50), published_Date date, no_Copies number CHECK (no_Copies >= 0), PRIMARY KEY(ISBN), FOREIGN KEY(ItemId) references StoreItems(ItemId));

create table Tshirt(ItemId varchar(10), sizesh char(6), FOREIGN KEY(ItemId) references StoreItems(ItemId));

create table Customer1(custId varchar(20), name varchar(50), phone_email varchar(50) NOT NULL UNIQUE, address varchar(50), custType char(10), dateJoined date, PRIMARY KEY(custId), CONSTRAINT FK_Cust_type check (custType = 'regular' OR custType = 'gold'));

create table ItemOrder(orderId varchar(8), ItemId varchar(10), custId varchar(10), no_of_items number, shipped_Date date, date_of_order date, shipping_Fee decimal(10,2), total_Cost decimal(10,2), PRIMARY KEY(orderId), FOREIGN KEY(ItemId) references StoreItems(ItemId), FOREIGN KEY(custId) references Customer1(custId), CONSTRAINT Date_shipped_ordered_CHK check (shipped_Date > date_of_order));

