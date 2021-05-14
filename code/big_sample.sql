-- clean env.
drop table IF EXISTS Customer;
drop table IF EXISTS "Order";
drop table IF EXISTS OrderItem;
drop table IF EXISTS Product;
drop table IF EXISTS Supplier;

create table Customer (
   Id                   int                 primary key,
   FirstName            varchar(40)         not null,
   LastName             varchar(40)         not null,
   City                 varchar(40)         null,
   Country              varchar(40)         null,
   Phone                varchar(20)         null
);

create table "Order" (
   Id                   int                 primary key,
   OrderDate            timestamp without time zone            not null,
   OrderNumber          varchar(10)         null,
   CustomerId           int                 not null,
   TotalAmount          int
);

create table OrderItem (
   Id                   int                  primary key,
   OrderId              int                  not null,
   ProductId            int                  not null,
   UnitPrice            float                not null default 0.0,
   Quantity             int                  not null default 1
);

create table Product (
   Id                   int                  primary key,
   ProductName          varchar(50)          not null,
   SupplierId           int                  not null,
   UnitPrice            float                null default 0,
   Package              varchar(30)          null,
   IsDiscontinued       int                  not null default 0
);

create table Supplier (
   Id                   int                 primary key,
   CompanyName          varchar(40)         not null,
   ContactName          varchar(50)         null,
   ContactTitle         varchar(40)         null,
   City                 varchar(40)         null,
   Country              varchar(40)         null,
   Phone                varchar(30)         null,
   Fax                  varchar(30)         null
);




