1. employees ���̺��� ����̸� �� a�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ����϶�.
SELECT SUBSTR(FIRST_NAME, 1,3)
FROM employees
WHERE first_name LIKE '%a%';

2. �̸��� ����° ���ڰ� a�� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT first_name
FROM employees
WHERE SUBSTR(first_name, 3, 1)='a';

3. �̸��� J,A �Ǵ� M���� �����ϴ� ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸��� ���̸� ǥ���Ͻÿ�.(�� ���̺��� name�� length�� ǥ��)
SELECT INITCAP(first_name) as "name", length(first_name)"length" 
FROM employees
WHERE first_name like 'J%'
    or first_name like 'A%'
    or first_name like 'M%';
4. �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�
SELECT LOWER(first_name)
FROM employees
WHERE length(first_name) >= 6;

5. �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.
SELECT LOWER(SUBSTR(first_name,1,3))
FROM employees
WHERE length(first_name) >= 6;

6. ��� ����� �̸��� �޿��� ǥ���Ͻÿ�. �޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� �������� ǥ���ϰ� �����̺��� �������� �����Ͻÿ�.
SELECT first_name, LPAD(salary, 15, '$') "����"
FROM employees;

7. ������̺��� �Ի�⵵�� ������� ���϶�. 
SELECT TO_CHAR(hire_date, 'yyyy') as hiredate, COUNT(*)
From employees
Group By TO_CHAR(hire_date, 'yyyy')
order by hiredate;