create table Store_Services as select distinct id as store_id, services_0 as services from store;

insert into Store_Services (store_id, services) select distinct id, services_1 from store;
insert into Store_Services (store_id, services) select distinct id, services_2 from store;
insert into Store_Services (store_id, services) select distinct id, services_3 from store;
insert into Store_Services (store_id, services) select distinct id, services_4 from store;
insert into Store_Services (store_id, services) select distinct id, services_5 from store;

alter table Store_Services add primary key(store_id, services);

delete from Store_Services where services is null;

alter table Store_Services add primary key(store_id, services);

alter table Store_Services add foreign key(store_id) references Store(id);

alter table Store 
 drop column services_0,
 drop column services_1,
 drop column services_2,
 drop column services_3,
 drop column services_4,
 drop column services_5;