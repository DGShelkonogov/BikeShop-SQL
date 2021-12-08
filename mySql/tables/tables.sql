use bikeshop;
create table client
(
    id_client       int         not null
        auto_increment primary key,
    first_name      varchar(30) not null,
    second_name     varchar(30) not null,
    middle_name     varchar(30) null default ('-'),
    passport_number varchar(5)  not null,
    passport_series varchar(6)  not null
);


use bikeshop;
create table guarantee
(
    id_guarantee int  not null
        auto_increment primary key,
    end_date     date not null,
    price        int  not null check (price >= 0)
);

use bikeshop;
create table post
(
    id_post int            not null
        auto_increment primary key,
    title   varchar(50)    not null unique,
    salary  decimal(38, 2) null default 0.0 check (salary >= 0)
);

use bikeshop;
create table employee
(
    id_employee     int            not null
        auto_increment primary key,
    first_name      varchar(30)    not null,
    second_name     varchar(30)    not null,
    middle_name     varchar(30)    null default ('-'),
    phone           varchar(19)    not null,
    passport_number varchar(4)     not null,
    passport_series varchar(6)     not null,
    snils           varchar(14)    not null,
    inn             varchar(12)    not null,
    email           varchar(100)        default '@.' not null,
    post_part       decimal(38, 1) null default 0.1 check (post_part > 0.0),
    post_id         int            not null references post (id_post)
);

use bikeshop;
create table product
(
    id_product     int          not null
        auto_increment primary key,
    title          varchar(50)  not null unique,
    characteristic varchar(500) not null,
    price          int          not null check (price >= 0)
);

use bikeshop;
create table repository
(
    id_repository int          not null
        auto_increment primary key,
    address       varchar(200) not null unique
);

use bikeshop;
create table my_check
(
    id_my_check    int  not null
        auto_increment primary key,
    number         int  not null unique,
    date_of_create date not null,
    client_id      int  not null references client (id_client),
    employee_id    int  not null references employee (id_employee)
);


use bikeshop;
create table cell
(
    id_cell       int not null
        auto_increment primary key,
    amount        int not null check (amount > 0),
    product_id    int not null references product (id_product),
    repository_id int not null references repository (id_repository)
);

use bikeshop;
create table receiption
(
    id_receiption int          not null
        auto_increment primary key,
    manufacturer  varchar(300) not null,
    shipper       varchar(300) not null,
    date_receipt  date         not null,
    amount        int          not null check (amount > 0),
    product_id    int          not null references product (id_product)
);

use bikeshop;
create table employee_repository
(
    id_employee_repository int not null
        auto_increment primary key,
    employee_id            int not null references employee (id_employee),
    repository_id          int not null references repository (id_repository)
);

use bikeshop;
create table my_check_product
(
    id_my_check_product int not null
        auto_increment primary key,
    amount              int not null check (amount > 0),
    sum                 int not null check ( sum > 0 ),
    guarantee_id        int not null references guarantee (id_guarantee),
    product_id          int not null references product (id_product),
    my_check_id         int not null references my_check (id_my_check)
);

