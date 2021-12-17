create table author
	(email			varchar(50),
	 first_name		varchar(50) not null,
	 last_name		varchar(50) not null,
	 primary key (email)
	);

create table bank_account
	(number			numeric(16,0),
	 balance		numeric(11,2) default 0.0,
	 primary key (number)
	);

create table "user"
	(email			varchar(50),
	 password		varchar(30) not null,
	 first_name		varchar(50) not null,
	 last_name		varchar(50) not null,
	 full_address		varchar(100) not null,
	 primary key (email)
	);

create table publisher
	(name			varchar(50),
	 bank_number		numeric(16,0) not null,
	 full_address		varchar(100) not null unique,
	 phone_num		varchar(18) not null unique,
	 primary key (name),
	 foreign key (bank_number) references bank_account (number)
	);

create table "order"
	(ID			varchar(9),
	 bank_number		numeric(16,0) not null,
	 user_email		varchar(50) not null,
	 full_address		varchar(100) not null,
	 date			timestamp not null,
	 status			varchar(25) not null,
	 sub_total		numeric(11,2) check (sub_total >= 0),
	 primary key (ID),
	 foreign key (bank_number) references bank_account (number),
	 foreign key (user_email) references "user" (email)
	);		

create table book
	(ISBN			varchar(13) not null,
	 pub_name		varchar(50) not null,
	 title			varchar(25) not null,
	 blurb			varchar(1000) not null unique,
	 genre			varchar(50) not null,
	 page_count		numeric(4,0) check (page_count > 0),
	 percent_share		numeric(3,1) check (percent_share > 0 and percent_share <= 100),
	 price			numeric(6,2) check (price > 0),
	 quantity		numeric(2,0) check (quantity >= 0),
	 primary key (ISBN),
	 foreign key (pub_name) references publisher (name)
	);

create table book_author
	(email			varchar(50) not null,
	 ISBN			varchar(13) not null,
	 primary key (email, ISBN),
	 foreign key (email) references author (email),
	 foreign key (ISBN) references book (ISBN)
	);

create table sale
	(ISBN			varchar(13) not null,
	 ID			varchar(9) not null,
	 count			numeric(2,0) check (count > 0),
	 primary key (ISBN, ID),
	 foreign key (ISBN) references book (ISBN),
	 foreign key (ID) references "order" (ID)
	);

create table owner
	(email			varchar(50) not null,
	 bank_number		numeric(16,0) not null,
	 password		varchar(30) not null,
	 first_name		varchar(50) not null,
	 last_name		varchar(50) not null,
	 phone_number		varchar(18) not null,
	 primary key (email),
	 foreign key (bank_number) references bank_account (number)
	);
