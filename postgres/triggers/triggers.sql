CREATE OR REPLACE FUNCTION calculate_sum_My_Check_Product() RETURNS TRIGGER AS
$$
DECLARE
    pr int;
BEGIN
    if(OLD.amount != NEW.amount) THEN
        pr = (select price from Product where NEW.Product_ID = ID_Product) * NEW.amount;
        NEW.sum := pr;
    END IF;
    return NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_My_Check_Product
    BEFORE UPDATE
    ON My_Check_Product
    FOR EACH ROW
EXECUTE PROCEDURE calculate_sum_My_Check_Product();
