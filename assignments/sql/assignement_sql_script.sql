-- Created database
-------------------------------- 
CREATE DATABASE Assignment;
USE Assignment;

-- created tables Bajaj_Auto, Eicher_Motors, Infosys, Hero_Motocorp, TVS_Motors, TCS
------------------------------------
create table Bajaj_Auto(
	Date date,
	Open_Price float(15,2),
	High_Price float(15,2),
	Low_Price float(15,2),
    Close_Price float(15,2),
    WAP float(15,2),
    No_of_Shares int(15),
    No_of_Trades int(15),
    Total_Turnover_Rs float(25,2),
    Deliverable_Qty int(15),
    Per_Deli_Qty_to_Traded_Qty float(15,2),
    Spread_High_Low float(15,2),
    Spread_Close_Open float(15,2)      
)   ;

create table Eicher_Motors(
	Date date,
	Open_Price float(15,2),
	High_Price float(15,2),
	Low_Price float(15,2),
    Close_Price float(15,2),
    WAP float(15,2),
    No_of_Shares int(15),
    No_of_Trades int(15),
    Total_Turnover_Rs float(25,2),
    Deliverable_Qty int(15),
    Per_Deli_Qty_to_Traded_Qty float(15,2),
    Spread_High_Low float(15,2),
    Spread_Close_Open float(15,2)      
	)   ;

create table Hero_Motocorp(
	Date date,
	Open_Price float(15,2),
	High_Price float(15,2),
	Low_Price float(15,2),
    Close_Price float(15,2),
    WAP float(15,2),
    No_of_Shares int(15),
    No_of_Trades int(15),
    Total_Turnover_Rs float(25,2),
    Deliverable_Qty int(15),
    Per_Deli_Qty_to_Traded_Qty float(15,2),
    Spread_High_Low float(15,2),
    Spread_Close_Open float(15,2)      
	)   ;

create table Infosys(
	Date date,
	Open_Price float(15,2),
	High_Price float(15,2),
	Low_Price float(15,2),
    Close_Price float(15,2),
    WAP float(15,2),
    No_of_Shares int(15),
    No_of_Trades int(15),
    Total_Turnover_Rs float(25,2),
    Deliverable_Qty int(15),
    Per_Deli_Qty_to_Traded_Qty float(15,2),
    Spread_High_Low float(15,2),
    Spread_Close_Open float(15,2)      
	)   ;
    
create table TCS(
	Date date,
	Open_Price float(15,2),
	High_Price float(15,2),
	Low_Price float(15,2),
    Close_Price float(15,2),
    WAP float(15,2),
    No_of_Shares int(15),
    No_of_Trades int(15),
    Total_Turnover_Rs float(25,2),
    Deliverable_Qty int(15),
    Per_Deli_Qty_to_Traded_Qty float(15,2),
    Spread_High_Low float(15,2),
    Spread_Close_Open float(15,2)      
	)   ;

create table TVS_Motors(
	Date date,
	Open_Price float(15,2),
	High_Price float(15,2),
	Low_Price float(15,2),
    Close_Price float(15,2),
    WAP float(15,2),
    No_of_Shares int(15),
    No_of_Trades int(15),
    Total_Turnover_Rs float(25,2),
    Deliverable_Qty int(15),
    Per_Deli_Qty_to_Traded_Qty float(15,2),
    Spread_High_Low float(15,2),
    Spread_Close_Open float(15,2)      
	)   ;

-- Data imported using MySQL Workbench table data import wizard
-- Data correction in given CSV files
--		Date format changed to yyyy-mm-dd
--		column "Deliverable Quantity" and "% Deli. Qty to Traded Qty" was blank for 1 record in each file  
--		and was missed during data import hence update to 0
-----------------------------------------------------------------------------------------------------------------


-- checked the row count of each table it should be 889 
-------------------------------------------------------
select count(*) from Bajaj_Auto;
select count(*) from Eicher_Motors;
select count(*) from Infosys;
select count(*) from Hero_Motocorp;
select count(*) from TVS_Motors;
select count(*) from TCS;

-- created table bajaj1, Eicher1, Infosys1, Hero1, TVS1, TCS1
------------------------------------------------------
create table bajaj1 as 
select    
	Date,
    Close_Price,
    if (row_num > 19, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),NULL) AS 20_Day_MA,
    if (row_num > 49, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),NULL) AS 50_Day_MA
 from (
	select 
		Date,
		Close_Price,
        ROW_NUMBER() OVER (ORDER BY Date ASC) row_num
	from Bajaj_Auto
    ) tmp;

create table Eicher1 as 
select    
	Date,
    Close_Price,
    if (row_num > 19, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),NULL) AS 20_Day_MA,
    if (row_num > 49, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),NULL) AS 50_Day_MA
 from (
	select 
		Date,
		Close_Price,
        ROW_NUMBER() OVER (ORDER BY Date ASC) row_num
	from Eicher_Motors
    ) tmp;

create table Infosys1 as 
select    
	Date,
    Close_Price,
    if (row_num > 19, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),NULL) AS 20_Day_MA,
    if (row_num > 49, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),NULL) AS 50_Day_MA
 from (
	select 
		Date,
		Close_Price,
        ROW_NUMBER() OVER (ORDER BY Date ASC) row_num
	from Infosys
    ) tmp;
         
create table Hero1 as 
select    
	Date,
    Close_Price,
    if (row_num > 19, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),NULL) AS 20_Day_MA,
    if (row_num > 49, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),NULL) AS 50_Day_MA
 from (
	select 
		Date,
		Close_Price,
        ROW_NUMBER() OVER (ORDER BY Date ASC) row_num
	from Hero_Motocorp
    ) tmp;
         
create table TVS1 as 
select    
	Date,
    Close_Price,
    if (row_num > 19, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),NULL) AS 20_Day_MA,
    if (row_num > 49, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),NULL) AS 50_Day_MA
 from (
	select 
		Date,
		Close_Price,
        ROW_NUMBER() OVER (ORDER BY Date ASC) row_num
	from TVS_Motors
    ) tmp;
         
create table TCS1 as 
select    
	Date,
    Close_Price,
    if (row_num > 19, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 19 PRECEDING AND CURRENT ROW),NULL) AS 20_Day_MA,
    if (row_num > 49, AVG(Close_Price) OVER (ORDER BY Date ASC ROWS BETWEEN 49 PRECEDING AND CURRENT ROW),NULL) AS 50_Day_MA
 from (
	select 
		Date,
		Close_Price,
        ROW_NUMBER() OVER (ORDER BY Date ASC) row_num
	from TCS
    ) tmp;  
  
-- checked data in created table bajaj1, Eicher1, Infosys1, Hero1, TVS1, TCS1
------------------------------------------------------------------------------------
select * from bajaj1;
select * from Eicher1;
select * from Infosys1;
select * from Hero1;
select * from TVS1;
select * from TCS1;

-- created master table
-------------------------------
create table master_table as   
SELECT 
bajaj_auto.DATE as Date, 
bajaj_auto.CLOSE_PRICE AS BAJAJ,
tcs.CLOSE_PRICE AS TCS,
tvs_motors.CLOSE_PRICE AS TVS,
infosys.CLOSE_PRICE AS INFOSYS,
eicher_motors.CLOSE_PRICE AS EICHER,
hero_motocorp.CLOSE_PRICE AS HERO
FROM  bajaj_auto, tcs, tvs_motors, infosys, eicher_motors, hero_motocorp 
where bajaj_auto.DATE = tcs.DATE
and bajaj_auto.DATE = tvs_motors.DATE
and bajaj_auto.DATE = infosys.DATE
and bajaj_auto.DATE = eicher_motors.DATE
and bajaj_auto.DATE = hero_motocorp.DATE;

-- check data in created master table
--------------------------------------------------
select * from master_table
where BAJAJ is null or tcs is null or tvs is null or 
INFOSYS is null or EICHER is null or HERO is null;


-- created table bajaj2, Eicher2, Infosys2, Hero2, TVS2, TCS2
--------------------------------------------------------------------
create table bajaj2 as  
select  
	Date,
	Close_Price,
    `Signal`  from (     
		select 
        Date,
        Close_Price,
        20_MA,
        prev_20_MA,
        50_MA,
        prev_50_MA,
		CASE 
			WHEN 20_MA > 50_MA and prev_20_MA < prev_50_MA THEN 'BUY' 
            WHEN 20_MA < 50_MA and prev_20_MA > prev_50_MA THEN 'SELL'
            ELSE 'HOLD'
		END   `Signal`
		from (
			select 
            Date,
            Close_Price,
            round(20_Day_MA,2) 20_MA,
			lag(20_Day_MA ,1) over (order by Date) prev_20_MA,
			round(50_Day_MA,2) 50_MA,
			lag(50_Day_MA ,1) over (order by Date) prev_50_MA 
			from bajaj1
            ) as tmp1
		) as tmp2;


create table Eicher2 as  
select  
	Date,
	Close_Price,
    `Signal`  from (     
		select 
        Date,
        Close_Price,
        20_MA,
        prev_20_MA,
        50_MA,
        prev_50_MA,
		CASE 
			WHEN 20_MA > 50_MA and prev_20_MA < prev_50_MA THEN 'BUY' 
            WHEN 20_MA < 50_MA and prev_20_MA > prev_50_MA THEN 'SELL'
            ELSE 'HOLD'
		END   `Signal`
		from (
			select 
            Date,
            Close_Price,
            round(20_Day_MA,2) 20_MA,
			lag(20_Day_MA ,1) over (order by Date) prev_20_MA,
			round(50_Day_MA,2) 50_MA,
			lag(50_Day_MA ,1) over (order by Date) prev_50_MA 
			from Eicher1
            ) as tmp1
		) as tmp2;
        
create table Infosys2 as  
select  
	Date,
	Close_Price,
    'Signal'  from (     
		select 
        Date,
        Close_Price,
        20_MA,
        prev_20_MA,
        50_MA,
        prev_50_MA,
		CASE 
			WHEN 20_MA > 50_MA and prev_20_MA < prev_50_MA THEN 'BUY' 
            WHEN 20_MA < 50_MA and prev_20_MA > prev_50_MA THEN 'SELL'
            ELSE 'HOLD'
		END   'Signal'
		from (
			select 
            Date,
            Close_Price,
            round(20_Day_MA,2) 20_MA,
			lag(20_Day_MA ,1) over (order by Date) prev_20_MA,
			round(50_Day_MA,2) 50_MA,
			lag(50_Day_MA ,1) over (order by Date) prev_50_MA 
			from Infosys1
            ) as tmp1
		) as tmp2;
        
create table Hero2 as  
select  
	Date,
	Close_Price,
    `Signal`  from (     
		select 
        Date,
        Close_Price,
        20_MA,
        prev_20_MA,
        50_MA,
        prev_50_MA,
		CASE 
			WHEN 20_MA > 50_MA and prev_20_MA < prev_50_MA THEN 'BUY' 
            WHEN 20_MA < 50_MA and prev_20_MA > prev_50_MA THEN 'SELL'
            ELSE 'HOLD'
		END   `Signal`
		from (
			select 
            Date,
            Close_Price,
            round(20_Day_MA,2) 20_MA,
			lag(20_Day_MA ,1) over (order by Date) prev_20_MA,
			round(50_Day_MA,2) 50_MA,
			lag(50_Day_MA ,1) over (order by Date) prev_50_MA 
			from Hero1
            ) as tmp1
		) as tmp2;
        
create table TVS2 as  
select  
	Date,
	Close_Price,
    `Signal`  from (     
		select 
        Date,
        Close_Price,
        20_MA,
        prev_20_MA,
        50_MA,
        prev_50_MA,
		CASE 
			WHEN 20_MA > 50_MA and prev_20_MA < prev_50_MA THEN 'BUY' 
            WHEN 20_MA < 50_MA and prev_20_MA > prev_50_MA THEN 'SELL'
            ELSE 'HOLD'
		END   `Signal`
		from (
			select 
            Date,
            Close_Price,
            round(20_Day_MA,2) 20_MA,
			lag(20_Day_MA ,1) over (order by Date) prev_20_MA,
			round(50_Day_MA,2) 50_MA,
			lag(50_Day_MA ,1) over (order by Date) prev_50_MA 
			from TVS1
            ) as tmp1
		) as tmp2;

create table TCS2 as  
select  
	Date,
	Close_Price,
    `Signal`  from (     
		select 
        Date,
        Close_Price,
        20_MA,
        prev_20_MA,
        50_MA,
        prev_50_MA,
		CASE 
			WHEN 20_MA > 50_MA and prev_20_MA < prev_50_MA THEN 'BUY' 
            WHEN 20_MA < 50_MA and prev_20_MA > prev_50_MA THEN 'SELL'
            ELSE 'HOLD'
		END   `Signal`
		from (
			select 
            Date,
            Close_Price,
            round(20_Day_MA,2) 20_MA,
			lag(20_Day_MA ,1) over (order by Date) prev_20_MA,
			round(50_Day_MA,2) 50_MA,
			lag(50_Day_MA ,1) over (order by Date) prev_50_MA 
			from TCS1
            ) as tmp1
		) as tmp2;
        
        
-- check created table bajaj2, Eicher2, Infosys2, Hero2, TVS2, TCS2
select * from bajaj2;
select * from Eicher2;
select * from Infosys2;
select * from Hero2;
select * from TVS2;
select * from TCS2;

-- created user define function
-----------------------------------

DELIMITER $$
CREATE   FUNCTION Bajaj_stock_signal(stock_date date) RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE stock_signal varchar(30);
	SELECT `signal` INTO stock_signal FROM bajaj2 WHERE date = stock_date;
    IF stock_signal IS NULL  THEN
		RETURN ('data not found ');
     ELSE   
		RETURN (stock_signal);
    END IF;   
END;


-- checked funtion call
----------------------- 
SELECT Bajaj_stock_signal (date('2015-01-01')) as Bajaj_SCheck;


