use ecommerce;
describe suppliers;
drop table suppliers;
describe customer;
describe supplierpricing;
drop table rating;
drop table orders;
describe rating;

create table supplier
(
supplierId int primary key,
supplierName varchar(50),
supplierCity varchar(50),
supplierphoneno varchar(50));

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
create  procedure proc1()
begin 
select * from category;
select * from orders;
select * from rating;

END $$
call proc1;

Delimiter  $$
use ecommerce $$
create  procedure proc2()
begin 
select customer.customerName , customer.customergender from customer 
where customer.customername like 'A%' or customer.customerName like'%A';

END $$
call proc2;
