--------------------------------------------------------------------------------------------------
-- database sec
use nortwind;


--------------------------------------------------------------------------------------------------
-- DQL (select)
-- nortwind databasenden Categories tablosunundaki verileri listeleyelim.
select * from Categories;

-- sadece CategoryID, CategoryName, Description bunlari gormek istiyorum
select CategoryID, CategoryName, Description from Categories;

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve ustunde olan verileri listeleyelim.
select * from Categories where CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve ustunde olan verileri categoryID'sini kucukten buyuge dogru listeleyelim. 
select * from Categories where  CategoryID>=5;
select * from Categories where  CategoryID>=5 order by categoryID asc;


--------------------------------------------------------------------------------------------------
-- Order By

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve ustunde olan verileri categoryID'sini buyukten kucuge  listeleyelim. 
select * from Categories where  CategoryID>=5 order by categoryID desc;

--------------------------------------------------------------------------------------------------
-- Where Between In Like 

-- Between
-- Nortwind databasesinden Category tablosunu listeyelim.
select * from [nortwind].[dbo].[Categories];

use nortwind
select * from Categories;

--  Nortwind databasesinden Category tablosunundan CategoryId 5 ve yukarisindaki datalari listeyelim.
select * from Categories where CategoryID>=5;

--  Nortwind databasesinden Category tablosunundan CategoryId 3 ile 6 arasindakini listeyelim.
select * from Categories where CategoryID between 3 and 6

--  Nortwind databasesinden Category tablosunundan CategoryId 3 ile 6 arasindakini datalar buyukten kucuge  dogru listeyelim.
select * from Categories where CategoryID between 3 and 6 order by CategoryID desc

-- Like (Filter)
-- nortwind database Categories tablosundaki categoryName sutunundaki baslangici 'B' ile baslayanlari listeyelim.
select * from Categories where CategoryName like 'B%';

-- nortwind database Categories tablosundaki categoryName sutunundaki baslangici 's' ile bitenleri listeyelim.
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s';

-- nortwind database Categories tablosundaki categoryName sutunundaki bitisi 's' ile bitenleri buyukten kucuge dogru listeyelim.
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like '%s' order by  cat.CategoryName  desc;

-- nortwind database Categories tablosundaki categoryName sutunundaki içinde  'on'  gecenleri buyukten kucuge dogru listeyelim.
select * from Categories where CategoryName like '%on%' order by CategoryName desc;

select * from Categories where CategoryName like '%[p]%';

-- nortwind database Categories tablosundaki categoryName sutunundaki içinde  'on' gecen  kaç tane veri vardır ?
select count(CategoryName) from Categories where CategoryName like '%on%';

select count(CategoryName) as categoryKacTaneVeri from Categories where CategoryName like '%on%';
select count(CategoryName) as "Kategoriye Uyan Kac Tane Veri" from Categories where CategoryName like '%on%';

-- nortwind database Categories tablosundaki categoryName sutunundaki içinde  en az 7 karakterli olacak ilk karakteri S, ikinci karakter e, son karakteri d olan categoryID sutuna göre büyükten küçüğe doğru sıralayım. 
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Se____d' order by cat.CategoryID desc;

-- nortwind database Categories tablosundaki categoryName sutunundaki içinde  en az 7 karakterli olacak ilk karakteri S, ikinci karakter e, son karakteri d olan kaç tane veri vardır? 
select count(*) from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Se____d' ;




-- IN (SubQuery)
--------------------------------------------------------------------------------------------------
-- Aggreagate
-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarisinda olan verilerin categoryID'lerini toplasin
select sum(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarisinda olan verilerin categoryID'lerden en buyugunu bulunuz.
select max(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarisinda olan verilerin categoryID'lerden en kucugunu  bulunuz.
select min(CategoryID) from Categories where  CategoryID>=5;

-- nortwind databasenden Categories tablosunundaki categoryID=5 ve yukarisinda olan verilerin categoryID'lerden ortalamas�.
select avg(CategoryID) from Categories where  CategoryID>=5;

--------------------------------------------------------------------------------------------------
-- TOP

select top 4 * from Categories;
select top (4) * from Categories;
-- Sondan 4 Category Listesini gorelim.
select top (4) * from Categories order by CategoryID desc;

SELECT TOP (4) [CategoryID]
      ,[CategoryName]
      ,[Description]
      ,[Picture]
  FROM [nortwind].[dbo].[Categories]


SELECT TOP (4) * FROM Categories

--------------------------------------------------------------------------------------------------
-- DISTINCT (Veri tekrarini onlemek icin)
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