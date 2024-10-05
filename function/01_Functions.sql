-- function to calculate the total for a given order id
create or replace function calculate_order_total(order_id int) returns numeric as $$
declare
    total numeric := 0;
begin
    select sum(d.unitprice * d.quantity * (1 - d.discount))
    into total
    from order_details d
    where d.orderid = order_id;

    if total is null then
        raise exception 'No order details found for order ID %', order_id;
    end if;

    return round(total, 2);
exception
    when others then
        raise exception 'Error calculating order total: %', sqlerrm;
end;
$$ language plpgsql;

-- test
-- calculate_order_total(5)
select calculate_order_total(5);
-- result: 624.5

-- calculate_order_total(10)
select calculate_order_total(10);
-- result: 3153.25

-- calculate_order_total(15)
select calculate_order_total(15);
-- [2024-10-05 22:00:48] [P0001] ERROR: Error calculating order total: No order details found for order ID 15
-- [2024-10-05 22:00:48] Where: PL/pgSQL function calculate_order_total(integer) line 17 at RAISE