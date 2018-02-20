/* Practice problem 1:

List the manufacturers and total number of products they have in the database. 
Only include manufacturers which have at least 5 products. Only include products that cost at least $1. */
select manufacturer, count(*) 
from Product 
where price >= 1.00
group by manufacturer
having count(*) >= 5 
order by manufacturer;


/* Practice problem 2:

List the product subcategories and average price for each one. 
Include all products even those which do not have a subcategory. Order the results by average price highest-to-lowest. */

select subcategory_name, avg(price)
from Product p left outer join Subcategory s on p.subcategory_id = s.subcategory_id
group by subcategory_name
order by avg(price) desc;
