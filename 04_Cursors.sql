-- pl/pgsql block using a cursor to iterate through orders and calculate totals
do $$
    declare
        order_record record;
        order_cursor cursor for select orderid from orders;
        total numeric;
    begin
        open order_cursor;
        loop
            fetch order_cursor into order_record;
            exit when not found;
            begin
                total := calculate_order_total(order_record.orderid);
                raise notice 'order id % has a total of %', order_record.orderid, total;
            exception
                when others then
                    raise notice 'Failed to calculate total for order id %: %', order_record.orderid, sqlerrm;
            end;
        end loop;
        close order_cursor;
    exception
        when others then
            raise exception 'Error processing orders: %', sqlerrm;
    end;
$$ language plpgsql;

-- order id 1 has a total of 680.20
-- order id 2 has a total of 850.00
-- order id 3 has a total of 795.25
-- order id 4 has a total of 680.00
-- order id 5 has a total of 624.50
-- order id 6 has a total of 1268.25
-- order id 7 has a total of 840.00
-- order id 8 has a total of 730.75
-- order id 9 has a total of 3026.50
-- order id 10 has a total of 3153.25
-- Failed to calculate total for order id 11: Error calculating order total: No order details found for order ID 11
-- Failed to calculate total for order id 12: Error calculating order total: No order details found for order ID 12
-- Failed to calculate total for order id 13: Error calculating order total: No order details found for order ID 13
-- Failed to calculate total for order id 14: Error calculating order total: No order details found for order ID 14
-- Failed to calculate total for order id 15: Error calculating order total: No order details found for order ID 15
-- Failed to calculate total for order id 16: Error calculating order total: No order details found for order ID 16
-- Failed to calculate total for order id 17: Error calculating order total: No order details found for order ID 17
-- Failed to calculate total for order id 18: Error calculating order total: No order details found for order ID 18
-- Failed to calculate total for order id 19: Error calculating order total: No order details found for order ID 19
-- Failed to calculate total for order id 20: Error calculating order total: No order details found for order ID 20