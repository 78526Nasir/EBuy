create database E_Commerce

use E_Commerce


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
	ProductCode			varchar(50) NOT NULL,
	Product_Name		varchar(50) NOT NULL,
	[Description]		varchar(500) NOT NULL,
	Price				varchar(20) NOT NULL,
	Category_ID			INT NOT NULL,
	Company_ID			int NOT NULL,
	ImageUrl			varchar(500),
	
	CONSTRAINT FK_P_CAID FOREIGN KEY(Category_ID)
	REFERENCES Category(Category_ID) ON DELETE CASCADE,
	
	CONSTRAINT FK_P_COID FOREIGN KEY(Company_ID)
	REFERENCES Company(Company_ID) ON DELETE CASCADE
)

DROP TABLE Product

select * from Product



-- STORE PROCEDURE for add new product --
create proc sp_addNewProduct
@productCode		varchar(50),
@productName		varchar(50),
@description		varchar(500),
@price				varchar(20),
@categoryID			int,
@companyID			int,
@imageUrl			varchar(500)
as 
begin
	insert into Product values(@productCode,@productName,@description,@price,@categoryID,@companyID,@imageUrl)
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




-- CREATE admin TABLE --

create table [admin]
(
	Admin_ID	int primary key identity,
	username	varchar(50) not null,
	FullName	varchar(50),
	[Password]	varchar(50) not null,
	ImageUrl	varchar(max)
)

drop table admin


-- STORE PROCEDURE FOR Admin TABLE --

select * from admin

-- STORE PROCEDURE FOR SELECT ADMIN --

create proc sp_selectAdmin 
@username varchar(50),
@password varchar(50)
as
begin
	select * from [admin] where username=@username and [Password]=@password
end

insert into [admin] (username,fullname,password) values('sujan','Nasir Islam Sujan','78526')


drop proc sp_selectAdmin


-- CART TABLE --

CREATE TABLE Cart(
	CartID INT PRIMARY KEY IDENTITY,
	Product_ID INT NOT NULL,
	Quantity  INT NOT NULL,
	
	CONSTRAINT FK_C_PID FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE
	
)

DROP TABLE CART


-- ORDER TABLE --

CREATE TABLE [Order](
	Order_ID			INT PRIMARY KEY IDENTITY,
	[User_ID]			INT NOT NULL,
	Order_Date			DATETIME NOT NULL,
	Order_Amount		INT NOT NULL,
	
	CONSTRAINT FK_O_CID FOREIGN KEY([User_ID]) 
	REFERENCES [User]([User_ID]) ON DELETE CASCADE

)


DROP TABLE [Order] 

CREATE TABLE ProductOrderDetails(
	Product_O_D_ID	INT PRIMARY KEY IDENTITY,
	Order_ID		INT NOT NULL,
	Product_ID		INT NOT NULL,
	Quantity		INT NOT NULL,
	Total_Price		FLOAT NOT NULL,
	
	CONSTRAINT FK_POD_OID FOREIGN KEY(Order_ID) 
	REFERENCES [Order]([Order_ID]) ON DELETE CASCADE,
	
	CONSTRAINT FK_POD_PID FOREIGN KEY(Product_ID) 
	REFERENCES Product(Product_ID) ON DELETE CASCADE

)


Select * from ProductOrderDetails


-- ResetPasswordRequest TABLE FOR RESETTING PASSWORD --

CREATE TABLE ResetPasswordRequest(
	ID			UNIQUEIDENTIFIER PRIMARY KEY,
	[User_ID]	INT NOT NULL,
	[DateTime]	DATETIME,
	
	CONSTRAINT FK_RPR_UID FOREIGN KEY ([User_ID]) 
	REFERENCES [User]([User_ID]) ON DELETE CASCADE  
)

drop table ResetPasswordRequest 

delete from ResetPasswordRequest

select * from ResetPasswordRequest

select * from [user]

-- STORE PROCEDURE FOR RESETTING PASSWORD PROCESS --

CREATE PROC SP_RESET_PASSWORD 
@email varchar(100)
AS
BEGIN
	DECLARE @User_ID INT
	DECLARE @R_Email VARCHAR(100)
	DECLARE @Username VARCHAR(50)
	SELECT @User_ID=[user_id], @R_Email= email, @Username=username
	FROM [User]
	WHERE email=@email
	
	
	IF(@User_ID IS NOT NULL)
		BEGIN
			DECLARE @GUID UNIQUEIDENTIFIER
			SET @GUID=NEWID()
			
			INSERT INTO ResetPasswordRequest VALUES
			(@GUID,@User_ID,GETDATE())
			
			SELECT 1 AS ReturnCode, @GUID AS UniqueID, @R_Email AS Email, @Username as Username
		END
	ELSE 
		BEGIN
			SELECT 0 AS ReturnCode, NULL AS UniqueID, NULL AS Email, @Username as Username
		END
	
END

DROP PROC SP_RESET_PASSWORD


-- STORE PROCEDURE FOR CHECKING LINK VALIDATION --
-- RESET LINK IS VALID FOR ONLY ONE TIME --

select * from ResetPasswordRequest

CREATE PROC SP_IS_PASSWORD_RESET_LINK_VALID '20D7DA02-1EC9-4417-B3DF-9BE959B8EF56'
@GUID UNIQUEIDENTIFIER
AS
BEGIN
	IF(EXISTS(SELECT [USER_ID] FROM ResetPasswordRequest WHERE ID=@GUID))
		BEGIN
			SELECT 1 AS returnCode
		END
	ELSE
		BEGIN
			SELECT 0 AS returnCode
		END
END


SELECT * FROM ResetPasswordRequest


CREATE PROC SP_CHANGE_PASSWORD
@GUID UNIQUEIDENTIFIER,
@password VARCHAR(100),
@salt VARCHAR(MAX),
@hash VARCHAR(MAX)
AS
BEGIN
	DECLARE @UserID INT
	
	SELECT @UserID = [User_ID] 
	FROM ResetPasswordRequest
	WHERE ID=@GUID
	
	IF(@UserID IS NULL)
		BEGIN
			-- IF USER DOES NOT EXISTS
			SELECT 0 AS returnCode	
		END
	ELSE
		BEGIN
			-- IF USER EXISTS, UPDATE WITH NEW PASSWORD,SALT AND HASH
			
			UPDATE [User] SET 
			[password]=@password, salt=@salt, [hash]=@hash
			WHERE [user_id] = @UserID
			
			-- DELETE THE RESET_PASSWORD_REQUEST RECORD 
			DELETE FROM ResetPasswordRequest
			WHERE ID=@GUID
			
			SELECT 1 AS returnCode
		END
END


select * from ResetPasswordRequest

delete from ResetPasswordRequest