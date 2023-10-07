begin transaction;

insert into syncshop.user (email, name, password, token) values
    ('user1@gmail.com', 'user1', 'user1pwd', 'user1token');

insert into syncshop.user (email, name, password, token) values 
    ('user2@gmail.com', 'user2', 'user2pwd', 'user2token');

insert into syncshop.list (name, code) values 
    ('list1', 'list1code');

insert into syncshop.list (name, code) values 
    ('list2', 'list2code');

insert into syncshop.product (list_id, name, date, bought, categories, priority) values
    (1, 'product1', '2023-01-01 00:00:00', false, 'category1', 1);

insert into syncshop.product (list_id, name, date, bought, categories, priority) values
    (2, 'product2', '2023-01-01 00:00:00', false, 'category1', 1);

insert into syncshop.product (list_id, name, date, bought, categories, priority) values
    (1, 'product3', '2023-01-01 00:00:00', false, 'category2', 2);

insert into syncshop.list_user (list_id, user_id) values
    (1, 1);

insert into syncshop.list_user (list_id, user_id) values
    (1, 2);

insert into syncshop.list_user (list_id, user_id) values
    (2, 1);

insert into syncshop.list_user (list_id, user_id) values
    (2, 2);

commit transaction;