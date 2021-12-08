use bikeshop;
DELIMITER //
create  procedure client_insert(p_first_name varchar(30), p_second_name varchar(30),
                                p_middle_name varchar(30), p_passport_number varchar(4),
                                p_passport_series varchar(6))

begin
    declare
        have_record int ; select count(*) into have_record from client
                          where first_name = p_first_name and second_name = p_second_name and middle_name = p_middle_name
                            and passport_number = p_passport_number and passport_series = p_passport_series;

    if have_record > 0 then
        select 'такой клиент уже существует в таблице';
    else
        insert into client (first_name, second_name, middle_name, passport_number, passport_series)
        values (p_first_name, p_second_name, p_middle_name, p_passport_number, p_passport_series);
    end if;
end;


use bikeshop;
DELIMITER //
create  procedure guarantee_insert(p_end_date date, p_price int)

begin
    declare
        have_record int ; select count(*) into have_record from guarantee
                          where end_date = p_end_date and price = p_price;

    if have_record > 0 then
        select 'такая гарантия уже существует в таблице';
    else
        insert into guarantee (end_date, price)
        values (p_end_date, p_price);
    end if;
end;


use bikeshop;
DELIMITER //
create  procedure post_insert(p_title varchar(50), p_salary decimal(38, 2))

begin
    declare
        have_record int ; select count(*) into have_record from post
                          where title = p_title and salary = p_salary;

    if have_record > 0 then
        select 'такая должность уже существует в таблице';
    else
        insert into post (title, salary)
        values (p_title, p_salary);
    end if;
end;


use bikeshop;
DELIMITER //
create  procedure employee_insert(p_first_name varchar(30), p_second_name varchar(30),
                                  p_middle_name varchar(30), p_phone varchar(19),
                                  p_passport_number varchar(4),
                                  p_passport_series varchar(6), p_snils varchar(14), p_inn varchar(12),
                                  p_email varchar(100), p_post_part decimal(38, 1), p_post_id int)

begin
    declare
        have_record int ; select count(*) into have_record from employee
                          where
                                  first_name = p_first_name and
                                  second_name = p_second_name and
                                  middle_name = p_middle_name and
                                  phone = p_phone and
                                  passport_number = p_passport_number and
                                  passport_series = p_passport_series and
                                  snils = p_snils and
                                  inn = p_inn and
                                  email = p_email and
                                  post_part = p_post_part and
                                  post_id = p_post_id;

    if have_record > 0 then
        select 'такой сотрудник уже существует в таблице';
    else
        insert into employee (first_name, second_name, middle_name, phone, passport_number, passport_series, snils, inn,
                              email, post_part, post_id)
        values (p_first_name, p_second_name, p_middle_name, p_phone, p_passport_number, p_passport_series, p_snils,
                p_inn,
                p_email, p_post_part, p_post_id);
    end if;
end;



use bikeshop;
DELIMITER //
create  procedure product_insert(p_title varchar(50), p_characteristic varchar(500), p_price int)

begin
    declare
        have_record int ; select count(*) into have_record from product
                          where title = p_title and characteristic = p_characteristic and price = p_price;

    if have_record > 0 then
        select 'такой товар уже существует в таблице';
    else
        insert into product (title, characteristic, price)
        values (p_title, p_characteristic, p_price);
    end if;
end;




use bikeshop;
DELIMITER //
create  procedure repository_insert(p_address varchar(200))

begin
    declare
        have_record int ; select count(*) into have_record from repository
                          where address = p_address;

    if have_record > 0 then
        select 'такой склад уже существует в таблице';
    else
        insert into repository (address)
        values (p_address);
    end if;
end;


use bikeshop;
DELIMITER //
create  procedure my_check_insert(p_number int, p_date_of_create date, p_client_id int, p_employee_id int)

begin
    DECLARE
        have_record int; select count(*) into have_record from My_Check
	where Number = p_Number and Date_of_create = p_Date_of_create
        and Client_ID = p_Client_ID and Employee_ID = p_Employee_ID;
        if have_record > 0 then
            select 'Такой чек уже существует в таблице';
        else
            insert into My_Check (Number, Date_of_create, Client_ID, Employee_ID)
            values (p_Number, p_Date_of_create, p_Client_ID, p_Employee_ID);
        end if;
end;



use bikeshop;
DELIMITER //
create  procedure cell_insert(p_amount int, p_product_id int, p_repository_id int)

begin
    declare
        have_record int ; select count(*) into have_record from cell
                          where amount = p_amount and  product_id = p_product_id and repository_id = p_repository_id;

    if have_record > 0 then
        select 'такая ячейка уже существует в таблице';
    else
        insert into cell (amount, product_id, repository_id)
        values (p_amount, p_product_id, p_repository_id);
    end if;
end;




use bikeshop;
DELIMITER //
create  procedure receiption_insert(p_manufacturer varchar(300), p_shipper varchar(300),
                                    p_date_receipt date, p_amount int, p_product_id int)

begin
    declare
        have_record int ; select count(*) into have_record from receiption
                          where manufacturer = p_manufacturer and  shipper = p_shipper and date_receipt = p_date_receipt
                            and amount = p_amount and product_id = p_product_id;

    if have_record > 0 then
        select 'такая запись уже существует в таблице';
    else
        insert into receiption (manufacturer, shipper, date_receipt, amount, product_id)
        values (p_manufacturer, p_shipper, p_date_receipt, p_amount, p_product_id);
    end if;
end;



use bikeshop;
DELIMITER //
create  procedure employee_repository_insert(p_employee_id int, p_repository_id int)

begin
    declare
        have_record int ; select count(*) into have_record from employee_repository
                          where employee_id = p_employee_id and  repository_id = p_repository_id;

    if have_record > 0 then
        select 'такая запись уже существует в таблице';
    else
        insert into employee_repository (employee_id, repository_id)
        values (p_employee_id, p_repository_id);
    end if;
end;


use bikeshop;
DELIMITER //
create  procedure my_check_product_insert(p_amount int, p_guarantee_id int, p_sum int ,p_product_id int,
                                          p_my_check_id int)

begin
    declare
        have_record int ; select count(*) into have_record from my_check_product
                          where amount = p_amount and  guarantee_id = p_guarantee_id and sum = p_sum  and product_id = p_product_id and my_check_id = p_my_check_id;

    if have_record > 0 then
        select 'такая запись уже существует в таблице';
    else
        insert into my_check_product (amount, guarantee_id, sum, product_id, my_check_id)
        values (p_amount, p_guarantee_id, p_sum, p_product_id, p_my_check_id);
    end if;
end;
