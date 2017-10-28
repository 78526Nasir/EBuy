create database E_Commerce

use E_Commerce


-- Acount TABLE --
create table Account(
	username	varchar(50) not null,
	password	varchar(50) not null,
	
	constraint pk_un primary key (username)
)


INFORMATION_SCHEMA 

insert into Account values('Nasir','78526');
insert into Account values('Sujan','2544');


-- User TABLE --
create table [User](
	 [user_id]	int identity,	
     username	varchar(50) not null,
     fullname	varchar(100) not null,
     email		varchar(100) not null,
     dob		datetime not null,
     age		int not null,
     religion   varchar(20) not null,
     [password]	varchar(100) not null,
     gender		varchar(10) not null
     
     constraint pk_U_id primary key ([user_id])
)

drop table [User]

INSERT INTO [USER] VALUES('sujan', 'nasir islam sujan', 's@s.com', 1995-12-17, 21,'islam', '1', 'male')


select * from [User]  


-- Product TABLE --

create table Product
(
	Product_ID			int primary key identity,
	Product_Name		varchar(50),
	[Description]		varchar(500),
	Price				varchar(20),
	ImageUrl			varchar(500),
	Category_ID			int
	
)

drop table Product
select * from Product

-- Category TABLE --

create table Category
(
	Category_ID				int primary key identity,
	Category_Name			varchar(50),
	Category_Description	varchar(500)
)

drop table Category

select * from Category

select LEN(category_description) as Characters from category where category_id=3

-- STORE PROCEDURE for insert data into Category TABLE --

create proc sp_addNewCategory
@categoryName varchar(50),
@categoryDesc varchar(500)

as
begin
	insert into Category values(@categoryName,@categoryDesc)
end

-- STORE PROCEDURE for select all Category Name --

create proc sp_getAllCategory
as
begin
	select * from category
end

drop sp_getAllCategory


-- Company TABLE --

create table Company
(
	Company_ID			int primary key identity,
	Company_Name		varchar(50) not null,
	Company_Desc		varchar(500) not null,
	Partnership_date	datetime not null,
)

drop table company

-- STORE PROCEDURE for select all Company --
create proc sp_getAllCompanies
as 
begin
	select * from Company
end


-- STORE PROCEDURE for insert data into Company TABLE ---

create proc sp_addNewCompany
@CompanyName		varchar(50),
@CompanyDesc		varchar(500),
@PartnershipDate	datetime

as
begin
	insert into Company values(@CompanyName,@CompanyDesc,@PartnershipDate)
end

BMW is a Germany-based company which currently produces automobiles and motorcycles, and produced engines until 1945. The company was founded in 1916 and has its headquarters in Munich, Bavaria.
TATA is an india multinational conglomerate holding company headquartered in Mumbai, Maharashtra, India. It was founded in 1868 by Jamseti TATA and gained international recognization after purchasing serveral global companies.
Ferrari is an Italian sports car manufacturer based in Marancello. Founded by Enzo Ferrari  in 1939 out of Alfa Romeo's race division as Auto Avio Costruzioni, the company built its first car in 1940.

