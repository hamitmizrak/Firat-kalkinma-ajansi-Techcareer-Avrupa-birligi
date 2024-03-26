-- database seç
use nortwind;

-- DQL (select)
-- nortwind databasenden Categories tablosunundaki verileri listeleyelim.
select * from Categories;

-- sadece CategoryID, CategoryName, Description bunlarý görmek istiyorum
select CategoryID, CategoryName, Description from Categories;

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve üstünde olan verileri listeleyelim.
select * from Categories where CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve üstünde olan verileri categoryID'sini küçükten büyüðe doðru listeleyelim. 
select * from Categories where  CategoryID>=5;
select * from Categories where  CategoryID>=5 order by categoryID asc;


-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve üstünde olan verileri categoryID'sini büyükten küçüðe  listeleyelim. 
select * from Categories where  CategoryID>=5 order by categoryID desc;

-- Agreaggate
-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarýsýnda olan verilerin categoryID'lerini toplasýn
select sum(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarýsýnda olan verilerin categoryID'lerden en büyüðünü bulunuz.
select max(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarýsýnda olan verilerin categoryID'lerden en küçüðü bulunuz.
select min(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarýsýnda olan verilerin categoryID'lerden ortalamasý.
select avg(CategoryID) from Categories where  CategoryID>=5;

--------------------------------------------------------------------------------------------------
-- TOP

select top 4 * from Categories;
select top (4) * from Categories;
-- Sondan 4 Category Listesini görelim.
select top (4) * from Categories order by CategoryID desc;

SELECT TOP (4) [CategoryID]
      ,[CategoryName]
      ,[Description]
      ,[Picture]
  FROM [nortwind].[dbo].[Categories]


SELECT TOP (4) * FROM Categories

--------------------------------------------------------------------------------------------------
-- DISTINCT (Veri tekrarýný önlemek için)
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