begin transaction;

create schema if not exists syncshop;

create table if not exists syncshop.user (
    id serial primary key,
    email varchar(255) not null unique,
    name varchar(255) not null,
    password varchar(255) not null,
    token varchar(255) not null
);

create table if not exists syncshop.list (
    id serial primary key,
    name varchar(255) not null,
    picture bytea default null,
    code varchar(255) not null
);

create table if not exists syncshop.product (
    id serial,
    list_id int,
    name varchar(255) not null,
    date timestamp,
    bought boolean not null default false,
    categories varchar(255) not null,
    priority int not null,
    foreign key (list_id) references syncshop.list(id),
    primary key (id, list_id)
);

create table if not exists syncshop.list_user(
    list_id int,
    user_id int,
    foreign key (list_id) references syncshop.list(id),
    foreign key (user_id) references syncshop.user(id),
    primary key (list_id, user_id)
);

commit transaction;