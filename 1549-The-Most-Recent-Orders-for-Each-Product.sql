/* 
Thoughts:
Find most recent order(s) of each product.
**One product may have more than one order in same max date. 
MAX(Date) won't work because we need MAX by grouping so use RANK() OVER (PARTITION..) 
This gives multiple max rows as well.
*/