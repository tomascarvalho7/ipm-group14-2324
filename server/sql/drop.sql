begin transaction;

drop table if exists syncshop.list_user;

drop table if exists syncshop.product;

drop table if exists syncshop.list;

drop table if exists syncshop.user;

drop schema if exists syncshop;

commit transaction;
