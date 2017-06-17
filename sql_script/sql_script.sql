create database E_Commerce
use E_Commerce

create table Account(
	username	varchar(50) not null,
	password	varchar(50) not null,
	
	constraint pk_un primary key (username)
)

insert into Account values('Nasir','78526');
insert into Account values('Sujan','2544');

