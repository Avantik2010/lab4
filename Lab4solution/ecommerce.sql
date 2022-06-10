use ecommerce;
describe suppliers;
drop table suppliers;
describe category;
describe supplierpricing;
drop table rating;
drop table orders;
describe product;

create table supplier
(
supplierId int primary key,
supplierName varchar(50),
supplierCity varchar(50),
supplierphoneno varchar(50));

create table category
(
categoryId int primary key;
categoryName varchar(20)
);

create table product
(
productId int primary key;
productName varchar (20);
productDescription varchar(60);
categoryID int;
foreign key(categoryId) references category(categoryID)
);

create table customer
(
customerId int primary key;
customerName varchar (20);
customerPhone varchar(10);
customercity  varchar(30);
customerGender char(1)
);

create table supplierPricing
(
pricingId Int,
productId Int,
supplierId Int,
supplierPrice Int,
primary key (pricingId),
foreign key(productId) references product (productId),
foreign key(supplierId) references Supplier(supplierID)
);

create table Orders
(
orderId int not null,
orderAmount int not null,
orderdate date,
customerId int not null,
pricingId int not null,
primary key (orderId),
foreign key(customerId) references Customer(customerId),
foreign key(pricingId) references supplierPricing(pricingId)
);

create table rating
(
rat_Id int ,
orderId int,
rat_ratstars int,
primary key (rat_Id),
foreign key(orderId) references Orders(orderId)
);


insert into supplier values(1, "Rajesh Retails" , "Delhi" , '1234567890');
insert into supplier values(2, "Appario ltd" , "Mumbai" , '2345225690');
insert into supplier values(3, "knome products" , "Banglore" , '1890234500');
insert into supplier values(4, "Bansal Retails" , "kochi" , '4567890123');
insert into supplier values(5, "mittal ltd." , "lucknow" , '531245732');

insert into category values( 1, "BOOKS");
insert into category values( 7, "BOOKS");
insert into category values( 8, "GAMES");
insert into category values( 9, "GROCERIES");
insert into category values( 10, "ELECTRONICS");
insert into category values( 11, "CLOTHES");

insert into customer values( 1, "AAKSH", '9999999999' , "DEHLI", "M");
insert into customer values( 2, "AMAN", '99123456799' , "NOIDA", "M");
insert into customer values( 3, "NEHA", '912345678999' , "Mumbai", "F");
insert into customer values( 4, "MEGHA", '99991234569' , "KolKATA", "F");
insert into customer values( 5, "PULKIT", '91234467999' , "LuckNOW", "M");
insert into customer values( 6, "AAKSH", '99912345679' , "DEHLI", "M");

insert into product values(1, "GTA V", "Windows7 and above with i5 processor and 8 GB RAM", 10);
insert into product values(2, "T-shirt" , "Size-L with Black, blue, white variations", 11)
insert into product values(3, "ROG LAPTOP", "Windows10 15 inch screen, i7 processor 1TB SSD", 10);
insert into product values(4, "OATS", "Highly Nutritious from Nestle", 9);
insert into product values(5, "HARRY POTTER", "Best Collection of all the time by J.k Rowling", 1);
insert into product values(6, "Milk", "1L Toned milk", 9);
insert into product values(7, "BOAT EARPHONES", "1.5 meter long dolby Atmos", 10);
insert into product values(8, "Jeans", "Stretchable Denim jeans with various sizes and color", 11);
insert into product values(9, "ProjectIGI", "compatible with Windows7 and above", 10);
insert into product values(10, "Hoodie" "BLack gucci for 13 years and above", 11);
insert into product values(11, "Rich Dad Poor Dad", "written by robert kiyosaki", 1);
insert into product values(12, "Train your Brain", "by shireen stephen", 1);
 

insert into supplierPricing values(1,1,2,1500);
insert into supplierPricing values(2,3,5,30000);
insert into supplierPricing values(3,5,1,3000);
insert into supplierPricing values(4,2,3,2500);
insert into supplierPricing values(5,4,1,1000);
insert into supplierPricing values(6,12,2,780);
insert into supplierPricing values(7,12,4,789);
insert into supplierPricing values(8,3,1,31000);
insert into supplierPricing values(9,1,5,1450);
insert into supplierPricing values(10,4,2,999);
insert into supplierPricing values(11,7,3,549);
insert into supplierPricing values(12,7,4,529);
insert into supplierPricing values(13,6,2,105);
insert into supplierPricing values(14,6,1,99);
insert into supplierPricing values(15,2,5,2999);
insert into supplierPricing values(16,5,2,2999);

insert into orders values (101, 1500, "2021-10-06",2,1);
insert into orders values (102, 1000, "2021-10-12",3,5);
insert into orders values (103, 30000, "2021-09-16",5,2);
insert into orders values (104, 1500, "2021-10-05",1,1);
insert into orders values (105, 3000, "2021-08-16",4,3);
insert into orders values (106, 1450, "2021-08-18",1,9);
insert into orders values (107, 789, "2021-09-01",3,7);
insert into orders values (108, 780, "2021-09-07",5,6);
insert into orders values (109, 3000, "2021-09-06",5,3);
insert into orders values (110, 2500, "2021-09-12",2,4);
insert into orders values (111, 1000, "2021-09-16",4,5);
insert into orders values (112, 789, "2021-10-05",4,7);
insert into orders values (113, 31000, "2021-09-16",1,8);
insert into orders values (114, 1000, "2021-09-16",3,5);
insert into orders values (115, 3000, "2021-09-16",5,3);
insert into orders values (116, 99, "2021-09-17",2,14);

insert into rating values(1, 101, 4);
insert into rating values(2, 102, 3);
insert into rating values(3, 103, 1);
insert into rating values(4, 104, 2);
insert into rating values(5, 105, 4);
insert into rating values(6, 106, 3);
insert into rating values(7, 107, 4);
insert into rating values(8, 108, 4);
insert into rating values(9, 109, 3);
insert into rating values(10, 110, 5);
insert into rating values(11, 111, 3);
insert into rating values(12, 112, 4);
insert into rating values(13, 113, 2);
insert into rating values(14, 114, 1);
insert into rating values(15, 115, 1);
insert into rating values(16, 116, 5);

select count(t2.customergender) as n00fcustomers, t2.customergender from (select t1.customerId,t1.customergender,t1.orderamount,
t1.customername from 
(select orders . *,customer.customergender,customer.customername from orders inner join customer where orders. customerid= customer.customerid 
having orders. orderamount>=3000)
as t1 group by t1.customerid) as t2 group by t2.customergender;

select product.productname, orders.*from orders, supplierpricing, product where orders.customerid=2 and orders.pricingId=supplierpricing.pricingId and supplierpricing.productId=product.productID;

select supplier.*from supplier where supplier.supplierId in (select supplierId from supplierpricing group by supplierId having count(supplierId)>1)group by supplier.supplierId;

select category.categoryId,category.categoryName, min(t3.min_price)as Min_Price from category inner join (select product.categoryId, product.productName, t2.* from product inner join 
(select productId, min(supplierprice) as Min_price from supplierpricing group by productID)
as t2 where t2.productId = product.productID)
as t3 where t3.categoryId = category. categoryId group by t3.categoryId;

select product.productID, product.productname from orders inner join supplierpricing on supplierpricing .pricingId = orders. pricingId inner join product on 
product.productID = supplierpricing . productId where orders. orderdate>"2021-10-05" ;

select customer.customerName , customer.customergender from customer where customer.customername like 'A%' or customer.customerName like'%A';


Delimiter  $$
use ecommerce $$
create  procedure proc3()
begin 
select report.supplierid, report.supplierName,report.Average,
CASE
when report.Average= 5 then 'Excellent service'
when report.Average>4 then 'Good service'
when report.Average>2 then 'Average service'
Else 'Poor Service'
END As type_of_Service from 
(select final.supplierID, Supplier.supplierName, final.Average from 
(select test2.supplierID, sum (test2. rat_ratstars)as Average from
(select supplierpricing.supplierID, test.orderID,test.RAT_RATSTARS from supplierpricing inner join
(select orders.pricingId, rating .orderID, rating.rat_ratstars from orders inner join rating on rating.orderID = Orders.orderID) as test
on test.pricingId = supplierpricing.pricingID)
as test2 group by supplierpricing.supplierID)
as final inner join supplier where final.supplierID= supplier.supplierId)as report;

END $$
call proc3;
