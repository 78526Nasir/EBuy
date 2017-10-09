create database E_Commerce
use E_Commerce

create table Account(
	username	varchar(50) not null,
	password	varchar(50) not null,
	
	constraint pk_un primary key (username)
)

insert into Account values('Nasir','78526');
insert into Account values('Sujan','2544');

create table [User](
	--string username, string fullName, string email, string dob, string religion, 
	--string password, string gender
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