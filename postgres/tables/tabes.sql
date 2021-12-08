create table Client
(
    ID_Client       SERIAL      not null
        constraint PK_Client primary key,
    First_Name      varchar(30) not null,
    Second_Name     varchar(30) not null,
    Middle_Name     varchar(30) null default ('-'),
    Passport_Number varchar(4)  not null
        constraint CH_Passport_Number check
            (Passport_Number similar to '[0-9][0-9][0-9][0-9]'),
    Passport_Series varchar(6)  not null
        constraint CH_Passport_Series check
            (Passport_Series similar to '[0-9][0-9][0-9][0-9][0-9][0-9]')
);

comment on table Client is 'Таблица хранит в себе информацию о клиентах';
comment on column Client.First_Name is 'Имя клиента';
comment on column Client.Second_Name is 'Фамилия клиента';
comment on column Client.Middle_Name is 'Отчество клиента';
comment on column Client.Passport_Number is 'Номер паспорта клиента';
comment on column Client.Passport_Series is 'Серия паспорта клиента';

create table Guarantee
(
    ID_Guarantee SERIAL not null
        constraint PK_Guarantee primary key,
    End_Date     Date   not null,
    Price        int    not null check (Price >= 0)
);

comment on table Guarantee is 'Таблица хранит в себе информацию о гарантийных талонах';
comment on column Guarantee.End_Date is 'Дата сгорания талона';
comment on column Guarantee.Price is 'Цена за талон';


create table Post
(
    ID_Post SERIAL         not null
        constraint PK_Post primary key,
    Title   varchar(50)    not null unique,
    Salary  decimal(38, 2) null default 0.0 check (Salary >= 0)
);

comment on table Post is 'Таблица хранит в себе информацию о должностях';
comment on column Post.Title is 'Название должности';
comment on column Post.Salary is 'Оклад должности';



create table Employee
(
    ID_Employee     SERIAL         not null
        constraint PK_Employee primary key,
    First_Name      varchar(30)    not null,
    Second_Name     varchar(30)    not null,
    Middle_Name     varchar(30)    null default ('-'),
    Phone           varchar(19)    not null
        constraint CH_Phone check
            (Phone similar to '\+7\([0-9][0-9][0-9]\)[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
    Passport_Number varchar(4)     not null
        constraint CH_Passport_Number check
            (Passport_Number similar to '[0-9][0-9][0-9][0-9]'),
    Passport_Series varchar(6)     not null
        constraint CH_Passport_Series check
            (Passport_Series similar to '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    SNILS           varchar(14)    not null check
        (SNILS similar to '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]'),
    INN             varchar(12)    not null check
        (INN similar to '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Email           varchar(100)   null
        constraint CH_Email check
            (Email similar to '%@%.%')  default ('@.'),

    Post_Part       decimal(38, 1) null default 0.1 check (Post_Part > 0.0),
    Post_ID         int            not null references Post (ID_Post)
);

comment on table Employee is 'Таблица хранит в себе информацию о сотрудниках';
comment on column Employee.First_Name is 'Имя сотрудника';
comment on column Employee.Second_Name is 'Фамилия сотрудника';
comment on column Employee.Middle_Name is 'Отчество сотрудника';
comment on column Employee.Phone is 'телефон сотрудника';
comment on column Employee.Passport_Number is 'Номер паспорта сотрудника';
comment on column Employee.Passport_Series is 'Серия паспорта сотрудника';
comment on column Employee.SNILS is 'СНИЛС сотрудника';
comment on column Employee.INN is 'ИНН сотрудника';
comment on column Employee.Email is 'Почта сотрудника';
comment on column Employee.Post_Part is 'Ставка сотрудника';
comment on column Employee.Post_ID is 'Внешний ключ должности сотрудника';


create table Product
(
    ID_Product     SERIAL       not null
        constraint PK_Product primary key,
    Title          varchar(50)  not null unique,
    Characteristic varchar(500) not null,
    Price          int          not null check (Price >= 0)
);
comment on table Product is 'Таблица хранит в себе информацию о сотрудниках';
comment on column Product.Title is 'Название продукта';
comment on column Product.Characteristic is 'характеристика продукта';
comment on column Product.Price is 'Цена за продукт';

create table Repository
(
    ID_Repository SERIAL       not null
        constraint PK_Repository primary key,
    Address       varchar(200) not null unique
);
comment on table Repository is 'Таблица хранит в себе информацию о Складах';
comment on column Repository.Address is 'Адресс склада';

create table My_Check
(
    ID_My_Check    SERIAL not null
        constraint PK_My_Check primary key,
    Number         int    not null unique,
    Date_of_create Date   not null,
    Client_ID      int    not null references Client (ID_Client),
    Employee_ID    int    not null references Employee (ID_Employee)
);
comment on table My_Check is 'Таблица хранит в себе информацию о чеках';
comment on column My_Check.Number is 'Номер чека';
comment on column My_Check.Date_of_create is 'дата создания чека';
comment on column My_Check.Client_ID is 'Клиент, получивший чек';
comment on column My_Check.Employee_ID is 'Сотрудник выписавший чек';

create table Cell
(
    ID_Cell       SERIAL not null
        constraint PK_Cell primary key,
    Amount        int    not null check (Amount > 0),
    Product_ID    int    not null references Product (ID_Product),
    Repository_ID int    not null references Repository (ID_Repository)
);
comment on table Cell is 'Таблица хранит в себе информацию о ячейках';
comment on column Cell.Amount is 'Количество товара в ячейке';
comment on column Cell.Product_ID is 'Товар в ячейке';
comment on column Cell.Repository_ID is 'Код склада, на котором находится ячейка';

create table Receiption
(
    ID_Receiption SERIAL       not null
        constraint PK_Receiption primary key,
    Manufacturer  varchar(300) not null,
    Shipper       varchar(300) not null,
    Date_receipt  Date         not null,
    Amount        int          not null check (Amount > 0),
    Product_ID    int          not null references Product (ID_Product)
);
comment on table Receiption is 'Таблица хранит в себе информацию о приеме товара';
comment on column Receiption.Manufacturer is 'Производитель товара';
comment on column Receiption.Shipper is 'Поставщик товара';
comment on column Receiption.Date_receipt is 'Дата приема товара';
comment on column Receiption.Amount is 'Количество товара';
comment on column Receiption.Product_ID is 'Товар';

create table Employee_Repository
(
    ID_Employee_Repository SERIAL not null
        constraint PK_Employee_Repository primary key,
    Employee_ID            int    not null references Employee (ID_Employee),
    Repository_ID          int    not null references Repository (ID_Repository)
);
comment on table Employee_Repository is 'Таблица хранит в себе информацию о том какие сотрудники работают в каких складах';
comment on column Employee_Repository.Employee_ID is 'Код сотрудника';
comment on column Employee_Repository.Repository_ID is 'Код склада';

create table My_Check_Product
(
    ID_My_Check_Product SERIAL not null
        constraint PK_My_Check_Product primary key,
    Amount              int    not null check (Amount > 0),
    Sum int not null check ( Sum > 0 ),
    Guarantee_ID        int    not null references Guarantee (ID_Guarantee),
    Product_ID          int    not null references Product (ID_Product),
    My_Check_ID         int    not null references My_Check (ID_My_Check)
);
comment on table My_Check_Product is 'Таблица хранит в себе информацию о чеке и гарантии';
comment on column My_Check_Product.Amount is 'Количетсво товара';
comment on column My_Check_Product.Sum is 'Итоговая сумма';
comment on column My_Check_Product.Guarantee_ID is 'Код гарантии';
comment on column My_Check_Product.Product_ID is 'Код товара';
comment on column My_Check_Product.My_Check_ID is 'Код чека';
