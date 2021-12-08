create or replace view View_Employee
as
select concat(Second_Name, ' ', substring(First_Name, 1, 1), '.', substring(Middle_Name, 1, 1), '.')
           as "Фамилия и инициалы сотрудника",
       concat('Мобильный телефон: ', Phone, ', адрес электронной почты: ', Email)
           as "Контактная информация",
       concat(
               'Название должности - ', Title, 'с окладом в ', cast(Salary as varchar(100)), 'руб., по ставке - ',
               Post_Part,
               '. Доход состовляет: - Без НДФЛ- ', cast(round(Salary * Post_Part, 2) as varchar(100)),
               ' руб. - С НДФЛ - ', cast(round(Salary * Post_Part * 0.87, 2) as varchar(100)), ' руб.')
           as "Данные о занимаемых должностях"
from Employee
         inner join Post on Post_ID = ID_Post;


create or replace view View_My_Check
as
select concat(Employee.Second_Name, ' ', substring(Employee.First_Name, 1, 1), '.', substring(Employee.Middle_Name, 1, 1), '.')
           as "Фамилия и инициалы сотрудника",
        concat(Client.Second_Name, ' ', substring(Client.First_Name, 1, 1), '.', substring(Client.Middle_Name, 1, 1), '.')
            as "Фамилия и инициалы клиента",
       concat(
               ' Дата выдачи чека: ', My_Check.date_of_create, ' Номер чека: ', My_Check.Number,
               ' Дата горантии: ', Guarantee.end_date,
                   ' Название товара: ', Product.title)
           as "Данные о чеке"
from My_Check_Product
         inner join My_Check on My_Check_ID = ID_My_Check
         inner join Employee on Employee_ID = ID_Employee
         inner join Client on Client_ID = ID_Client
         inner join Guarantee on Guarantee_ID = ID_Guarantee
         inner join Product on Product_ID = ID_Product;


create or replace view View_Receiption
as
select
       concat(
               ' Производитель товара: ', Manufacturer, ' Поставщик товара: ', Shipper,
               ' Дата приема товара: ', Date_receipt,
               ' Название товара: ', Product.title,
               ' Количество товара: ', Amount)
           as "Данные о чеке"
from Receiption
         inner join Product on Product_ID = ID_Product;


