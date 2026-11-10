create database bank;
use bank;
create table customer(
CustomerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15));
select * from customer;
alter table customer add column DateofBirth date;
alter table customer modify Phone varchar(20);

create table Accounts(
AccountID int,
AccountType varchar(20),
Balance decimal(10,2));
select * from Accounts;
create table Transaction(
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20));
select * from Transaction;
create table Branch(
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15));
select * from Branch;
create table AccountBranches(
AssignmentDate date);
select * from AccountBranches;
create table Loan(
LoanID int,
LoanAmount decimal(10,2),
IntrestRate decimal(5,2),
StartDate date,
EndDate date);
select * from Loan;
 alter table customer add constraint primary key(CustomerID);
 
 alter table customer add constraint foreign key(Accounts) references CustomerID;
 
 alter table customer modify FirstName varchar(50) not null;
 select * from Accounts;
 alter table customer add constraint unique(Email);
alter table Accounts add column CustomerID int;

alter table Accounts add constraint foreign key(CustomerID) references customer(CustomerID);

alter table Loan add constraint foreign key(CustomerID) references customer(customerid);
alter table Loan add column customerid int;
alter table Branch add constraint foreign key(BranchID) references Accounts(CustomerID);

alter table Transaction add constraint foreign key(Account_ID) references Accounts(Account_ID);
insert into customer value(101,"Rahul","Sharma","rahul.sharma@gmail.com",9999999999,19980415);
insert into customer value(102,"Priya","Patil","priya@gmail.com",9988776655,2000920),(103,"Amit","Patel","amit.patel@gmail.com",9876500001,19950618),(104,"Sneha","Joshi","sneha.joshi@gmail.com",9876500002,19970912),(105,"Rohan","Kulkarni","rohan.k@gmail.com",9876500003,19931125);

alter table Accounts add primary key(AccountID);

select * from Accounts where AccountID=201;

insert into Loan value(301,500000.00,8.50,20250115,20300115,101);
insert into Loan value(302,300000.00,9.25,20250210,20280210,102),(303,750000.00,8.70,20250320,20320325,103),
(304,250000.00,10.00,20250405,20290405,104),(305,1000000.00,7.95,20250512,20350512,105);
alter table Transaction add column Account_ID int;
alter table Transaction add constraint foreign key(TransactionID) references Accounts(Account_ID); 
insert into Transaction value(301,20250510,5000.00,"Deposit",201);
insert into Transaction value(302,20250511,2500.00,"Withdraw",202),(303,20250512,10000.00,"Deposit",203),(304,20250513,3000.00,"Withdraw",204),(305,20250514,7000.00,"Deposit",205);


insert into Accounts value(201,"Savings",25000.00,101);
insert into Accounts value(202,"Current",40000.00,102),(203,"Savings",35000.00,103),(204,"Current",60000.00,104),(205,"Savings",45000.00,105);

insert into Branch value(1,"Mumbai Branch","Andheri,Mumabi",0221111111);
insert into Branch value(2,"Pune Branch","Shivaji Nagar,Pune",0202222222),(3,"Nashik Branch","College road,Nashik",0253222222),(4,"Nagpur Branch","Sitabuldi,Nagpur",0712333333),
(5,"NaviMumbai Branch","Vahi,NaviMumbai",0224444444);


select * from customer;

select * from Transaction;
select * from Branch;
select * from Loan;

-- 1 Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.
select AccountID,AccountType,Balance from Accounts;

-- 2 Retrieve Customers with Savings Accounts
select * from Accounts
 where AccountType="Savings";

-- 3 Retrieve Accounts with Balance Greater Than 25000
select * from Accounts
where Balance>25000;

-- 4 Retrieve Transactions Between Specific Amounts 5000 -20000
select * from Accounts
where Balance>5000 and Balance<20000;

-- 5 Retrieve Records for Selected Customers 101,102,103,104
select * from customer
where CustomerID in (101,102,103,104);

-- 6 This displays customers whose names start with the letter R.
select * from customer
where FirstName like "R%";

-- 1 Retrieve all current account records
select * from Accounts
where AccountType="Current";

-- 2 Find accounts with balance less than 15000
select * from Accounts
where Balance<15000;

-- 3 Display transactions between 1000 and 10000
select * from Transaction
where Amount>1000 and Amount<10000;

-- 4 Retrieve customer records for CustomerID 104 and 105
select * from customer
where CustomerID in (104,105);

-- 5 Display customers whose last name starts with S
select * from customer 
where LastName like "S%";

select * from customer where LastName like "S%" ;

select * from customer where LastName like "%a" ;

select * from customer where LastName like "%e%";

select * from customer where FirstName like "A___";

select * from customer where FirstName regexp "^A";

select * from customer where FirstName regexp "t$";

select * from customer where FirstName regexp "amit|rahul";

-- Display Customers in Alphabetical Order
select * from customer 
order by FirstName;

-- Display Accounts with Highest Balance First
select * from Accounts
order by Balance desc limit 1;

-- Retrieve Unique Account Types
select distinct(AccountType) from Accounts;

-- Display Top 3 Highest Balance Accounts
select * from Accounts 
order by Balance desc limit 3;

-- Skip Initial Records While Viewing Transactions
select * from Transaction
order by amount limit 3 offset 1;

-- Display customers sorted by LastName
select * from customer
order by LastName;

-- Retrieve top 5 transactions with highest amount
select * from Transaction
order by Amount desc limit 5;

-- Display unique transaction types
select distinct (TransactionType) from Transaction;

-- Skip the first 3 transaction records and display the next 4 records
select * from Transaction
order by Amount limit 4 offset 3;

-- Find Customers Without Phone Numbers
select * from customer where phone is null;

-- Find Customers Having Email Addresses
select * from customer where email is not null;
 
-- Find customers without email addresses
select * from customer where email is null;

-- Display all accounts where balance information is available
select * from Accounts where balance is not null;
 
-- Search Customers Whose First Name Starts with “A”
select * from customer where FirstName like "A%";

-- Search Customers Whose Email Contains “gmail
select * from customer where Email like "%gmail%";

-- Search Customers Whose Last Name Ends with “kar”
select * from customer where LastName like "%kar";

-- Display customers whose first name starts with R
select * from customer where FirstName like "R%";

-- Find customers whose email contains yahoo
select * from customer where email like "%yahoo%";

-- Display customers whose last name starts with P
select * from customer where LastName like "P%";

-- Search customers whose phone number ends with 99
select * from customer where phone like "%99";

-- Display Savings Account Customers Sorted by Balance Categorize Accounts Using Balance Balance >50000 then premium account Balance >2500 then standar account

select balance,
case
when balance>50000 then "Premium Account"
when balance>2500 then "Standard Account"
else "Normal Account"
end as Category
from Accounts;

-- High Transaction>1000 Medium Transaction>500 Low Transaction based on transaction amount.
select Amount,
case
when Amount>5000 then "High Transaction"
when Amount>2000 then "Medium Transaction"
else "Low Transaction"
end as Transaction_done
from Transaction;
 


