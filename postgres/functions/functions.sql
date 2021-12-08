create or replace function Employee_Amount(p_ID_Employee int, p_Worked_Hours decimal(38, 2))
returns decimal(38, 2)
language plpgsql as
$$
declare
count_money decimal(38, 2);
begin
select sum((Post_Part * Salary * 0.87) * (p_Worked_Hours / 160))
into count_money
from Employee
         inner join Post on ID_Post = Post_ID
where ID_Employee = p_ID_Employee;
return count_money;
end;
$$;


create or replace function Consultation_Surcharge(p_Sum int)
    returns decimal(38, 2)
    language plpgsql as
$$
declare
    count_money decimal(38, 2);
begin
    select sum(p_Sum * 0.1) into count_money;
    return count_money;
end;
$$;

create or replace function Receiption_Amount(p_Receiption int, p_Delivery int)
    returns decimal(38, 2)
    language plpgsql as
$$
declare
    count_money decimal(38, 2);
begin
    select sum((Amount * Product.price) + p_Delivery)
    into count_money
    from Receiption
             inner join Product on Id_Product = Product_ID
    where ID_Receiption = p_Receiption;
    return count_money;
end;
$$;

