alter table Listing add foreign key (sellerid) references Users(userid);
alter table Listing add foreign key (eventid) references Event(eventid);
alter table Listing add foreign key (dateid) references Date(dateid);

alter table Sales add foreign key (sellerid) references Users(userid);
alter table Sales add foreign key (buyerid) references Users(userid);
alter table Sales add foreign key (listid) references Listing(listid);
alter table Sales add foreign key (eventid) references Event(eventid);
alter table Sales add foreign key (dateid) references Date(dateid);

alter table Event add foreign key (venueid) references Venue(venueid);
alter table Event add foreign key (dateid) references Date(dateid);

