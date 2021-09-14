-- ����1) EMPLOYEES ���̺��� Kochhar(last_name)�� �޿����� ���� ����� ������ �����ȣ,�̸�,������,�޿��� ����϶�.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Kochhar');                
--Ǯ�̿� �Ȱ���

-- ����2) EMPLOYEES ���̺��� �޿��� ��պ��� ���� ����� �����ȣ,�̸�,������,�޿�,�μ���ȣ�� ����Ͽ���.  
SELECT employee_id, first_name, salary, job_ID,department_ID 
FROM employees
WHERE salary < (select(trunc(avg(salary)))
                from employees)
ORDER BY Salary;
--Ǯ�̿� �Ȱ���

-- ����3) EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ���� �ٸ� ��� �μ��� ����϶�
SELECT distinct(department_id)
FROM employees
WHERE salary > (select(min(salary))
                from (select salary
                      from employees
                      where department_id=100));
                      
SELECT department_id, min(salary)
FROM employees
GROUP BY department_id
having min(salary) > (select MIN(salary)
                      FROM employees
                      WHERE department_id=100);
                      
--Ʋ��

-- ����4) �������� �ּ� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�μ���ȣ�� ����Ͽ���. 
-- �� �������� �����Ͽ���.
SELECT employee_id, first_name, job_id, department_id, salary
FROM employees
WHERE (job_id, salary) IN
    (SELECT job_id,min(salary)
     FROM employees
     GROUP by job_id)
Order by job_id;


SELECT employee_id, first_name, job_id, department_id, salary
FROM employees
WHERE (job_id, salary) IN
(SELECT job_id, MIN(salary)
FROM employees
GROUP by job_id)
Order by job_id;
        
--Ǯ�̿� �Ȱ���

-- ����5) EMPLOYEES �� DEPARTMENTS ���̺��� ������ SA_MAN ����� ������ �̸�,����,�μ���,�ٹ����� ����϶�.
SELECT e.first_name, e.job_id, d.department_name, location_id
from employees e, departments d
where e.job_id = 'SA_MAN' 
    AND e.department_id=d.department_id;


SELECT e.first_name, e.job_id, d.department_name, location_id
FROM
(SELECT first_name, job_id, department_id
FROM employees
WHERE job_id = 'SA_MAN') e, departments d
WHERE e.department_id=d.department_id;

SELECT e.first_name, e.job_id, d.department_name, location_id
FROM employees e, departments d
WHERE e.department_id=d.department_id 
and e.job_id = 'SA_MAN';
--�ι�° Ǯ�̷� ���� ����
-- ����6) EMPLOYEES ���̺��� ���� ���� ����� ���� MANAGER�� �����ȣ�� ����϶�.
SELECT manager_id, count(*)
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_ID) = (SELECT MAX(count(*))
                            FROM employees
                            group by manager_id);
--��Ǯ������
-- ����7) EMPLOYEES ���̺��� ���� ���� ����� ���� �ִ� �μ� ��ȣ�� �������  ����϶�.
SELECT department_id, count(*)
FROM employees
GROUP BY department_id
HAVING count(department_ID) =  (SELECT MAX(COUNT(*))
                                FROM employees
                                GROUP BY department_id);
--Ʋ��
-- ����8) EMPLOYEES ���̺��� �����ȣ�� 123�� ����� ������ ���� �����ȣ�� 192�� ����� �޿����� ���� ����� �����ȣ,�̸�,����,�޿��� ����϶�.
SELECT employee_id, first_name, job_id, salary
FROM employees
where job_id IN (SELECT job_id
                 FROM employees
                 WHERE employee_id = '123') 
   AND salary > (SELECT salary
                 FROM employees
                 WHERE employee_id='192');
--����
-- ����9)�������� �ּұ޿��� �޴� ����� ������ �����ȣ,�̸�,����,�μ����� ����϶�.
-- ����1 :�������� ������������
SELECT e.employee_id, e.first_name, e.job_id, d.department_name
FROM employees e, departments d
WHERE (job_id,salary) IN ( SELECT job_id, min(salary)
                           FROM employees
                           GROUP BY job_id) 
                  and e.department_id=d.department_id
ORDER BY JOB_ID desc;
--Ʋ�� �ٽ� ����
-- ����10) EMPLOYEES ���̺��� 50�� �μ��� �ּ� �޿��� �޴� ������� ���� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. 
-- �� 50���� ����
SELECT employee_id , first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT min(salary)
                FROM employees
                WHERE department_id = 50)
        AND department_id <> 50;

-- ����11) EMPLOYEES ���̺��� 50�� �μ��� �ְ� �޿��� �޴� ������� ���� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. 
-- ��50���� ����
SELECT employee_id , first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT max(salary)
                FROM employees
                WHERE department_id = 50)
        AND department_id <> 50;







