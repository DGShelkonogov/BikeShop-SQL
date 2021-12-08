call Client_Insert('Иванов','Иван','Иванович','1234','123456');
call Client_Insert('Попов','Адольф','Леонидович','1234','123456');
call Client_Insert('Бобров','Терентий','Тихонович','4523','353253');
select * from client;

call Guarantee_Insert('2022-12-12', 100);
call Guarantee_Insert('2025-12-12', 300);


call Post_Insert('Бухгалтер', 60000);
call Post_Insert('Менеджер', 80000);
call Post_Insert('Продовец', 50000);
call Post_Insert('Уборщик', 40000);
call Post_Insert('Скадовщик', 60000);
select * from post;


call Employee_Insert('Козлов','Гордей','Мартынович',
    '+7(916)321-32-23','3255','565742','498-440-440-44','779459185070','kozlov@gmail.com',1.0,1);
call Employee_Insert('Андреева','Николь','Вадимовна',
    '+7(916)346-54-23','4334','452178','962-828-394-49','500105612393','andreeva@gmail.com',1.0,2);
call Employee_Insert('Богданова','Алевтина','Владимировна',
    '+7(916)874-34-33','3456','785526','496-809-592-36','660538623730','bagdanova@gmail.com',0.5,3);
call Employee_Insert('Петухов','Остап','Феликсович',
    '+7(916)934-12-43','2345','513546','362-339-433-43','908422101289','petux@gmail.com',1.0,4);
call Employee_Insert('Большаков','Ибрагил','Геннадьевич',
                     '+7(916)934-43-54','6453','654361','875-123-126-85','985522108649','bash@gmail.com',1.0,5);

select * from employee;


call Product_Insert('Руль', 'хороший', 1200);
call Product_Insert('Сидушка', 'Мягкая', 800);
call Product_Insert('Спидометр', 'Точный', 1500);
call Product_Insert('Тормоза', 'Надежные', 1000);
select * from Product;

call Repository_Insert('г. Москава, Олимпийский проспект, 10к1-2');
call Repository_Insert('г. Москава, Большая Декабрьская улица, 8');
select * from Repository;

call My_Check_Insert(66874, '2021-12-12', 1, 3);
call My_Check_Insert(21428, '2021-10-08', 2, 3);
call My_Check_Insert(76104, '2021-08-10', 2, 3);
select * from My_Check;

call Cell_Insert(10, 1, 1);
call Cell_Insert(12, 2, 1);
call Cell_Insert(12, 3, 1);
call Cell_Insert(8, 2, 2);
select * from Cell;

call Receiption_Insert('ООО "Рули"', 'ООО Ашот доставка', '2021-9-09', 10, 1);
call Receiption_Insert('ООО "Сидушки"', 'ООО Ашот доставка', '2021-9-09', 12, 2);
call Receiption_Insert('ООО "Без тормазов"', 'ООО Ашот доставка', '2021-10-09', 12, 3);
call Receiption_Insert('ООО "Сидушки"', 'ООО Ашот доставка', '2021-9-10', 8, 2);
select * from Receiption;


call Employee_Repository_Insert(6, 1);
select * from Employee_Repository;

call My_Check_Product_Insert(2, 1, 1000,1, 2);



UPDATE My_Check_Product SET amount = 10 WHERE id_my_check_product = 2;


select * from My_Check_Product;

select * from View_Employee;
select * from View_My_Check;
select * from View_Receiption;

SELECT Employee_Amount(1, 10.0);
SELECT Consultation_Surcharge(20000);
SELECT Receiption_Amount(1, 500);





