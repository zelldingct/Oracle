-- hr ����
-- ����1) EMPLOYEES ���̺��� �Ի����� ������ �����Ͽ� �����ȣ, �̸�, ����, �޿�, �Ի�����,�μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id 
FROM employees
ORDER BY hire_date ASC;

-- ����2) EMPLOYEES ���̺��� ���� �ֱٿ� �Ի��� ������ �����ȣ, �̸�, ����, �޿�, �Ի�����,�μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id 
FROM employees
ORDER BY hire_date DESC;

-- ����3) EMPLOYEES ���̺��� �μ���ȣ�� ������ �� �μ���ȣ�� ���� ��� 
-- �޿��� ���� ������ �����Ͽ� �����ȣ, ����, ����, �μ���ȣ, �޿��� ����Ͽ���.
SELECT employee_id, first_name, job_id, department_id, salary 
FROM employees
ORDER BY department_id ASC, salary DESC;

-- ����4) EMPLOYEES ���̺��� ù��° ������ �μ���ȣ�� �ι�° ������ ������ ����° ������ �޿��� ���� ������ �����Ͽ� 
-- �����ȣ, ����, �Ի�����, �μ���ȣ, ����, �޿��� ����Ͽ���.
SELECT employee_id, first_name, hire_date, department_id, job_id, salary
FROM employees
ORDER BY department_id ASC, job_id ASC, salary DESC;


-- hr ǥ���Լ�

-- ����1) EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT employee_id, last_name, UPPER(job_id), department_id
FROM employees
WHERE UPPER(last_name) = 'KING';    

-- ����2) DEPARTMENTS ���̺��� (�μ���ȣ�� �μ��̸�), �μ��̸��� ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.
SELECT department_id || ' ' || department_name, department_name || ' ' || location_id 
FROM departments;

SELECT CONCAT(department_id, department_name), CONCAT(department_name, location_id)
FROM departments;

-- ����3) EMPLOYEES ���̺��� �̸��� ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�. 
-- �� �̸������� �����Ͽ���.
SELECT employee_id, first_name, job_id, salary, department_id
FROM employees
WHERE SUBSTR(first_name, 1, 1) > 'K' AND SUBSTR(first_name, 1, 1) < 'Y'   
ORDER BY first_name ASC;

-- ����4) EMPLOYEES ���̺��� 20�� �μ� �� �����ȣ, �̸�, �̸��� ������ ����, �޿�, �޿��� �ڸ����� ����϶�.
-- LENGTHB() LENGTH()
SELECT employee_id, first_name, LENGTH(first_name), salary, LENGTH(SALARY), department_id 
FROM employees
WHERE department_id = 20
ORDER BY department_id;
 
-- ����5) EMPLOYEES ���̺��� �̸�����  ��e������ ��ġ�� ����϶�.
SELECT first_name, INSTR(first_name, 'e', 1, 1)
FROM employees;

-- ����6) ROUND �Լ��� ����Ͽ� 4567.678�� �Ҽ��� ������ ���� ��µǵ��� �϶�.
/*
4568
4568
4567.68
4600
*/
SELECT ROUND(4567.678),
        ROUND(4567.678, 0),
        ROUND(4567.678, 2),
        ROUND(4567.678, -2)
FROM dual;

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
-- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
SELECT first_name, hire_date,
    TRUNC(SYSDATE - hire_date) AS "�� �ٹ� �ϼ�",
    TRUNC(SYSDATE - TO_DATE('21/09/07')),       -- SYSDAY
    TRUNC(TO_DATE('21/09/10') - TO_DATE('21/08/23')) 
FROM employees
ORDER BY "�� �ٹ� �ϼ�" DESC;

-- ����10) EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
SELECT first_name, salary, TO_CHAR(salary, '$999,999') 
FROM employees
WHERE department_id = 50;




-- hr �׷���
-- ����1) EMPLOYEES ���̺��� ��� SALESMAN(SA_)�� ���Ͽ� �޿��� ���, �ְ��, ������, �հ踦 ���Ͽ� ����Ͽ���.
SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary) 
FROM employees
WHERE job_id LIKE 'SA_%';

-- ����2) EMPLOYEES ���̺� ��ϵǾ� �ִ� �ο���, ���ʽ��� NULL�� �ƴ� �ο���, ���ʽ��� ���, ��ϵǾ� �ִ� �μ��� ���� ���Ͽ� ����϶�.
SELECT COUNT(*), COUNT(commission_pct), trunc(AVG(commission_pct * salary)), COUNT(DISTINCT department_id) 
FROM employees;

SELECT DISTINCT department_id 
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
SELECT department_id, job_id, COUNT(*), AVG(salary), SUM(salary) 
FROM employees
GROUP BY department_id, job_id;

SELECT department_id
FROM employees
GROUP BY department_id;

-- ����6) EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ����Ͽ���
SELECT department_id, COUNT(*), SUM(salary)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 4;

-- ����7) EMPLOYEES ���̺��� �޿��� �ִ� 10000�̻��� �μ��� ���ؼ� �μ���ȣ, ��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.
SELECT department_id, AVG(salary), MAX(salary), SUM(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

-- ����8) EMPLOYEES ���̺��� ������ �޿��� ����� 10000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ����϶�.
SELECT job_id, AVG(salary), SUM(salary) 
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 10000;

-- ����9) EMPLOYEES ���̺��� ��ü ������ 10000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����϶�. 
-- �� �Ǹſ�(SA_)�� �����ϰ�  �� �޿� �հ�� ����(��������)�϶�.
SELECT job_id, SUM(salary)
FROM employees
WHERE job_id NOT LIKE 'SA_%'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary) DESC;



