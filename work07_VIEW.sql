-- ����1) EMPLOYEES ���̺��� 20�� �μ��� ���� ������ �����ϴ� EMP_20 VIEW�� ���� �϶�
CREATE OR REPLACE VIEW EMP_20
AS
SELECT *
FROM employees
WHERE department_id =20;


-- ����2) EMPLOYEES ���̺��� 30�� �μ��� 
-- EMPLOYEE_ID �� emp_no �� LAST_NAME�� name���� SALARY�� sal�� �ٲپ� EMP_30 VIEW�� �����϶�.
CREATE or REPLACE VIEW EMP_30
AS
SELECT employee_id AS emp_no, last_name as name, salary sal, department_id deptno
FROM employees
where department_id = 30;

CREATE OR REPLACE VIEW EMP_30_1
AS
SELECT employee_id, last_name, salary, department_id 
FROM employees
WHERE department_id = 30;

SELECT * FROM emp_30;

-- ����3) �μ����� �μ���,�ּ� �޿�,�ִ� �޿�,�μ��� ��� �޿��� �����ϴ� DEPT_SUM VIEW�� �����Ͽ���.
CREATE OR REPLACE VIEW DEPT_SUM(dname, minsal, maxsal, avgsal)
As
SELECT d.department_name, MIN(salary), Max(salary), ROUND(AVG(e.salary), 1)
FROM departments d, employees e
WHERE d.department_id = e.department_id
GROUP BY d.department_name;

 ����4) �տ��� ������ EMP_20,EMP_30 VIEW�� �����Ͽ���.
 DROP VIEW emp_20;
 DROP view emp_30;
 drop view dept_sum;



















