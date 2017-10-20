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
	Name				varchar(50),
	[Description]		varchar(500),
	Price				varchar(20),
	ImageUrl			varchar(500),
	Category_ID			int
)

drop table Product


-- Category TABLE --

create table Category
(
	Category_ID				int primary key identity,
	Category_Name			varchar(50),
	Category_Description	varchar(500)
)

drop table Category
select * from Category

-- Store Procedure for insert data into Category TABLE --
create proc sp_addNewCategory
@categoryName varchar(50),
@categoryDesc varchar(500)

as
begin
	insert into Category values(@categoryName,@categoryDesc)
end