create or replace procedure Client_Insert(p_First_Name varchar(30), p_Second_Name varchar(30),
                                          p_Middle_Name varchar(30), p_Passport_Number varchar(4),
                                          p_Passport_Series varchar(6))
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Client
	where First_Name = p_First_Name and Second_Name = p_Second_Name and Middle_Name = p_Middle_Name
        and Passport_Number = p_Passport_Number and Passport_Series = p_Passport_Series;
begin
    if have_record > 0 then
        raise exception 'Такой клиент уже существует в таблице';
    else
        insert into Client (First_Name, Second_Name, Middle_Name, Passport_Number, Passport_Series)
        values (p_First_Name, p_Second_Name, p_Middle_Name, p_Passport_Number, p_Passport_Series);
    end if;
end;
$$;

create or replace procedure Guarantee_Insert(p_End_Date Date, p_Price int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Guarantee
	where End_Date = p_End_Date and Price = p_Price;
begin
    if have_record > 0 then
        raise exception 'Такая гарантия уже существует в таблице';
    else
        insert into Guarantee (End_Date, Price)
        values (p_End_Date, p_Price);
    end if;
end;
$$;

create or replace procedure Post_Insert(p_Title varchar(50), p_Salary decimal(38, 2))
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Post
	where Title = p_Title and Salary = p_Salary;
begin
    if have_record > 0 then
        raise exception 'Такая должность уже существует в таблице';
    else
        insert into Post (Title, Salary)
        values (p_Title, p_Salary);
    end if;
end;
$$;

create or replace procedure Employee_Insert(p_First_Name varchar(30), p_Second_Name varchar(30),
                                            p_Middle_Name varchar(30), p_Phone varchar(19),
                                            p_Passport_Number varchar(4),
                                            p_Passport_Series varchar(6), p_SNILS varchar(14), p_INN varchar(12),
                                            p_Email varchar(100), p_Post_Part decimal(38, 1), p_Post_ID int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Employee
	where
        First_Name = p_First_Name and
        Second_Name = p_Second_Name and
        Middle_Name = p_Middle_Name and
        Phone = p_Phone and
        Passport_Number = p_Passport_Number and
        Passport_Series = p_Passport_Series and
        SNILS = p_SNILS and
        INN = p_INN and
        Email = p_Email and
        Post_Part = p_Post_Part and
        Post_ID = p_Post_ID;
begin
    if have_record > 0 then
        raise exception 'Такой сотрудник уже существует в таблице';
    else
        insert into Employee (First_Name, Second_Name, Middle_Name, Phone, Passport_Number, Passport_Series, SNILS, INN,
                              Email, Post_Part, Post_ID)
        values (p_First_Name, p_Second_Name, p_Middle_Name, p_Phone, p_Passport_Number, p_Passport_Series, p_SNILS,
                p_INN,
                p_Email, p_Post_Part, p_Post_ID);
    end if;
end;
$$;


create or replace procedure Product_Insert(p_Title varchar(50), p_Characteristic varchar(500), p_Price int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Product
	where Title = p_Title and Characteristic = p_Characteristic and Price = p_Price;
begin
    if have_record > 0 then
        raise exception 'Такой товар уже существует в таблице';
    else
        insert into Product (Title, Characteristic, Price)
        values (p_Title, p_Characteristic, p_Price);
    end if;
end;
$$;



create or replace procedure Repository_Insert(p_Address varchar(200))
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Repository
	where Address = p_Address;
begin
    if have_record > 0 then
        raise exception 'Такой склад уже существует в таблице';
    else
        insert into Repository (Address)
        values (p_Address);
    end if;
end;
$$;

create or replace procedure My_Check_Insert(p_Number int, p_Date_of_create Date, p_Client_ID int, p_Employee_ID int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from My_Check
	where Number = p_Number and Date_of_create = p_Date_of_create
        and Client_ID = p_Client_ID and Employee_ID = p_Employee_ID;
begin
    if have_record > 0 then
        raise exception 'Такой чек уже существует в таблице';
    else
        insert into My_Check (Number, Date_of_create, Client_ID, Employee_ID)
        values (p_Number, p_Date_of_create, p_Client_ID, p_Employee_ID);
    end if;
end;
$$;


create or replace procedure Cell_Insert(p_Amount int, p_Product_ID int, p_Repository_ID int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Cell
	where Amount = p_Amount and  Product_ID = p_Product_ID and Repository_ID = p_Repository_ID;
begin
    if have_record > 0 then
        raise exception 'Такая ячейка уже существует в таблице';
    else
        insert into Cell (Amount, Product_ID, Repository_ID)
        values (p_Amount, p_Product_ID, p_Repository_ID);
    end if;
end;
$$;



create or replace procedure Receiption_Insert(p_Manufacturer varchar(300), p_Shipper varchar(300),
                                              p_Date_receipt Date, p_Amount int, p_Product_ID int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Receiption
	where Manufacturer = p_Manufacturer and  Shipper = p_Shipper and Date_receipt = p_Date_receipt
    and Amount = p_Amount and Product_ID = p_Product_ID;
begin
    if have_record > 0 then
        raise exception 'Такая запись уже существует в таблице';
    else
        insert into Receiption (Manufacturer, Shipper, Date_receipt, Amount, Product_ID)
        values (p_Manufacturer, p_Shipper, p_Date_receipt, p_Amount, p_Product_ID);
    end if;
end;
$$;


create or replace procedure Employee_Repository_Insert(p_Employee_ID int, p_Repository_ID int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from Employee_Repository
	where Employee_ID = p_Employee_ID and  Repository_ID = p_Repository_ID;
begin
    if have_record > 0 then
        raise exception 'Такая запись уже существует в таблице';
    else
        insert into Employee_Repository (Employee_ID, Repository_ID)
        values (p_Employee_ID, p_Repository_ID);
    end if;
end;
$$;

create or replace procedure My_Check_Product_Insert(p_Amount int, p_Guarantee_ID int, p_Sum int ,p_Product_ID int,
                                                    p_My_Check_ID int)
    language plpgsql
as $$
DECLARE
    have_record int := count(*) from My_Check_Product
	where Amount = p_Amount and  Guarantee_ID = p_Guarantee_ID and Sum = p_Sum  and Product_ID = p_Product_ID and My_Check_ID = p_My_Check_ID;
begin
    if have_record > 0 then
        raise exception 'Такая запись уже существует в таблице';
    else
        insert into My_Check_Product (Amount, Guarantee_ID, Sum, Product_ID, My_Check_ID)
        values (p_Amount, p_Guarantee_ID, p_Sum, p_Product_ID, p_My_Check_ID);
    end if;
end;
$$;