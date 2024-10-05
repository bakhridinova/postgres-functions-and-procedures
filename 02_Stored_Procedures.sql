-- procedure to update the stock quantity for a given product id
create or replace procedure update_stock(product_id int, quantity int) as $$
begin
    update products
    set unitsinstock = unitsinstock + quantity
    where productid = product_id;

    if not found then
        raise exception 'Product ID % not found', product_id;
    end if;
exception
    when others then
        raise exception 'Error updating stock: %', sqlerrm;
end;
$$ language plpgsql;

-- test

call update_stock(11, 20);
call update_stock(5, 10);
call update_stock(15, -5);