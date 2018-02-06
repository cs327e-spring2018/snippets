/* Q1: Find all stores in Austin that carry Apple products. */
select p.name, p.price, st.address, st.zip
from Product p join Subcategory S on p.subcategory_id = s.subcategory_id
join Product_Store ps on p.sku = ps.sku
join Store st on ps.store = st.id 
where s.subcategory_name = 'Apple'
and st.city = 'Austin'
order by p.name;


/* Q2: Find all the products that are not sold at any store. */
select p.sku, p.name, p.price, ps.*
from Product p left join Product_Store ps on p.sku = ps.sku
where ps.sku is null
order by p.sku;


/* Q3: Find all refrigerators that are sold at a store with a 787 zip code. 
Sort the results from lowest-to-highest price and limit the number of results to 30 */
select p.sku, p.name, p.price, st.address
from Product p join Subcategory s on p.subcategory_id = s.subcategory_id
join product_store ps on p.sku = ps.sku
join store st on ps.store = st.id
where st.zip like '787%'
order by p.price desc
limit 30;
