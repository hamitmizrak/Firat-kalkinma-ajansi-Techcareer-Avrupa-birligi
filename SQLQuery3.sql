-- database se�
use nortwind;

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


-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve �st�nde olan verileri categoryID'sini b�y�kten k����e  listeleyelim. 
select * from Categories where  CategoryID>=5 order by categoryID desc;

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