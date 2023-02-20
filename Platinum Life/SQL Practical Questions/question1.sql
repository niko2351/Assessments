/* Question 1.1 */
SELECT `Client Info`.client_id, `Client Info`.client_name, `Client Info`.client_gender, `Client Info`.client_age, Company.department
FROM `Client Info`
JOIN Company
ON `Client Info`.client_id=Company.client_id;

/*
	Question 1.2 : A left join

*/

/*
	Question 1.3 : Since the table name is not stated, I will refer to it as Employee
*/

/* Question 1.3.1 */
SELECT e.id, e.employee_name, m.employee_name AS Manager
FROM EMPLOYEE e
INNER JOIN EMPLOYEE m
ON e.manager_id = m.id;


/*
	Question 1.3.1 : Pieter is the boss
*/