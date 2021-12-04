CREATE DATABASE assignment;
use assignment;

/*creating table SalesPeople */
create table SalesPeople(Snum int primary key,Sname varchar(20) unique, City varchar(20), Comm decimal(5,3));

/*Inserting values into SalesPeople */
insert into SalesPeople values(1001,'Peel','London',0.12);
insert into SalesPeople values(1002,'Serres','Sanjose',0.13);
insert into SalesPeople values(1004,'Motika','London',0.11);
insert into SalesPeople values(1007,'Rifkin','Barcelona',0.15);
insert into SalesPeople values(1003,'Axelrod','Newyork',0.10);

 select *from SalesPeople;
 
/*creating table Customers */ 
 create table Customers(Cnum int primary key,Cname varchar(20), City varchar(20) not null,
 Snum int, foreign key(Snum) references SalesPeople(Snum));
 
/*Inserting values into Customers */
insert into Customers values(2001,'Hoffman','London',1001);
insert into Customers values(2002,'Giovanni','Rome',1003);
insert into Customers values(2003,'Liu','Sanjose',1002);
insert into Customers values(2004,'Grass','Berlin',1002);
insert into Customers values(2006,'Clemens','London',1001);
insert into Customers values(2008,'Cisneros','Sanjose',1007);
insert into Customers values(2007,'Pereira','Rome',1004);
   
   select *from Customers;
   
   /*creating table Customers */ 
   create table Orders(Onum int primary key, Amt float(7,2), Odate date,
   Cnum int, foreign key(Cnum) references Customers(Cnum),
   Snum int,foreign key(Snum) references SalesPeople(Snum));
   
   /* inserting values into Orders */
insert into Orders values(3001,18.69,'1990-10-03',2008,1007);
insert into Orders values(3003,767.19,'1990-10-03',2001,1001);
insert into Orders values(3002,1900.10,'1990-10-03',2007,1004);
insert into Orders values(3005,5160.45,'1990-10-03',2003,1002);
insert into Orders values(3006,1098.16,'1990-10-03',2008,1007);
insert into Orders values(3009,1713.23,'1990-10-04',2002,1003);
insert into Orders values(3007,75.75,'1990-10-04',2004,1002);
insert into Orders values(3008,4273.00,'1990-10-05',2006,1001);
insert into Orders values(3010,1309.95,'1990-10-06',2004,1002);
insert into Orders values(3011,9891.88,'1990-10-06',2006,1001);

select *from Orders;

/* Question 1 : Count the number of Salesperson whose name begin with ‘a’/’A’. */   
SELECT COUNT(Sname) FROM SalesPeople WHERE Sname LIKE 'a%';
   
/* Question 2 : Display all the Salesperson whose all orders worth is more than Rs. 2000.   */
SELECT SalesPeople.Sname, SUM(Orders.Amt) AS orders_worth FROM SalesPeople
JOIN Orders ON Orders.Snum=SalesPeople.Snum
GROUP BY Cnum
HAVING SUM(Amt)>2000;


/* Queston 3 : Count the number of Salesperson belonging to Newyork   */
SELECT COUNT(City) FROM salespeople WHERE City='Newyork';


/* Question 4 : Display the number of Salespeople belonging to London and belonging to Paris.  */
SELECT COUNT(City) FROM salespeople WHERE City='London' OR City='Paris';


/* Question 5 : Display the number of orders taken by each Salesperson and their date of orders.  */
SELECT Snum, COUNT(Snum) AS 'No_of_Orders' , GROUP_CONCAT(Odate) AS 'Order_Dates' FROM Orders
GROUP BY Snum;   
   
    







