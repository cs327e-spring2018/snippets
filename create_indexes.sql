
/* Query 1: select * from listing where numtickets > 10; */
create index listing_numtickets_idx on Listing(numtickets);

/* Query 2: select * from listing where numtickets > 10 and priceperticket between 50 and 100; */
create index listing_numtickets_priceperticket on listing(numtickets, priceperticket);

/* Query 3: select l.*, s.pricepaid, s.commission 
from listing l join sales s
on l.listid = s.listid
where numtickets > 10 and priceperticket between 50 and 100
and commission > 100; */
create index sales_commission_idx on sales(commission);

/* Query 4: select s.sellerid, u.username, u.email, sum(qtysold)
from sales s join users u on s.sellerid = u.userid
where u.city = 'Houston'
group by s.sellerid, u.username, u.email
order by sum(qtysold) desc; */
create index users_userid_username_email_idx on users(userid, username, email);

create index users_city_userid_username_email_idx on users(city, userid, username, email)
where city = 'Houston';




