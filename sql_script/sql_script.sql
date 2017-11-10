create database E_Commerce

use E_Commerce


-- Acount TABLE --
create table Account(
	username	varchar(50) not null,
	password	varchar(50) not null,
	
	constraint pk_un primary key (username)
)



insert into Account values('Nasir','78526');
insert into Account values('Sujan','2544');


-- User TABLE --

create table [User](
	 [user_id]		int identity,	
     username		varchar(50) not null,
     fullname		varchar(100) not null,
     email			varchar(100) not null,
     dob			datetime not null,
     age			int not null,
     religion		varchar(20) not null,
     [password]		varchar(100) not null,
     gender			varchar(10) not null,
     salt			varchar(max),
     [Hash]			varchar(max),
     
     constraint pk_U_id primary key ([user_id])
)

drop table [User]

select * from admin
select * from [user]


-- STORE PROCEDURE for INSERT data into USER TABLE--

create proc sp_addNewUser
@username		varchar(50),
@fullname		varchar(100),
@email			varchar(100),
@dob			datetime,
@age			int,
@religion		varchar(20),
@password		varchar(100),
@gender			varchar(10),
@salt			varchar(max),
@hash			varchar(max)

as
begin 
	insert into [User](username,fullname,email,dob,age,religion,[password],gender,salt,[hash]) values
				(@username,@fullname,@email,@dob,@age,@religion,@password,@gender,@salt,@hash)
end
select * from [User]


-- STORE PROCEDURE for SELECT USER --

create proc sp_selectUser
@username varchar(50),
@hash varchar(100)
as 
begin
	select username,[Hash] from [User] where username=@username and [Hash]=@hash
end



drop proc sp_selectUser

-- STORE PROCEDURE for SELECT USER by Username--

create proc sp_retriveSaltAgainstUser
@username varchar(50)
as 
begin
	select salt from [User] where username=@username
end

drop proc sp_retriveSaltAgainstUser

select * from [user]


-- Product TABLE --

create table Product
(
	Product_ID			int primary key identity,
	Product_Name		varchar(50),
	[Description]		varchar(500),
	Price				varchar(20),
	Category_ID			int,
	Company_ID			int,
	ImageUrl			varchar(500),
)

drop table Product
select * from Product



-- STORE PROCEDURE for add new product --
create proc sp_addNewProduct
@productName		varchar(50),
@description		varchar(500),
@price				varchar(20),
@categoryID			int,
@companyID			int,
@imageUrl			varchar(500)
as 
begin
	insert into Product values(@productName,@description,@price,@categoryID,@companyID,@imageUrl)
end

drop proc sp_addNewProduct

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




-- Create admin TABLE --

create table [admin]
(
	Admin_ID	int primary key identity,
	username	varchar(50) not null,
	FullName	varchar(50),
	[Password]	varchar(50) not null,
	ImageUrl	varchar(max)
)

drop table admin


-- Store Prcocedures for Admin Table --


-- Store procedure for select all Admin --
create proc sp_selectAdmin 
@username varchar(50),
@password varchar(50)
as
begin
	select * from [admin] where username=@username and [Password]=@password
end

insert into [admin] (username,fullname,password) values('sujan','Nasir Islam Sujan','78526')


drop proc sp_selectAdmin

