-- Insert into needs the table you are inserting to, the columns to be filled, and the values that will be filling/matching those columns
INSERT INTO customer (username, password,created_at) VALUES('shopper1', 'pass1', '2020-12-13'), ('shopper2', 'pass2', '2020-11-10'), ('shopper3', 'pass3', '2021-04-23'), ('shopper4', 'pass4', '2022-02-12'), ('shopper5', 'pass5', '2022-05-02'); 
INSERT INTO item (name, price) VALUES ('item1', 2.25), ('item2', 13.45), ('item3', 10.20), ('item4', 14.85), ('item5', 5.65), ('item6', 11.45), ('item7', 30.95), ('item8', 42.40), ('item9', 23.15), ('item10', 17.95);
INSERT INTO purchase (customer_id, item_id, purchase_time) VALUES (1, 2, '2020/01/14 12:30:42'), (1, 1, '2020/01/14 12:30:42'), (1, 6, '2020/01/14 12:30:42'), (1, 9, '2021/03/23 10:09:11'), (2, 7, '2020/01/14 09:42:35'), (2, 2, '2020/01/14 09:42:35'), (2, 8, '2020/01/14 09:42:35'), (2, 5, '202/11/24 12:18:14'), (2, 1, '2022/09/15 10:12:19'); (2, 3, '2020/04/30 13:20:18'), (3, 4, '2020/02/13 15:12:29'), (3, 5, '2020/02/13 15:12:29'), (3, 10, '2022/07/22 16:32:12'), (3, 5, '2022/07/22 16:32:12'), (4, 5, '2021/03/02 12:14:23'), (4, 9, '2021/03/02 12:14:23'), (4, 3, '2020/02/12 07:56:12'), (5, 6, '2021/10/10 11:02:23'), (5, 3, '2020/03/01 10:18:32'), (5, 2, '2022/06/04 17:13:12');


-- Select each column you want collected
SELECT c.username, i.name, p.purchase_time  
-- State which tables the columns are to be collected from. If more than one table, use JOIN
FROM customer c INNER JOIN purchase p  
-- adding conditionals when you want specific data from the selected table/columns selected, instead of selecting all data
ON p.customer_id = c.id 
-- this SELECT uses more than 2 tables, so another JOIN is needed to include the next table and conditionals applying to it
INNER JOIN item i ON p.item_id = i.id 
-- order by desc and limit will take the chosen data and have it displayed in order specified in desc/asc order, limited to show only 5 rows
ORDER BY p.purchase_time DESC LIMIT 5;

-- this is the call for the above select
CALL five_recent_purchaces;


-- select the customer username and also display the number of purchases that customer has made
SELECT c.username, COUNT(p.id)
-- get c.username from customer table, get purchase id from purchase table, 
-- WHERE p.customer_id matches the customer id so that it displays only that customers purchases in its row
FROM customer c INNER JOIN purchase p WHERE p.customer_id = c.id 
-- unsquish the aggregate function by adding the customer id group. It will now show each customer based on their id.
GROUP BY c.id;


-- this is the above select calls. the parameters given are to tell the db what row it should display based on the given number to match the customer id
CALL customer_purchases(2); 
CALL customer_purchases(4);
CALL customer_purchases(5);

