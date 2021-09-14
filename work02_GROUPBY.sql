-- hr ����
-- ����1) EMPLOYEES ���̺��� �Ի����� ������ �����Ͽ� �����ȣ, �̸�, ����, �޿�, �Ի�����,�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID,FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY HIRE_DATE; 

-- ����2) EMPLOYEES ���̺��� ���� �ֱٿ� �Ի��� ������ �����ȣ, �̸�, ����, �޿�, �Ի�����,�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID,FIRST_NAME, JOB_ID, SALARY, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC; 

-- ����3) EMPLOYEES ���̺��� �μ���ȣ�� ������ �� �μ���ȣ�� ���� ��� �޿��� ���� ������ �����Ͽ� �����ȣ, ����, ����, �μ���ȣ, �޿��� ����Ͽ���.
SELECT EMPLOYEE_ID,FIRST_NAME, JOB_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES;

SELECT employee_id, first_name, job_id, department_id, salary 
FROM employees
ORDER BY department_id ASC, salary DESC;


-- ����4) EMPLOYEES ���̺��� ù��° ������ �μ���ȣ�� �ι�° ������ ������ ����° ������ �޿��� ���� ������ �����Ͽ� 
-- �����ȣ, ����, �Ի�����, �μ���ȣ, ����, �޿��� ����Ͽ���.
SELECT EMPLOYEE_ID,FIRST_NAME, HIRE_DATE, DEPARTMENT_ID, JOB_ID, SALARY
FROM EMPLOYEES;

SELECT employee_id, first_name, hire_date, department_id, job_id, salary
FROM employees
ORDER BY department_id ASC, job_id ASC, salary DESC;

-- hr ǥ���Լ�

-- ����1) EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID,FIRST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE last_name like 'K%';

SELECT employee_id, last_name, UPPER(job_id), department_id
FROM employees
WHERE UPPER(last_name) = 'KING';    


-- ����2) DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), �μ��̸��� ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.
SELECT department_id || ' ' || department_name, department_name || ' ' || location_id 
FROM departments;


-- ����3) EMPLOYEES ���̺��� �̸��� ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�. 
-- �� �̸������� �����Ͽ���.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY,DEPARTMENT_ID
FROM employees
WHERE SUBSTR(FIRST_NAME, 1, 1) > 'K' AND SUBSTR(FIRST_NAME, 1, 1) < 'Y'
ORDER BY FIRST_NAME ASC;

-- ����4) EMPLOYEES ���̺��� 20�� �μ� �� �̸��� ���� �� �޿��� �ڸ����� �����ȣ, �̸�, �̸��� ������ ����, �޿�, �޿��� �ڸ����� ����϶�.
SELECT EMPLOYEE_ID, FIRST_NAME, length(FIRST_NAME), SALARY, length(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '20'
order by department_id;

-- ����5) EMPLOYEES ���̺��� �̸�����  ��e������ ��ġ�� ����϶�.
SELECT first_name, instr(first_name, 'e',1,1)
FROM employees;


-- ����6) ROUND �Լ��� ����Ͽ� 4567.678�� �Ҽ��� ������ ���� ��µǵ��� �϶�.
SELECT ROUND (4567.678) FROM DUAL;
SELECT ROUND (4567.678,0) FROM DUAL;
SELECT ROUND (4567.678,2) FROM DUAL;
SELECT ROUND (4567.678,-2) FROM DUAL;
4568
4568
4567.68
4600

-- ����7) EMPLOYEES ���̺��� �μ���ȣ�� 80�� ����� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
SELECT employee_id, first_name, MOD(salary, 30), salary 
FROM employees
WHERE department_id = 80;
-- ����8) EMPLOYEES ���̺��� 30�� �μ� �� �̸��� ��� ������ �����Ͽ� ����Ͽ���. 
-- �� ��� ������ �� �� �Ʒ��� ����϶�.
SELECT first_name || CHR(10) || job_id 
FROM employees
WHERE department_id = 30;
-- ����9) EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���. 
-- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.(�߿�)
SELECT first_name, hire_date,
    Trunc(sysdate - hire_date) as "�� �ٹ� �ϼ�",
    Trunc(to_date('21/09/10') - to_date('21/08/23')) as "�� �ٹ� �ϼ�2",
    TRUNC((sysdate - hire_date) / 7) as "�� �ٹ� �ּ�",
    TRUNC(MOD((sysdate - hire_date) , 7)) as "������ �� ��"
FROM employees -- to_date to_char �� ����ϱ�
ORDER BY "�� �ٹ� �ϼ�" desc;

-- ����10) EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
SELECT  first_name, salary, to_char(salary,'$999,999')
FROM employees
where department_id = '50';




-- hr �׷���
-- ����1) EMPLOYEES ���̺��� ��� SALESMAN(SA_)�� ���Ͽ� �޿��� ���, �ְ��, ������, �հ踦 ���Ͽ� ����Ͽ���.
SELECT avg(salary),max(salary),min(salary),sum(salary)
FROM employees
WHERE job_id LIKE 'SA_%';

-- ����2) EMPLOYEES ���̺� ��ϵǾ� �ִ� �ο���, ���ʽ��� NULL�� �ƴ� �ο���, ���ʽ��� ���, ��ϵǾ� �ִ� �μ��� ���� ���Ͽ� ����϶�.
SELECT COUNT(*), COUNT(commission_pct), trunc(AVG(commission_pct * salary)), COUNT(DISTINCT department_id) 
FROM employees;

select Distinct department_id
FROM employees;

-- ����3) EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ����϶�.
SELECT COUNT(*), ROUND(AVG(salary)), MIN(salary), MAX(salary), SUM(salary) 
FROM employees
GROUP BY department_id;

-- ����4) EMPLOYEES ���̺��� �� �μ����� �ο���,�޿��� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� �޿��� ���� ���� ������ ����Ͽ���.
SELECT department_id, COUNT(*), TRUNC(AVG(salary)), MIN(salary), MAX(salary), SUM(salary) AS "�޿��� ��" 
FROM employees
GROUP BY department_id
ORDER BY "�޿��� ��" DESC;

-- ����5) EMPLOYEES ���̺��� �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����Ͽ���.
select department_id , job_id,count(*),avg(salary),sum(salary)
from employees
group by department_id, job_id;

SELECT department_id
FROM employees
GROUP BY department_id;

-- ����6) EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���
select department_id, count(*), SUM(salary)
from employees
group by department_id
having count(*)>4;

-- ����7) EMPLOYEES ���̺��� �޿��� �ִ� 10000�̻��� �μ��� ���ؼ� �μ���ȣ, ��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.
select department_id, avg(salary), max(salary), sum(salary)
from employees
group by department_id
having max(salary)>=10000;

-- ����8) EMPLOYEES ���̺��� ������ �޿��� ����� 10000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ����϶�.
select job_id, avg(salary), sum(salary)
from employees
group by job_id
having avg(salary)>=10000;

-- ����9) EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. 
-- �� �Ǹſ�(SA_)�� �����ϰ�  �� �޿� �հ�� ����(��������)�϶�.
select job_id,sum(salary)
from employees
where job_id not like 'SA_%'
Group by job_id
having sum(salary)>10000
order by sum(salary) desc;





