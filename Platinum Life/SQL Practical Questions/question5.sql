/* Question 5.1 */

SELECT make, model,cost,manufacture_date,Parts,Warranty_Expiry_Date
INTO #temporary_table
FROM originaltable;

/* 
	Question 5.2: Either rename the new temporary table or drop the previous one and re-run the script 
*/