-- hr
-- ����1) ������� �̸�, �μ���ȣ, �μ����� ����϶�
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
where e.department_id = d.department_id;


-- ����2) 30�� �μ��� ������� �̸�,����,�μ����� ����϶�
SELECT e.first_name, d.department_name,
    job_title
FROM employees e, departments d, jobs j
where e.department_id=30 and e.department_id=d.department_id
     and e.job_id = j.job_id;

-- ����3) Ŀ�̼��� �޴� ����� �̸�, ����, �μ���ȣ,�μ����� ����϶�
select e.first_name, job_title, e.department_id, d.department_name
FROM employees e, departments d, jobs j
where e.commission_pct is not null and e.department_id=d.department_id
    and e.job_id = j.job_id;

-- ����4) ������ȣ 2500 ���� �ٹ��ϴ� ����� �̸�, ����,�μ���ȣ,�μ����� ����϶�
select e.first_name, job_title, e.department_id, d.department_name
FROM employees e, departments d, jobs j, locations L
where location_id=2500 
    and e.department_id=d.department_id
    and e.job_id = j.job_id;--���� �Ѱ�
    
SELECT e.first_name, e.job_id, 
    d.department_id, d.department_name, l.city 
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
    AND d.location_id = 2500
        AND d.location_id = l.location_id;--����
    
-- ����5) �̸��� A�� ���� ������� �̸��� �μ��̸��� ����϶�
select e.first_name, d.department_name
FROM employees e, departments d
where first_name like 'A%' 
    and e.department_id=d.department_id;

-- ����6) ����̸��� �� ����� ������ �̸��� ����϶�
select a.first_name as "���",b.first_name as "������"
from employees a, employees b
where a.manager_id=b.employee_id;
-- ����7) ����̸��� �μ���� ������ ����ϴµ� ������ 3000 �̻��� ����� ����϶�
select e.first_name, d.department_name, e.salary
FROM employees e, departments d
where salary>=3000 and e.department_id=d.department_id;

-- ����8) TJ �̶� ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����϶�
select first_name, hire_date
FROM employees 
where hire_date > '07/04/10'
order by hire_date;

select a.first_name, a.hire_date, b.first_name, b.hire_date
from employees a, employees b -- a:TJ b:�����
WHERE a.first_name = 'TJ'
    AND a.hire_date<b.hire_date;
    
-- ����9) �޿��� 3000���� 5000������ ����� �̸��� �ҼӺμ��� ����϶�
select e.first_name, d.department_name, e.salary
FROM employees e, departments d
where e.department_id = d.department_id and salary between 3000 and 5000
order by salary;

-- ����10) ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի��� ����϶�
select e.first_name, e.hire_date
From employees e, departments d
where d.department_name = 'Accounting' 
    and e.department_id = d.department_id;
-- ����11) �޿��� 3000������ ����� �̸��� �޿�, �ٹ���
select e.first_name,l.city,e.salary
from employees e, locations l, departments d
where salary<=3000 and e.department_id = d.department_id 
    and l.location_id = d.location_id;

/*����
101�� ����� ���� �Ʒ��� ����� �����ϴ� ������ �ۼ��� ����
------------
��� ����� job��Ī job�������� job�������� job���� �μ���
--------------------
*/
select a.employee_ID,a.first_name,d.job_title,b.start_date, b.end_date, c.department_name
From employees a, job_history b, departments c, jobs d
Where a.employee_id=b.employee_id 
    and b.department_id = c.department_id
    and b.job_id = d.job_id
    and a.employee_id = '101';
    