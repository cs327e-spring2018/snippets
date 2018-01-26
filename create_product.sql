create table Product(
   sku int primary key,
   name varchar(120),
   type varchar(10),
   price varchar(10),
   upc varchar(20),
   shipping varchar(10),
   description varchar(260),
   manufacturer varchar(30),
   model varchar(30),
   url varchar(190),
   image varchar(90),
   category_id varchar(20),
   subcategory_id varchar(20)
);