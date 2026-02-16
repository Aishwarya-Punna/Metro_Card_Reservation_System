====================================================================
-- CREATING DATABASE WITH THE NAME OF METRO_CARD_RESERVATION_SYSTEM.
====================================================================
create database metro_card_reservation_system;

===============================================
-- USING DATABASE METRO_CARD_RESERVATION_SYSTEM.
===============================================

mysql> use metro_card_reservation_system;
Database changed

=============================
-- CREATING METRO_CARDS TABLE.
=============================


mysql> create table Metro_Cards(
    -> card_id int auto_increment primary key,
    -> card_number varchar(20),
    -> card_type enum('student','regular','tourist'),
    -> balance decimal(10,2),
    -> expiry_date date);;
Query OK, 0 rows affected (0.06 sec)

================================
-- DESCRIBING METRO_CARDS TABLE.
================================
ysql> describe metro_cards;
+-------------+-------------------------------------+------+-----+---------+----------------+
| Field       | Type                                | Null | Key | Default | Extra          |
+-------------+-------------------------------------+------+-----+---------+----------------+
| card_id     | int                                 | NO   | PRI | NULL    | auto_increment |
| card_number | varchar(20)                         | YES  |     | NULL    |                |
| card_type   | enum('student','regular','tourist') | YES  |     | NULL    |                |
| balance     | decimal(10,2)                       | YES  |     | NULL    |                |
| expiry_date | date                                | YES  |     | NULL    |                |
+-------------+-------------------------------------+------+-----+---------+----------------+
5 rows in set (0.02 sec)

===========================================================
-- ALTERING THE ATTRIBUTE FROM NORMAL TO UNIQUE CONSTRAINT.
===========================================================
mysql> alter table metro_cards add unique (card_number);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

================================
-- DESCRIBING METRO_CARDS TABLE.
================================
mysql> describe metro_cards;
+-------------+-------------------------------------+------+-----+---------+----------------+
| Field       | Type                                | Null | Key | Default | Extra          |
+-------------+-------------------------------------+------+-----+---------+----------------+
| card_id     | int                                 | NO   | PRI | NULL    | auto_increment |
| card_number | varchar(20)                         | YES  | UNI | NULL    |                |
| card_type   | enum('student','regular','tourist') | YES  |     | NULL    |                |
| balance     | decimal(10,2)                       | YES  |     | NULL    |                |
| expiry_date | date                                | YES  |     | NULL    |                |
+-------------+-------------------------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

=========================================
-- CREATING TABLE WITH THE NAME OF USERS.
=========================================

mysql> create table Users(user_id int auto_increment primary key, name varchar(30),phone_number varchar(10) check (phone_number regexp '^[6-9][0-9]{9}$'), email varchar(50) check( email like '%@gmail.com'));
Query OK, 0 rows affected (0.03 sec)

==========================
-- DESCRIBING USERS TABLE.
==========================
mysql> desc users;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| user_id      | int         | NO   | PRI | NULL    | auto_increment |
| name         | varchar(30) | YES  |     | NULL    |                |
| phone_number | varchar(10) | YES  |     | NULL    |                |
| email        | varchar(50) | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

=========================================
-- CREATING THE TABLE WITH NAME OF TRIPS.
=========================================

mysql> create table Trips( trip_id int auto_increment primary key, card_id int, source_station varchar(50), destination_station varchar(50), travel_date date, fare decimal(10,2), foreign key (card_id) references Metro_Cards(card_id) );
Query OK, 0 rows affected (0.06 sec)

==========================
-- DESCRIBING TRIPS TABLE.
==========================

mysql> desc trips;
+---------------------+---------------+------+-----+---------+----------------+
| Field               | Type          | Null | Key | Default | Extra          |
+---------------------+---------------+------+-----+---------+----------------+
| trip_id             | int           | NO   | PRI | NULL    | auto_increment |
| card_id             | int           | YES  | MUL | NULL    |                |
| source_station      | varchar(50)   | YES  |     | NULL    |                |
| destination_station | varchar(50)   | YES  |     | NULL    |                |
| travel_date         | date          | YES  |     | NULL    |                |
| fare                | decimal(10,2) | YES  |     | NULL    |                |
+---------------------+---------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

================================================
-- CREATING THE TABLE WITH NAME OF TRANSACTIONS.
================================================

mysql> create table Transactions ( transaction_id int auto_increment primary key, card_id int, transaction_type enum('top-up','fare-deduction'), amount decimal(10,2), transaction_date timestamp default current_timestamp, foreign key (card_id) references Metro_Cards(card_id) );
Query OK, 0 rows affected (0.25 sec)

=================================
-- DESCRIBING TRANSACTIONS TABLE.
=================================

mysql> desc transactions;
+------------------+---------------------------------+------+-----+-------------------+-------------------+
| Field            | Type                            | Null | Key | Default           | Extra             |
+------------------+---------------------------------+------+-----+-------------------+-------------------+
| transaction_id   | int                             | NO   | PRI | NULL              | auto_increment    |
| card_id          | int                             | YES  | MUL | NULL              |                   |
| transaction_type | enum('top-up','fare-deduction') | YES  |     | NULL              |                   |
| amount           | decimal(10,2)                   | YES  |     | NULL              |                   |
| transaction_date | timestamp                       | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+------------------+---------------------------------+------+-----+-------------------+-------------------+
5 rows in set (0.00 sec)

====================================================
-- INSERTING THE RECORDS INTO THE METRO_CARDS TABLE.
====================================================

INSERT INTO Metro_Cards (card_id, card_number, card_type, balance, expiry_date)
VALUES 
(1, 'AISHWARA001', 'student', 500.00, '2026-12-31'),
(2, 'YUVATEJA002', 'regular', 300.00, '2026-11-30'),
(3, 'BINDUMADHAVI003', 'tourist', 150.00, '2026-10-15'),
(4, 'VANI004', 'regular', 400.00, '2026-09-20'),
(5, 'VEERAJ005', 'student', 600.00, '2026-12-01');

===================================================
-- RETRIVING THE RECORDS FROM THE METRO_CARDS TABLE
===================================================

mysql> select * from metro_cards;
+---------+-----------------+-----------+---------+-------------+
| card_id | card_number     | card_type | balance | expiry_date |
+---------+-----------------+-----------+---------+-------------+
|       1 | AISHWARA001     | student   |  500.00 | 2026-12-31  |
|       2 | YUVATEJA002     | regular   |  300.00 | 2026-11-30  |
|       3 | BINDUMADHAVI003 | tourist   |  150.00 | 2026-10-15  |
|       4 | VANI004         | regular   |  400.00 | 2026-09-20  |
|       5 | VEERAJ005       | student   |  600.00 | 2026-12-01  |
+---------+-----------------+-----------+---------+-------------+
5 rows in set (0.01 sec)

==============================================
-- INSERTING THE RECORDS INTO THE USERS TABLE.
==============================================

mysql> INSERT INTO Users (name, phone_number, email)
    -> VALUES
    -> ('Aishwarya', '9876543210', 'aishwara@gmail.com'),
    -> ('Yuvateja', '9123456789', 'yuvateja@gmail.com'),
    -> ('Bindu Madhavi', '9988776655', 'bindumadhavi@gmail.com'),
    -> ('Vani', '9012345678', 'vani@gmail.com'),
    -> ('Veeraj', '9098765432', 'veeraj@gmail.com');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0


=============================================
-- RETRIVING THE RECORDS FROM THE USERS TABLE
=============================================

mysql> select * from users;
+---------+---------------+--------------+------------------------+
| user_id | name          | phone_number | email                  |
+---------+---------------+--------------+------------------------+
|       1 | Aishwarya     | 9876543210   | aishwara@gmail.com     |
|       2 | Yuvateja      | 9123456789   | yuvateja@gmail.com     |
|       3 | Bindu Madhavi | 9988776655   | bindumadhavi@gmail.com |
|       4 | Vani          | 9012345678   | vani@gmail.com         |
|       5 | Veeraj        | 9098765432   | veeraj@gmail.com       |
+---------+---------------+--------------+------------------------+
5 rows in set (0.00 sec)

==============================================
-- INSERTING THE RECORDS INTO THE TRIPS TABLE.
==============================================

mysql> INSERT INTO Trips (card_id, source_station, destination_station, travel_date, fare)
    -> VALUES
    -> (1, 'Hayathnagar', 'LB Nagar', '2026-02-15', 25.00),
    -> (2, 'LB Nagar', 'Miyapur', '2026-02-14', 45.00),
    -> (3, 'Nagole', 'Ameerpet', '2026-02-13', 35.00),
    -> (4, 'Kukatpally', 'Secunderabad', '2026-02-12', 40.00),
    -> (5, 'Miyapur', 'Raidurg', '2026-02-11', 30.00);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

=============================================
-- RETRIVING THE RECORDS FROM THE TRIPS TABLE
=============================================

mysql> select * from Trips;
+---------+---------+----------------+---------------------+-------------+-------+
| trip_id | card_id | source_station | destination_station | travel_date | fare  |
+---------+---------+----------------+---------------------+-------------+-------+
|       1 |       1 | Hayathnagar    | LB Nagar            | 2026-02-15  | 25.00 |
|       2 |       2 | LB Nagar       | Miyapur             | 2026-02-14  | 45.00 |
|       3 |       3 | Nagole         | Ameerpet            | 2026-02-13  | 35.00 |
|       4 |       4 | Kukatpally     | Secunderabad        | 2026-02-12  | 40.00 |
|       5 |       5 | Miyapur        | Raidurg             | 2026-02-11  | 30.00 |
+---------+---------+----------------+---------------------+-------------+-------+
5 rows in set (0.00 sec)

====================================================
-- INSERTING THE RECORDS INTO THE TRANSACTIONS TABLE.
====================================================

mysql> INSERT INTO Transactions (card_id, transaction_type, amount)
    -> VALUES
    -> (1, 'top-up', 200.00),
    -> (1, 'fare-deduction', 25.00),
    -> (2, 'top-up', 300.00),
    -> (3, 'fare-deduction', 35.00),
    -> (4, 'top-up', 150.00),
    -> (5, 'fare-deduction', 40.00);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

====================================================
-- RETRIVING THE RECORDS FROM THE TRANSACTIONS TABLE
====================================================

mysql> select * from Transactions;
+----------------+---------+------------------+--------+---------------------+
| transaction_id | card_id | transaction_type | amount | transaction_date    |
+----------------+---------+------------------+--------+---------------------+
|              1 |       1 | top-up           | 200.00 | 2026-02-15 18:45:29 |
|              2 |       1 | fare-deduction   |  25.00 | 2026-02-15 18:45:29 |
|              3 |       2 | top-up           | 300.00 | 2026-02-15 18:45:29 |
|              4 |       3 | fare-deduction   |  35.00 | 2026-02-15 18:45:29 |
|              5 |       4 | top-up           | 150.00 | 2026-02-15 18:45:29 |
|              6 |       5 | fare-deduction   |  40.00 | 2026-02-15 18:45:29 |
+----------------+---------+------------------+--------+---------------------+
6 rows in set (0.00 sec)

======================================
-- PERFORMING THE AGGREGATE FUNCTIONS.
======================================

=================
-- COUNT FUNCTION
=================

mysql> select count(*) as Total_Count from Transactions;
+-------------+
| Total_Count |
+-------------+
|           6 |
+-------------+
1 row in set (0.00 sec)

=================================================================================
-- PERFORMING COUNT, SUM,AVERAGE,MAXIMUM,MINIMUM FUNCTIONS FOR METRO_CARDS TABLE.
=================================================================================

mysql> select count(*) as No_Of_Balances, sum(balance) as Total_Sum, avg(balance) as Avg_Bal, Max(balance) as Max_Bal, Min(balance) as Min_Bal from Metro_cards;
+----------------+-----------+------------+---------+---------+
| No_Of_Balances | Total_Sum | Avg_Bal    | Max_Bal | Min_Bal |
+----------------+-----------+------------+---------+---------+
|              5 |   1950.00 | 390.000000 |  600.00 |  150.00 |
+----------------+-----------+------------+---------+---------+
1 row in set (0.00 sec)

===========================================================================
-- PERFORMING COUNT, SUM,AVERAGE,MAXIMUM,MINIMUM FUNCTIONS FOR TRIPS TABLE.
===========================================================================

mysql>  select count(*) as No_Of_Fares, sum(fare) as Total_Fare, avg(fare) as Avg_Fare, Max(fare) as Max_Fare, Min(fare) as Min_Fare from Trips;
+-------------+------------+-----------+----------+----------+
| No_Of_Fares | Total_Fare | Avg_Fare  | Max_Fare | Min_Fare |
+-------------+------------+-----------+----------+----------+
|           5 |     175.00 | 35.000000 |    45.00 |    25.00 |
+-------------+------------+-----------+----------+----------+
1 row in set (0.00 sec)

=================================================================================
-- PERFORMING COUNT, SUM,AVERAGE,MAXIMUM,MINIMUM FUNCTIONS FOR TRANSACTIONS TABLE.
=================================================================================

mysql>  select count(*) as No_Of_Amounts, sum(amount) as Total_Amount, avg(amount) as Avg_Amount, Max(amount) as Max_Amount, Min(amount) as Min_Amount from Transactions;
+---------------+--------------+------------+------------+------------+
| No_Of_Amounts | Total_Amount | Avg_Amount | Max_Amount | Min_Amount |
+---------------+--------------+------------+------------+------------+
|             6 |       750.00 | 125.000000 |     300.00 |      25.00 |
+---------------+--------------+------------+------------+------------+
1 row in set (0.00 sec)

============================
-- PERFORMING LIKE OPERATOR.
============================

mysql> select * from users where names like 'v%';

===================================================
-- GETTING ERROR FOR UNKNOWN COLUMN IN USERS TABLE.
===================================================

ERROR 1054 (42S22): Unknown column 'names' in 'where clause'

============================
-- PERFORMING LIKE OPERATOR.
============================

mysql> select * from users where name like 'v%';
+---------+--------+--------------+------------------+
| user_id | name   | phone_number | email            |
+---------+--------+--------------+------------------+
|       4 | Vani   | 9012345678   | vani@gmail.com   |
|       5 | Veeraj | 9098765432   | veeraj@gmail.com |
+---------+--------+--------------+------------------+
2 rows in set (0.00 sec)

================================
-- PERFORMING NOT LIKE OPERATOR.
================================

mysql> select * from users where name  not like 'v%';
+---------+---------------+--------------+------------------------+
| user_id | name          | phone_number | email                  |
+---------+---------------+--------------+------------------------+
|       1 | Aishwarya     | 9876543210   | aishwara@gmail.com     |
|       2 | Yuvateja      | 9123456789   | yuvateja@gmail.com     |
|       3 | Bindu Madhavi | 9988776655   | bindumadhavi@gmail.com |
+---------+---------------+--------------+------------------------+
3 rows in set (0.00 sec)

=====================================================
-- PERFORMING NOT LIKE OPERATOR FOR SINGLE CHARACTER.
=====================================================

mysql> select * from users where name  not like 'y';
+---------+---------------+--------------+------------------------+
| user_id | name          | phone_number | email                  |
+---------+---------------+--------------+------------------------+
|       1 | Aishwarya     | 9876543210   | aishwara@gmail.com     |
|       2 | Yuvateja      | 9123456789   | yuvateja@gmail.com     |
|       3 | Bindu Madhavi | 9988776655   | bindumadhavi@gmail.com |
|       4 | Vani          | 9012345678   | vani@gmail.com         |
|       5 | Veeraj        | 9098765432   | veeraj@gmail.com       |
+---------+---------------+--------------+------------------------+
5 rows in set (0.00 sec)

===================
-- MATCH EXACT 'y'.
===================

mysql> select * from users where name   like 'y';
Empty set (0.00 sec)

================================
-- MATCH 'y' PLUS ONE CHARACTER.
================================

mysql> select * from users where name   like 'y_';
Empty set (0.00 sec)

================================
-- MATCH 'Y' PLUS ONE CHARACTER.
================================

mysql> select * from users where name   like 'Y_';
Empty set (0.00 sec)

====================================
-- MATCH 'Y' FOLLOWED BY ANY STRING.
====================================

mysql> select * from users where name   like 'Y_%';
+---------+----------+--------------+--------------------+
| user_id | name     | phone_number | email              |
+---------+----------+--------------+--------------------+
|       2 | Yuvateja | 9123456789   | yuvateja@gmail.com |
+---------+----------+--------------+--------------------+
1 row in set (0.00 sec)

=============================
-- MATCH EXACT NAME 'THANVI'.
=============================

mysql> select * from users where name='thanvi';
Empty set (0.00 sec)

=======================
-- FARE RANGE 30 TO 40.
=======================

mysql> select * from trips where fare between 30 and 40;
+---------+---------+----------------+---------------------+-------------+-------+
| trip_id | card_id | source_station | destination_station | travel_date | fare  |
+---------+---------+----------------+---------------------+-------------+-------+
|       3 |       3 | Nagole         | Ameerpet            | 2026-02-13  | 35.00 |
|       4 |       4 | Kukatpally     | Secunderabad        | 2026-02-12  | 40.00 |
|       5 |       5 | Miyapur        | Raidurg             | 2026-02-11  | 30.00 |
+---------+---------+----------------+---------------------+-------------+-------+
3 rows in set (0.00 sec)

=========================
-- FARE OUTSIDE 30 TO 40.
=========================

mysql> select * from trips where fare not between 30 and 40;
+---------+---------+----------------+---------------------+-------------+-------+
| trip_id | card_id | source_station | destination_station | travel_date | fare  |
+---------+---------+----------------+---------------------+-------------+-------+
|       1 |       1 | Hayathnagar    | LB Nagar            | 2026-02-15  | 25.00 |
|       2 |       2 | LB Nagar       | Miyapur             | 2026-02-14  | 45.00 |
+---------+---------+----------------+---------------------+-------------+-------+
2 rows in set (0.00 sec)

========================================
-- PERFORMING STRING AND DATE FUNCTIONS.
========================================

========================
-- STATION NAME LENGTHS.
========================

mysql> select source_station, length(source_station) as Source_Station_Len, destination_station, length(destination_station) as Dest_Stat_Len from Trips;
+----------------+--------------------+---------------------+---------------+
| source_station | Source_Station_Len | destination_station | Dest_Stat_Len |
+----------------+--------------------+---------------------+---------------+
| Hayathnagar    |                 11 | LB Nagar            |             8 |
| LB Nagar       |                  8 | Miyapur             |             7 |
| Nagole         |                  6 | Ameerpet            |             8 |
| Kukatpally     |                 10 | Secunderabad        |            12 |
| Miyapur        |                  7 | Raidurg             |             7 |
+----------------+--------------------+---------------------+---------------+
5 rows in set (0.00 sec)

===================================
-- SOURCE STATION LEFT/RIGHT PARTS.
===================================

mysql> select source_station, left(source_station,5) as Short_Name_Of_Src_Sts_Left , right(source_station,5) as Short_Name_Of_Src_Sts_Right from trips;
+----------------+----------------------------+-----------------------------+
| source_station | Short_Name_Of_Src_Sts_Left | Short_Name_Of_Src_Sts_Right |
+----------------+----------------------------+-----------------------------+
| Hayathnagar    | Hayat                      | nagar                       |
| LB Nagar       | LB Na                      | Nagar                       |
| Nagole         | Nagol                      | agole                       |
| Kukatpally     | Kukat                      | pally                       |
| Miyapur        | Miyap                      | yapur                       |
+----------------+----------------------------+-----------------------------+
5 rows in set (0.00 sec)

================================
-- REVERSED DESTINATION STATION.
================================

mysql> select destination_station , reverse(destination_station) from Trips;
+---------------------+------------------------------+
| destination_station | reverse(destination_station) |
+---------------------+------------------------------+
| LB Nagar            | ragaN BL                     |
| Miyapur             | rupayiM                      |
| Ameerpet            | tepreemA                     |
| Secunderabad        | dabarednuceS                 |
| Raidurg             | grudiaR                      |
+---------------------+------------------------------+
5 rows in set (0.00 sec)

===========================
-- - NAME CASE CONVERSIONS.
===========================

mysql> select name as Actual_Defined_Names, upper(name) as Upper_Case_Names, lower(name) as Lower_Case_Names from users;
+----------------------+------------------+------------------+
| Actual_Defined_Names | Upper_Case_Names | Lower_Case_Names |
+----------------------+------------------+------------------+
| Aishwarya            | AISHWARYA        | aishwarya        |
| Yuvateja             | YUVATEJA         | yuvateja         |
| Bindu Madhavi        | BINDU MADHAVI    | bindu madhavi    |
| Vani                 | VANI             | vani             |
| Veeraj               | VEERAJ           | veeraj           |
+----------------------+------------------+------------------+
5 rows in set (0.00 sec)

==============================
-- EMAIL SUBSTRING EXTRACTION.
==============================

mysql> select email, substring(email, 3,9) as Email_SubString from users;
+------------------------+-----------------+
| email                  | Email_SubString |
+------------------------+-----------------+
| aishwara@gmail.com     | shwara@gm       |
| yuvateja@gmail.com     | vateja@gm       |
| bindumadhavi@gmail.com | ndumadhav       |
| vani@gmail.com         | ni@gmail.       |
| veeraj@gmail.com       | eraj@gmai       |
+------------------------+-----------------+
5 rows in set (0.00 sec)

=====================
-- CURRENT DATE ONLY.
=====================

mysql> select curdate() as Current_Day_Trips from Trips;
+-------------------+
| Current_Day_Trips |
+-------------------+
| 2026-02-15        |
| 2026-02-15        |
| 2026-02-15        |
| 2026-02-15        |
| 2026-02-15        |
+-------------------+
5 rows in set (0.00 sec)

mysql> select curdate(travel_date) as Current_Day_Trips from Trips;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'travel_date) as Current_Day_Trips from Trips' at line 1

=================================
-- TRAVEL DATE WITH CURRENT DATE.
=================================

mysql> select travel_date, curdate() as Current_Day_Trips from Trips;
+-------------+-------------------+
| travel_date | Current_Day_Trips |
+-------------+-------------------+
| 2026-02-15  | 2026-02-15        |
| 2026-02-14  | 2026-02-15        |
| 2026-02-13  | 2026-02-15        |
| 2026-02-12  | 2026-02-15        |
| 2026-02-11  | 2026-02-15        |
+-------------+-------------------+
5 rows in set (0.00 sec)

==============================
-- UNION DISTINCT IDENTIFIERS.
==============================

mysql> -- union
mysql> SELECT name AS identifier FROM Users
    -> UNION
    -> SELECT card_number AS identifier FROM Metro_Cards;
+-----------------+
| identifier      |
+-----------------+
| Aishwarya       |
| Yuvateja        |
| Bindu Madhavi   |
| Vani            |
| Veeraj          |
| AISHWARA001     |
| BINDUMADHAVI003 |
| VANI004         |
| VEERAJ005       |
| YUVATEJA002     |
+-----------------+
10 rows in set (0.00 sec)

=========================
-- UNION ALL IDENTIFIERS.
=========================

mysql> SELECT name AS identifier FROM Users
    -> UNION all
    -> SELECT card_number AS identifier FROM Metro_Cards;
+-----------------+
| identifier      |
+-----------------+
| Aishwarya       |
| Yuvateja        |
| Bindu Madhavi   |
| Vani            |
| Veeraj          |
| AISHWARA001     |
| BINDUMADHAVI003 |
| VANI004         |
| VEERAJ005       |
| YUVATEJA002     |
+-----------------+
10 rows in set (0.00 sec)

======================
-- INTERSECT CARD IDS.
======================
mysql> -- intersect
mysql> SELECT card_id FROM Trips
    -> WHERE card_id IN (SELECT card_id FROM Transactions);
+---------+
| card_id |
+---------+
|       1 |
|       2 |
|       3 |
|       4 |
|       5 |
+---------+
5 rows in set (0.01 sec)

==========================================================
--  USERS WITH CARDS BALANCE ABOVE 400 USING NESTED QUERY.
==========================================================

mysql> -- nested queries
mysql> SELECT name FROM Users
    -> WHERE user_id IN (
    ->     SELECT card_id FROM Metro_Cards WHERE balance > 400
    -> );
+-----------+
| name      |
+-----------+
| Aishwarya |
| Veeraj    |
+-----------+
2 rows in set (0.00 sec)

mysql> exists/not exists
    -> -- ;
    -> ^C

========================
-- USERS WHO HAVE TRIPS.
========================

mysql> SELECT name FROM Users u
    -> WHERE EXISTS (
    ->     SELECT 1 FROM Trips t WHERE t.card_id = u.user_id
    -> );
+---------------+
| name          |
+---------------+
| Aishwarya     |
| Yuvateja      |
| Bindu Madhavi |
| Vani          |
| Veeraj        |
+---------------+
5 rows in set (0.00 sec)

=======================
-- USERS WITHOUT TRIPS.
=======================

mysql> -- not exists
mysql> SELECT name FROM Users u
    -> WHERE NOT EXISTS (
    ->     SELECT 1 FROM Trips t WHERE t.card_id = u.user_id
    -> );
Empty set (0.00 sec)

===============
-- USING JOINS.
===============

mysql> -- joins

=================
-- 1. INNER JOIN.
=================

mysql> -- 1. inner join
mysql> SELECT u.name, m.card_number, t.source_station, t.destination_station
    -> FROM Users u
    -> JOIN Metro_Cards m ON u.user_id = m.card_id
    -> JOIN Trips t ON m.card_id = t.card_id;
+---------------+-----------------+----------------+---------------------+
| name          | card_number     | source_station | destination_station |
+---------------+-----------------+----------------+---------------------+
| Aishwarya     | AISHWARA001     | Hayathnagar    | LB Nagar            |
| Yuvateja      | YUVATEJA002     | LB Nagar       | Miyapur             |
| Bindu Madhavi | BINDUMADHAVI003 | Nagole         | Ameerpet            |
| Vani          | VANI004         | Kukatpally     | Secunderabad        |
| Veeraj        | VEERAJ005       | Miyapur        | Raidurg             |
+---------------+-----------------+----------------+---------------------+
5 rows in set (0.00 sec)

================
-- 2. LEFT JOIN.
================

mysql> -- 2. Left join
mysql> SELECT u.name, t.source_station
    -> FROM Users u
    -> LEFT JOIN Trips t ON u.user_id = t.card_id;
+---------------+----------------+
| name          | source_station |
+---------------+----------------+
| Aishwarya     | Hayathnagar    |
| Yuvateja      | LB Nagar       |
| Bindu Madhavi | Nagole         |
| Vani          | Kukatpally     |
| Veeraj        | Miyapur        |
+---------------+----------------+
5 rows in set (0.00 sec)

=================
-- 3. RIGHT JOIN.
=================

mysql> -- 3. Right Join
mysql> SELECT u.name, t.source_station
    -> FROM Users u
    -> RIGHT JOIN Trips t ON u.user_id = t.card_id;
+---------------+----------------+
| name          | source_station |
+---------------+----------------+
| Aishwarya     | Hayathnagar    |
| Yuvateja      | LB Nagar       |
| Bindu Madhavi | Nagole         |
| Vani          | Kukatpally     |
| Veeraj        | Miyapur        |
+---------------+----------------+
5 rows in set (0.00 sec)

================
-- 4. SELF JOIN.
================

mysql> -- 4. self join
mysql> SELECT u.name, t.source_station
    -> FROM Users u
    -> RIGHT JOIN Trips t ON u.user_id = t.card_id;
+---------------+----------------+
| name          | source_station |
+---------------+----------------+
| Aishwarya     | Hayathnagar    |
| Yuvateja      | LB Nagar       |
| Bindu Madhavi | Nagole         |
| Vani          | Kukatpally     |
| Veeraj        | Miyapur        |
+---------------+----------------+
5 rows in set (0.00 sec)

=================
-- 5. OUTER JOIN.
=================

mysql> -- 5. outer join
mysql> SELECT u.name, t.source_station, t.destination_station
    -> FROM Users u
    -> LEFT JOIN Trips t ON u.user_id = t.card_id;
+---------------+----------------+---------------------+
| name          | source_station | destination_station |
+---------------+----------------+---------------------+
| Aishwarya     | Hayathnagar    | LB Nagar            |
| Yuvateja      | LB Nagar       | Miyapur             |
| Bindu Madhavi | Nagole         | Ameerpet            |
| Vani          | Kukatpally     | Secunderabad        |
| Veeraj        | Miyapur        | Raidurg             |
+---------------+----------------+---------------------+
5 rows in set (0.00 sec)

=================
-- 6. CROSS JOIN.
=================
 
mysql> -- 6.Cross Join
mysql> SELECT u.name, m.card_number
    -> FROM Users u
    -> CROSS JOIN Metro_Cards m;
+---------------+-----------------+
| name          | card_number     |
+---------------+-----------------+
| Veeraj        | AISHWARA001     |
| Vani          | AISHWARA001     |
| Bindu Madhavi | AISHWARA001     |
| Yuvateja      | AISHWARA001     |
| Aishwarya     | AISHWARA001     |
| Veeraj        | BINDUMADHAVI003 |
| Vani          | BINDUMADHAVI003 |
| Bindu Madhavi | BINDUMADHAVI003 |
| Yuvateja      | BINDUMADHAVI003 |
| Aishwarya     | BINDUMADHAVI003 |
| Veeraj        | VANI004         |
| Vani          | VANI004         |
| Bindu Madhavi | VANI004         |
| Yuvateja      | VANI004         |
| Aishwarya     | VANI004         |
| Veeraj        | VEERAJ005       |
| Vani          | VEERAJ005       |
| Bindu Madhavi | VEERAJ005       |
| Yuvateja      | VEERAJ005       |
| Aishwarya     | VEERAJ005       |
| Veeraj        | YUVATEJA002     |
| Vani          | YUVATEJA002     |
| Bindu Madhavi | YUVATEJA002     |
| Yuvateja      | YUVATEJA002     |
| Aishwarya     | YUVATEJA002     |
+---------------+-----------------+
25 rows in set (0.00 sec)



