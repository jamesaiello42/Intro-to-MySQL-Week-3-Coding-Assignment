create database if not exists social_media;

use social_media;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	id int(11) not null auto_increment,
	username char(20) not null,
	email char(40) not null,
	password char(30) not null,
	primary key (id)
);

create table posts (
	id int(11) not null auto_increment,
	poster_id int(11) not null,
	post_name char(50) not null,
	post_text char(250) not null,
	date_posted datetime not null,
	date_edited datetime not null,
	primary key (id),
	foreign key (poster_id) references users(id)
);

create table comments (
	id int(11) not null auto_increment,
	post_id int(11) not null,
	commenter_id int(11) not null,
	comment_name char(50) not null,
	comment_text char(250) not null,
	date_commented datetime not null,
	date_edited datetime not null,
	primary key (id),
	foreign key (post_id) references posts(id),
	foreign key (commenter_id) references users(id)
);