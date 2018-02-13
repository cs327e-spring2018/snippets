alter table product add column price2 varchar(10);
alter table product add column shipping2 varchar(10);

update product set price2 = price;
update product set shipping2 = shipping;

alter table product alter column price2 type numeric(7, 2) using price2::numeric(7, 2);
alter table product alter column shipping2 type numeric(7, 2) using shipping2::numeric(7, 2);

alter table product drop column price;
alter table product drop column shipping;

alter table product rename column price2 to price;
alter table product rename column shipping2 to shipping;