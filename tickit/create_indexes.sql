/* Index to speed-up the following query: 
select * from listing where numtickets > 10; 
*/
create index listing_numtickets_idx on Listing(numtickets);

/* Index to speed-up the following query:
select * from listing where numtickets > 10 and priceperticket between 50 and 100; 
*/
create index listing_numtickets_priceperticket_idx on Listing(numtickets, priceperticket);

/* Indexes to speed-up the following query:
select l.*, s.pricepaid, s.commission 
from Listing l join Sales s
on l.listid = s.listid
where numtickets > 10 and priceperticket between 50 and 100
and commission > 100; 
*/
create index listing_numtickets_priceperticket_listid_idx on Listing(numtickets, priceperticket, listid);
create index sales_commission_listid_idx on Sales(commission, listid);

/* Indexes to speed-up the following query:
select s.sellerid, u.username, u.email, sum(qtysold)
from Sales s join Users u on s.sellerid = u.userid
where u.city = 'Houston'
group by s.sellerid, u.username, u.email
order by sum(qtysold) desc; 
*/
create index sales_sellerid_qtysold_idx on Sales(sellerid, qtysold);
create index users_city_userid_username_email_idx on Users(city, userid, username, email)
where city = 'Houston';
