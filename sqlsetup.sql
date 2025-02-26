CREATE SCHEMA `deneme` ;
CREATE TABLE `deneme`.`userinfo` (
  `Username` VARCHAR(40) NOT NULL,
  `Password` VARCHAR(40) NULL,
  `Id` int,
  PRIMARY KEY (`Username`));
  
  CREATE TABLE `deneme`.`visits` (
  `username` VARCHAR(40) NOT NULL,
  `countryName` VARCHAR(40) NULL,
  `cityName` VARCHAR(40) NULL,
  `year` INT NULL,
  `season` VARCHAR(40) NULL,
  `bestFeature` VARCHAR(40) NULL,
  `comment` VARCHAR(200) NULL,
  `rating` INT NULL,
  `visitid` VARCHAR(40) not NULL,
  PRIMARY KEY (`visitid`));
  
  CREATE TABLE `deneme`.`sharedvisits` (
  `username` VARCHAR(40) NOT NULL,
  `visitid` VARCHAR(40) not NULL,
  PRIMARY KEY (`username`, `visitid`));


DELIMITER //
create trigger userAdded
before insert on userinfo for each row
begin
	declare tot int;
    select count(*) into tot from userinfo;
    set new.Id =tot+1;
end;

DELIMITER //
create trigger visitAdded
before insert on visits for each row
begin
	declare tot int;
    select count(*) into tot from visits where visits.username=new.username;
    set new.visitid = concat(new.username, "_", tot+1);
end;

insert into userinfo values("irem", "1234", null);
insert into userinfo values("ahmet", "1234", null);

select * from visits;