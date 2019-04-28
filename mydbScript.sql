create database mydb
use mydb
create table Registration(
RegistrationSerialNo int,
RegistrationDate date ,
ModeOfInformation char(1),
PlaceOfOccurence varchar(200) ,
InvestigatingOfficerName varchar(200)
)
alter from Registration  add column Freeze int(1)

select * from Registration where RegistrationSerialNo=890