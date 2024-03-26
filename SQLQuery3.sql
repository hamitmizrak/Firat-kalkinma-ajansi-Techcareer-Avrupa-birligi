--------------------------------------------------------------------------------------------------
-- database se�
use nortwind;


--------------------------------------------------------------------------------------------------
-- DQL (select)
-- nortwind databasenden Categories tablosunundaki verileri listeleyelim.
select * from Categories;

-- sadece CategoryID, CategoryName, Description bunlar� g�rmek istiyorum
select CategoryID, CategoryName, Description from Categories;

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve �st�nde olan verileri listeleyelim.
select * from Categories where CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve �st�nde olan verileri categoryID'sini k���kten b�y��e do�ru listeleyelim. 
select * from Categories where  CategoryID>=5;
select * from Categories where  CategoryID>=5 order by categoryID asc;


--------------------------------------------------------------------------------------------------
-- Order By

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve �st�nde olan verileri categoryID'sini b�y�kten k����e  listeleyelim. 
select * from Categories where  CategoryID>=5 order by categoryID desc;

--------------------------------------------------------------------------------------------------
-- Where Between In Like 

-- Between
--  Nortwind databasesinden Category tablosunu listeyelim.
select * from [nortwind].[dbo].[Categories];

use nortwind
select * from Categories;

--  Nortwind databasesinden Category tablosunundan CategoryId 5 ve yukar�s�ndaki datalar� listeyelim.
select * from Categories where CategoryID>=5;

--  Nortwind databasesinden Category tablosunundan CategoryId 3 ile 6 aras�ndakini listeyelim.
select * from Categories where CategoryID between 3 and 6

--  Nortwind databasesinden Category tablosunundan CategoryId 3 ile 6 aras�ndakini datalar b�y�kten k����e do�ru listeyelim.
select * from Categories where CategoryID between 3 and 6 order by CategoryID desc

-- Like (Filter)
-- nortwind database Categories tablosundaki categoryName sutunundaki ba�lang��� 'B' ile ba�layanlar� listeyelim.
select * from Categories where CategoryName like 'B%';

-- nortwind database Categories tablosundaki categoryName sutunundaki ba�lang��� 's' ile bitenleri listeyelim.
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

-- nortwind database Categories tablosundaki categoryName sutunundaki ba�lang��� 's' ile bitenleri b�y�kten k����e do�ru listeyelim.
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s' order by  cat.CategoryName  desc;

--------------------------------------------------------------------------------------------------
-- Agreaggate
-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukar�s�nda olan verilerin categoryID'lerini toplas�n
select sum(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukar�s�nda olan verilerin categoryID'lerden en b�y���n� bulunuz.
select max(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukar�s�nda olan verilerin categoryID'lerden en k����� bulunuz.
select min(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukar�s�nda olan verilerin categoryID'lerden ortalamas�.
select avg(CategoryID) from Categories where  CategoryID>=5;

--------------------------------------------------------------------------------------------------
-- TOP

select top 4 * from Categories;
select top (4) * from Categories;
-- Sondan 4 Category Listesini g�relim.
select top (4) * from Categories order by CategoryID desc;

SELECT TOP (4) [CategoryID]
      ,[CategoryName]
      ,[Description]
      ,[Picture]
  FROM [nortwind].[dbo].[Categories]


SELECT TOP (4) * FROM Categories

--------------------------------------------------------------------------------------------------
-- DISTINCT (Veri tekrar�n� �nlemek i�in)
select distinct CategoryName from Categories;

--------------------------------------------------------------------------------------------------
-- ALIAS (Takma Ad)

select [nortwind].[dbo].[Categories].[CategoryName] from Categories;
select CategoryName from Categories;
select Categories.CategoryName from Categories;
select cat.CategoryName from Categories as cat;

-- ------------------------------------------------------------------------------------
--  nortwind databasenden Customers tablosunu listeleyelim.
select * from Customers;

-- nortwind databasenden Customers tablosundan sadece CustomerID Listeyelim ?
select CustomerID from Customers;

-- ------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- DML (Data Manipulation Language)

use nortwind;

select * from Categories;

-- Insert
insert into Categories(CategoryName,Description) values('Bilgisayar','MSI')
insert into Categories(CategoryName,Description) values('Bilgisayar','Asus')

-- Update
insert into Categories(CategoryName,Description) values('Laptop','Lenovo')
update Categories SET CategoryName='Laptop', Description='Lenovo 1244' where CategoryID=13

-- Delete
delete from Categories where CategoryID=13