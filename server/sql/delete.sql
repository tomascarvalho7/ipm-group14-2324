begin transaction;

delete from syncshop.list_user;

delete from syncshop.product;

delete from syncshop.list;

delete from syncshop.user;

commit transaction;
