-- Create database RealEstate;
use RealEstate;
create table Buyer(
cnic char(13) NOT NULL AUTO_INCREMENT primary key unique ,
Buyer_firstname varchar(255) not null,
Buyer_lastname varchar(255) not null,
Buyer_Password char(8), 
Watchlist blob ,
Bought_property blob, 
foreign key (cnic) references Property_review(Buyer_id) 
)AUTO_INCREMENT=2;

drop table Seller;
select * from Buyer;
insert into Buyer (Buyer_firstname,Buyer_lastname,Watchlist,Bought_property) values ('hammad','aslam',null,null);
select * from Seller;
create table Seller(
cnic char(13) NOT NULL AUTO_INCREMENT primary key unique ,
Selling_id CHAR(8)  unique  not null,
Seller_firstname VARCHAR(255),
Seller_lastname VARCHAR(255),
Seller_email VARCHAR(255), 
Seller_password CHAR(8),
Sold_property blob,
Owned_property blob,
foreign key (cnic) REFERENCES Property(Owner_id),
foreign key (cnic) references Property_review(Seller_id) 
);

create table Property(
Property_id CHAR(8) primary Key not null ,
Owner_id char(8),
pictures blob,
foreign key (Property_id) REFERENCES Property_detail(Property_id),
foreign key (Property_id) REFERENCES Property_review(Property_id)

);
create table Property_detail(
Property_id CHAR(8),
Property_Type blob,
Bed INT,
Price INT,
Bath INT,
Description VARCHAR(255),
City VARCHAR(255),
Address VARCHAR(255)
);
create table Property_review(
Property_id CHAR(8) not null,
Buyer_id char(13) not null,
Seller_id char(8) not null,
Rating char(1),
user_comment varchar(255),
Comment_timing datetime
)