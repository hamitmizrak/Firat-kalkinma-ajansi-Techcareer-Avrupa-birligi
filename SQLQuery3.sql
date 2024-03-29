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

-- ------------------------------------------------------------------------------------
--  nortwind databasenden Customers tablosunu listeleyelim.
select * from Customers;

-- nortwind databasenden Customers tablosundan sadece CustomerID Listeyelim ?
select CustomerID from Customers;

--------------------------------------------------------------------------------------------------
-- Order By

-- nortwind databasenden Categories tablosunundaki ,categoryID 5 ve ustunde olan verileri categoryID'sini buyukten kucuge  listeleyelim. 
select * from Categories where  CategoryID>=5 order by categoryID desc;

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

-- nortwind databasenden Categories tablosundaki categoryName 'Be' ile başlayanları listeleyim. 
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryName like 'Be%'

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
-- nortwind databasenden Categories tablosundaki categoryID büyük olanı listeyelim.

-- Manuel
select * from Categories where CategoryID=13;

-- Dynamics 
select * from Categories where CategoryID=(select max(CategoryID) from Categories);

-- nortwind databasenden Categories tablosundaki categoryID küçük olanı listeyelim.
select * from [nortwind].[dbo].[Categories] as cat where cat.CategoryID=(select min(CategoryID) from Categories);


 
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

--------------------------------------------------------------------------------------------------
-- IS NULL 
select  * from Categories;

-- Nortwind databasesinden Categories tablosunu Picture kolundaki null olanları listeleyelim. 
-- 1.YOL
use nortwind;
select * from Categories where Picture is null; 

-- 2.YOL
select * from [nortwind].[dbo].[Categories] as cat where cat.Picture is null 

-- Nortwind databasesinden Categories tablosunu Picture kolundaki null olanları kaç tane veri var ? 
select count(*) as nullOlanPictureVerileri from [nortwind].[dbo].[Categories] as cat where cat.Picture is null 
-- 1.YOL
select count(*) as "null Olan Picture Verileri" from [nortwind].[dbo].[Categories] as cat where cat.Picture is null 
-- 2.YOL
select count(cat.Picture) as "null Olan Picture Verileri" from [nortwind].[dbo].[Categories] as cat where cat.Picture is null 

-- Nortwind databasesinden Categories tablosundaki Picture kolundaki birinci null olan datalardan null yerine picture_change olarak yazalım.

-- Veri Eklemek
insert into Categories(CategoryName,Description) values('Bilgisayar','MSI-2')

select * from Categories ;
-- 1.YOL (Manuel)
update Categories SET Picture='picture_change' where CategoryID=9

-- 2.YOL (Dynamics)
update Categories SET Picture='picture_change' where CategoryID=(select min(CategoryID) from Categories where Picture is null)

--------------------------------------------------------------------------------------------------
-- IS NOT NULL
-- Nortwind databasesinden Categories tablosunundan Picture kolundaki null olmayanları listeleyelim. 
-- 1.YOL
use nortwind;
select * from Categories where Picture is not null;

-- 2.YOL
select * from [nortwind].[dbo].[Categories] as cat where cat.Picture is not null

-- Nortwind databasesinden Categories tablosunu Picture kolundaki null olmayanları kaç tane data vardır? 
-- 1.YOL
select count(*) as pictureNullOlmayan from Categories where Picture is not null;
select count(*) as "picture Null Olmayan" from Categories where Picture is not null;

-- 2.YOL
select count(*) as "picture Null Olmayan Veri Sayısı" from [nortwind].[dbo].[Categories] as cat where cat.Picture is not null


--------------------------------------------------------------------------------------------------
-- ARITMETIK (+ - * / %)
select 4+7 as toplam;
select 8-2 as cikarma;
select 4*7 as carpma;
select 8/3 as bolme;
select 8%3 as kalan;

select 4+7 as toplam;
select '4'+7 as toplam;
select '4'+'7' as toplam;

--------------------------------------------------------------------------------------------------
-- CAST
-- cast (Tamsayi = INTEGER,integer)
select '4'+'7' as toplam;
select CAST('4' AS INTEGER)+ CAST('7' as integer);
select (CAST('4' AS INTEGER)+ cast('7' as integer)) as toplam;

--------------------------------------------------------------------------------------------------
-- MATH
select pi();

select abs(-12) as 'mutlak değer';
select sqrt(16) as 'karekök';
select power(2,5) as 'üslü sayılar';
select floor(6.9) as 'aşağı yuvarla';
select ceiling(4.1) as 'yukarı yuvarla'

select sin(45) as 'Sinüs'
select cos(45) as 'Cosinüs'
select tan(45) as 'Tanjant'
select cot(45) as 'Cotanjant'


--------------------------------------------------------------------------------------------------
-- STRING
select * from Categories

-- Bütün karakterleri BÜYÜK harf yap
select upper(cat.CategoryName) as 'Kategori Adı'  from Categories as cat

-- Bütün karakteri KÜÇüK harf yap
select lower(cat.CategoryName) as 'Kategori Adı'  from Categories as cat

-- ltrim: soldan eğer boşluk varsa sil (Validation işlemlerinde kullanmak mantıklı)
select ltrim(cat.CategoryName) as 'Soldaki boşlukları al'  from Categories as cat

-- trim: sağdan eğer boşluk varsa sil (Validation işlemlerinde kullanmak mantıklı)
select rtrim(cat.CategoryName) as 'Sağdaki boşlukları al'  from Categories as cat

-- substring: Kelimeyi parçalamak için kullanıyoruz.
-- Bütün CategoryName'den ilk 3 karakterini bana getir.
select SUBSTRING(cat.CategoryName,1,3) as 'Category Name' from Categories as cat

-- replace: Değiştirmek için kullanıyoruz.
select * from Categories;
select REPLACE(cat.CategoryName,'Bilgisayar','Değişti') as 'Değiştir' from Categories as cat
-- Nortwind databasesinden Categories tablosundaki 'Bilgisayar' kelimesi yerine 'Computer' olarak değiştirin.=> 
-- keyword: subquery,update,replace
-- 1.YOL
use nortwind;
update Categories SET CategoryName=REPLACE(cat.CategoryName,'Bilgisayar','Computer') from Categories as cat

-- 2.YOL
update [nortwind].[dbo].[Categories]  SET CategoryName=replace(cat.CategoryName,'Bilgisayar','Computer') from Categories as cat

-- SORU
-- Nortwind databasesinden Categories tablosundaki CategoryID en küçük olan veri için bütün 'e' harfi yerine 'x' yazalım.
-- keyword: subquery,update,replace(),min()
select * from Categories
update [nortwind].[dbo].[Categories] SET CategoryName=replace(cat.CategoryName,'e','x') from Categories as cat where cat.CategoryID=(select min(CategoryID) from Categories)

-- SORU
-- Nortwind databasesinden Categories tablosundaki CategoryID 4 ile 5 arasındaki CategoryName bütün 'a' harfi yerine 'x' yazalım. 
-- keyword: subquery,update,replace(),between()
select * from Categories
update [nortwind].[dbo].[Categories] SET CategoryName=replace(cat.CategoryName,'a','x') from Categories as cat where cat.CategoryID between 4 and 5;

-- CONCAT
-- concat: İlgili sutunda sonuna istediğimiz harf veya kelime yazmamıza olanak sağlar
select concat(cat.CategoryName,' INC') from Categories as cat 

-- SORU
-- Nortwind databasesinden Categories tablosundaki bütün CategoryName sonuna INC ekleyelim.
-- keyword: subquery,update,replace(),between()
-- Döngü (while)


-- REVERSE
-- reverse: Verilen kelimeyi ters yazdırır. Yani 1 harf sona en son haf başa gelir.
select cat.CategoryName from Categories as cat 
select reverse(cat.CategoryName) from Categories as cat 


-- LEN
-- LEN: Verilen kelimeyi harf sayısını bulur
select cat.CategoryName as 'Computer Name' from Categories as cat
select cat.CategoryName 'Computer Name' from Categories as cat 
select len(cat.CategoryName) from Categories as cat 


-- https://www.w3schools.com/sql/default.asp

--------------------------------------------------------------------------------------------------
-- TARIH
-- 2024-03-28 12-01:14:300

-- GETDATE()
-- getdate() = Şu anda ki zamanı bize verir.
select getdate() as 'şu anda ki Tarih';

-- DATEADD()
-- dateadd() = Zamanı yıl, ay için ileri tarihe göre alsın.
select dateadd(month,1,getdate()) as 'Şu andaki zamanın ayı için 1 ay ileri'
select dateadd(year,5,getdate())  as 'Şu andaki zamanın yılı için 5 yıl ileri'

-- DATEDIFF()
-- datediff() = belirtilen 2 zaman için ara farkını bize gösterir.
select datediff (day, '01.01.1990',getdate());
select datediff(month,'01.01.1990',getdate());
select datediff (year,'01.01.1990',getdate());

-- DATEPART()
-- datepart() = o zaman diliminin  hangi  hafta ,ay,yıl, olduğunu gösterir
select datepart (hour,getdate()) as 'Saat'
select datepart(day,getdate()) as 'Gün'
select datepart (WEEK,getdate()) as 'Yılın kaçıncı Haftası'
select datepart (month,getdate()) as 'Yılın kaçıncı Ay'
select datepart (year,getdate()) 'YEAR'

-- ------------------------------------------------------------------------------------


select (c.CategoryID*2) as result from Categories as c
select (s.vize_notes*0.6+s.final_notes*0.4) as sonuc from student as s;


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


-- ------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- DDL (Data Definition Language)

-- DATABASE
-- CREATE
CREATE DATABASE ScriptDb;

-- DROP
-- 1.YOL
DROP DATABASE ScriptDb;

-- 2.YOL
USE master
GO
DROP DATABASE ScriptDb;
GO

-- RENAME
EXEC sp_renamedb 'eski_veritabani_adı', 'yeni_veritabani_adı';
EXEC sp_renamedb 'ScriptDatabase', 'ScriptDb';




-- Datatypes
/* 
Sıklıkla Kullanılan Data Types;
Tamsayılarda: int
Virgüllü Sayılarda: float
Kelimelerde: nvarchar
Tarih: Date veya DateTime
*/

-- TAMSAYI
/*
TINYINT: Çok küçük tamsayı değerlerini saklamak için kullanılır. Örneğin, 0 ile 255 arasındaki değerler TINYINT türünde saklanabilir. Boyut olarak 1 byte alana sahiptir.
0<=TINYINT<=255
SMALLINT: Küçük tamsayı değerlerini saklamak için kullanılır. INT'ten daha küçük tamsayı değerlerini saklayabilir. Boyut olarak 2 byte alana sahiptir.
INT: Tamsayı değerleri saklamak için kullanılır. Örneğin, 1, 2, -100, 0 gibi değerler INT türünde saklanabilir. Boyut olarak 4 byte alana sahiptir.
BIGINT: Büyük tamsayı değerlerini saklamak için kullanılır. INT'ten daha büyük tamsayı değerlerini saklayabilir. Boyut olarak 8 byte alana sahiptir.
TINYINT<SMALLINT<INT<BIGINT
*/

-- VİRGüLLÜ SAYI
/* 
DECIMAL(p, s) veya NUMERIC(p, s): Ondalık sayıları saklamak için kullanılır. p, toplam basamak sayısını (ondalık noktadan önce ve sonra toplam basamak sayısı) belirtirken s, ondalık basamak sayısını belirtir.
FLOAT: Kayan nokta sayılarını saklamak için kullanılır. Büyük veya küçük ondalık sayılar için uygundur.
Örnek: 44.10
REAL: İkili hassaslıkta kayan nokta sayılarını saklamak için kullanılır. FLOAT'tan daha düşük bir hassasiyete sahiptir.
Örnek: 44.101222222
*/

-- KELİMESEL
/*

VARCHAR(n) veya NVARCHAR(n): Değişken uzunluklu karakter dizilerini saklamak için kullanılır. 
n, maksimum karakter sayısını belirtir. 
VARCHAR, ASCII karakterlerini (sadece ingilizce harfler) 
NVARCHAR ise Unicode karakterlerini saklar. (Çince, Arapça vs)
Dikkat: nvarchar Dynamics bir datatypes'dir.
Örnek  nvarchar(255) Anlamı: En fazla 255 karakter kullanabilirsin. ancak eğer siz 10 karakter kullanırsanız geriye kalan 255-10= 245 kadar bit kadar yer kaplamıyor.

CHAR(n) veya NCHAR(n): Sabit uzunluklu karakter dizilerini saklamak için kullanılır. n, sabit karakter dizisinin uzunluğunu belirtir.
Daha hızlı ve ilkeldir.
Dinamik değildir.
*/

-- TARİH 
/*
DATE: Tarih değerlerini saklamak için kullanılır. YYYY-MM-DD biçimindedir.
TIME: Saat değerlerini saklamak için kullanılır. HH:MM:SS.SSS biçimindedir.
DATETIME: Tarih ve saat değerlerini saklamak için kullanılır. YYYY-MM-DD HH:MM:SS.SSS biçimindedir.
*/

--  BIT AND BINARY
/*
BIT: Mantıksal (boolean) değerleri saklamak için kullanılır. 0 veya 1 değerlerini alır.
BINARY(n) veya VARBINARY(n): Sabit veya değişken uzunluklu binary verileri saklamak için kullanılır.
Binary: 0 ve 1'lerdan oluşan
*/


-- Mssql üzerinde tablo oluşturmak
-- Script üzerinde tablo oluşturmak

-- TRUNCATE
-- truncate: Tablonun içeriğini temizlemek için kullanıyoruz.
select * from [ScriptDb].[dbo].[Person]
truncate table [ScriptDb].[dbo].[Person]

--------------------------------------------------------------------------------------------------
-- TABLE SCRIPT
-- 1.TABLE
use ScriptDb;
create table EmployeesData(
	EmployeeID INT  PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Department NVARCHAR(50),
	Salary DECIMAL(10,2)
);
/*
EmployeeID INT  PRIMARY KEY IDENTITY NOT NULL,
INT: data type (tam sayı)
PRIMARY KEY: Birincil anahtar
IDENTITY: AI Otomatik artmak için kullanırız. (Unique olması için
NOT NULL: Boş geçilemez 
*/ 

-- 2.TABLE
-- Eğer benim verdiğim tablo database'de varsa ekleme yoksa ekle
-- Constraints: PRIMARY KEY,Foreign Key, UNIQUE, DEFAULT
use ScriptDb;
if not exists (select * from sysobjects where name='notes' and xtype='U')
    CREATE TABLE student (
	StudentId INT PRIMARY KEY IDENTITY  NOT NULL,
	studentName varchar(50)  NOT NULL,
	studentSurname varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	Phone_Number varchar(20) UNIQUE NOT NULL,
	studentVizeNotes int NOT NULL,
	studentFinalNotes int NOT NULL,
	Registration_Date date,
	created_at DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP,
);
go

insert into 
student(studentName,studentSurname,city,Phone_Number,studentVizeNotes,studentFinalNotes,Registration_Date) 
values
('Adı-1','Soyadı-1','Bingöl','11122233',80,80,'2024-03-28');

insert into 
student(studentName,studentSurname,city,Phone_Number,studentVizeNotes,studentFinalNotes,Registration_Date) 
values
('Adı-2','Soyadı-2','Malatya','11122233',70,70,'2024-03-28');

select * from [ScriptDb].[dbo].[student] as stu;


-- 3.TABLE
-- Kategoriler tablosu
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY NOT NULL,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX)
);

-- Ürünler tablosu
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY NOT NULL, -- PK: Primary Key
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT, -- FK: Foreign Key
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Description NVARCHAR(MAX),
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


----------------------------------------------------------------------------------------------------------------------
-- Hayali Sutun
select (stu.studentVizeNotes*0.4+stu.studentFinalNotes*0.6) as result from [ScriptDb].[dbo].[student] as stu;


--------------------------------------------------------------------------------------------------
-- UNION : aynı sutun sayısına sahip tabloları alt alta görmek istediğimizde kullanıyoruz.
-- UNIONALL (datatype, script, table, PK)
use ScriptDb;
if not exists (select * from sysobjects where name='notes' and xtype='U')
    CREATE TABLE teacher (
	StudentId INT PRIMARY KEY IDENTITY NOT NULL,
	studentName varchar(50) NOT NULL,
	studentSurname varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	Phone_Number varchar(20) NOT NULL,
	studentVizeNotes int NOT NULL,
	studentFinalNotes int NOT NULL,
	Registration_Date date,
	created_at DATETIME NOT NULL  DEFAULT CURRENT_TIMESTAMP,
);
go

insert into 
student(studentName,studentSurname,city,Phone_Number,studentVizeNotes,studentFinalNotes,Registration_Date) 
values
('Adı-1','Soyadı-1','Bingöl','11122233',80,80,'2024-03-28');

insert into 
teacher(studentName,studentSurname,city,Phone_Number,studentVizeNotes,studentFinalNotes,Registration_Date) 
values
('Adı-22','Soyadı-22','Bingöl','11122233',80,80,'2024-03-28');

select * from student
union
select * from teacher

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- GROP BY
/*
Bir kolonumuzdaki kaç kere tekrar yaptığını, minumum değerini bulmak ,maksimum değerini bulma (aggregate function) değerler üzerinde işlem yapabilmemizi sağlar.

group by: Kolonun gruplama yapabilmemize olanak sağlar.

Aggregate: count, max, min, sum, avg

select kolon_adiXYZ ,aggregate_function from tablo_adi where şart group by kolon_adiXYZ;

*/

-- Group By Örnek-1
-- Örneğin, bir "employees" (çalışanlar) tablosunda çalışanların bölümlere göre maaş ortalamalarını bulmak istediğinizi varsayalım:
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
--Bu sorgu, "employees" tablosundaki verileri "department" sütununa göre gruplar ve her bir bölüm için ortalama maaşı hesaplar. Sonuçlar, bölüm başına bir satırda görünecektir.


-- Group By Örnek-2
-- Aşağıdaki örnek, "Customers" tablosundaki müşterileri şehirlerine göre gruplar ve her bir şehirde kaç müşteri olduğunu sayar:
SELECT City, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City;
--Bu sorgu, "Customers" tablosundaki verileri "City" (şehir) sütununa göre gruplar ve her bir grup için o şehirde kaç müşteri olduğunu sayar. Sonuçlar, şehir başına bir satırda görünecektir.


-- Group By Örnek-3
--Tablodaki verileri belirli bir sütuna göre gruplamak ve bu gruplar üzerinde toplu işlemler yapmak için GROUP BY ifadesi kullanılır. 
--Örneğin, bir "Orders" (Siparişler) tablosundaki siparişleri müşteri numaralarına göre gruplamak ve her müşterinin kaç siparişi olduğunu bulmak isteyebilirsiniz.
--Aşağıdaki örnek, "Orders" tablosundaki siparişleri müşteri numaralarına göre gruplar ve her bir müşterinin kaç siparişi olduğunu sayar:
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID;
--Bu sorgu, "Orders" tablosundaki verileri "CustomerID" (Müşteri Numarası) sütununa göre gruplar ve her bir müşteri için kaç tane sipariş olduğunu sayar. Sonuçlar, müşteri numarası başına bir satırda görünecektir.




------------------------------------------------------------------------------------------------------------------------
-- HAVING 

-- Having Örnek-1
-- Örnek olarak, bir müşteri siparişleri tablosunda, her müşterinin toplam sipariş miktarını bulalım ve sadece toplam sipariş miktarı 1000'den büyük olan müşterileri listeleyelim:
SELECT customer_id, SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) > 1000;
-- Bu sorgu, siparişler tablosundaki her müşterinin toplam sipariş miktarını hesaplar, ardından bu miktarı 1000'den büyük olan müşterileri listeler.


-- Having Örnek-2
-- Örnek olarak, bir işletmenin çalışanlarının departmanlarına göre ortalama maaşlarını hesaplayalım ve sadece ortalama maaşı belirli bir değerden yüksek olan departmanları listeleyelim:
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
-- Bu sorgu, employees tablosundaki verileri departmanlara göre gruplar, her bir grup için ortalama maaşı hesaplar, ardından ortalama maaşı 50000'den büyük olan grupları seçer ve sonuç olarak bu grupların departmanlarını ve ortalama maaşlarını gösterir.


-- GROP BY AND HAVING
select * from Products

SELECT pro.ProductName, AVG(pro.UnitPrice) AS price
FROM Products as pro
GROUP BY pro.ProductName
HAVING AVG(pro.UnitPrice) > 30;


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- JOIN

-- Join Örnek-1
--MSSQL'de JOIN, ilişkisel veritabanlarında tablolar arasında ilişki kurmayı sağlayan bir SQL operatörüdür. JOIN operatörü, ilişkili tablolardan belirli sütunları almanıza ve bu tabloları belirli bir kriter veya koşula göre birleştirmenize olanak tanır. Bu, ilişkisel veritabanlarında verilerin etkili bir şekilde birleştirilmesini sağlar.
--Örnek olarak, bir müşteri tablosu ve bir sipariş tablosu üzerinden JOIN işlemi gerçekleştirelim:

--customers tablosu:
--customer_id | name         | email
-------------------------------------
--1           | John Doe     | john@example.com
--2           | Jane Smith   | jane@example.com
--3           | Alice Johnson| alice@example.com


--orders tablosu:
--order_id | customer_id | product      | quantity
----------------------------------------------
--101      | 1           | Laptop       | 1
--102      | 2           | Smartphone   | 2
--103      | 1           | Headphones   | 1
--Bu tablolarda, customer_id alanı customers tablosunda müşterileri orders tablosundaki siparişlerle ilişkilendirir.


-------------------------------------------------------------------------------------------------------------
select * from Categories;
select * from Products;

-- select KolonAdı,Aggregate from Categories where +BIL+ Group by+Having+Order By 
-- 1.YOL
select * from Categories as cat inner join Products as pro ON cat.CategoryID=pro.CategoryID;
select cat.CategoryID,cat.CategoryName,pro.ProductName from Categories as cat inner join Products as pro ON cat.CategoryID=pro.CategoryID;

-- LEFT JOIN
select cat.CategoryID,cat.CategoryName,pro.ProductName from Categories as cat left join Products as pro ON cat.CategoryID=pro.CategoryID;

-- RIGHT JOIN
select cat.CategoryID,cat.CategoryName,pro.ProductName from Categories as cat right join Products as pro ON cat.CategoryID=pro.CategoryID;

-- 2.YOL
select * from Products as pro  inner join Categories as cat  ON cat.CategoryID=pro.CategoryID;
select cat.CategoryID,cat.CategoryName,pro.ProductName from Products as pro  inner join Categories as cat  ON cat.CategoryID=pro.CategoryID;

-- LEFT JOIN
select cat.CategoryID,cat.CategoryName,pro.ProductName from Products as pro  left join Categories as cat  ON cat.CategoryID=pro.CategoryID;

-- RIGHT JOIN
select cat.CategoryID,cat.CategoryName,pro.ProductName from Products as pro  right join Categories as cat  ON cat.CategoryID=pro.CategoryID;





-- PK: ProductID
select * from Categories;

-- PK: ProductID
-- FK: CategoryID
select * from Products;

-- Inner Join
select cat.CategoryName, pro.ProductName from Categories as cat inner join Products as pro ON cat.CategoryID=pro.CategoryID;

-- Left Join
select cat.CategoryName, pro.ProductName from Categories as cat left join Products as pro ON cat.CategoryID=pro.CategoryID;

-- Right Join
select cat.CategoryName, pro.ProductName from Categories as cat right join Products as pro ON cat.CategoryID=pro.CategoryID;

