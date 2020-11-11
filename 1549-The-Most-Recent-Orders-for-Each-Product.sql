/* 
Thoughts:
Find most recent order(s) of each product.
**One product may have more than one order in same max date. 
MAX(Date) won't work because we need MAX by grouping so use RANK() OVER (PARTITION..) 
This gives multiple max rows as well.
*/

SELECT p.product_name, p.product_id, o.order_id, MAX(o.order_date) as order_date FROM
Products p JOIN
(SELECT *, RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) as ranking
FROM Orders) o
ON o.product_id = p.product_id
WHERE o.ranking = 1
GROUP BY o.product_id, o.order_id
ORDER BY product_name, product_id, order_id;