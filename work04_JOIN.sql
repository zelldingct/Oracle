-- hr
-- 문제1) 사원들의 이름, 부서번호, 부서명을 출력하라
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
where e.department_id = d.department_id;


-- 문제2) 30번 부서의 사원들의 이름,직업,부서명을 출력하라
SELECT e.first_name, d.department_name,
    job_title
FROM employees e, departments d, jobs j
where e.department_id=30 and e.department_id=d.department_id
     and e.job_id = j.job_id;

-- 문제3) 커미션을 받는 사원의 이름, 직업, 부서번호,부서명을 출력하라
select e.first_name, job_title, e.department_id, d.department_name
FROM employees e, departments d, jobs j
where e.commission_pct is not null and e.department_id=d.department_id
    and e.job_id = j.job_id;

-- 문제4) 지역번호 2500 에서 근무하는 사원의 이름, 직업,부서번호,부서명을 출력하라
select e.first_name, job_title, e.department_id, d.department_name
FROM employees e, departments d, jobs j, locations L
where location_id=2500 
    and e.department_id=d.department_id
    and e.job_id = j.job_id;--내가 한것
    
SELECT e.first_name, e.job_id, 
    d.department_id, d.department_name, l.city 
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
    AND d.location_id = 2500
        AND d.location_id = l.location_id;--정답
    
-- 문제5) 이름에 A가 들어가는 사원들의 이름과 부서이름을 출력하라
select e.first_name, d.department_name
FROM employees e, departments d
where first_name like 'A%' 
    and e.department_id=d.department_id;

-- 문제6) 사원이름과 그 사원의 관리자 이름을 출력하라
select a.first_name as "사원",b.first_name as "관리자"
from employees a, employees b
where a.manager_id=b.employee_id;
-- 문제7) 사원이름과 부서명과 월급을 출력하는데 월급이 3000 이상인 사원을 출력하라
select e.first_name, d.department_name, e.salary
FROM employees e, departments d
where salary>=3000 and e.department_id=d.department_id;

-- 문제8) TJ 이란 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하라
select first_name, hire_date
FROM employees 
where hire_date > '07/04/10'
order by hire_date;

select a.first_name, a.hire_date, b.first_name, b.hire_date
from employees a, employees b -- a:TJ b:사원들
WHERE a.first_name = 'TJ'
    AND a.hire_date<b.hire_date;
    
-- 문제9) 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 출력하라
select e.first_name, d.department_name, e.salary
FROM employees e, departments d
where e.department_id = d.department_id and salary between 3000 and 5000
order by salary;

-- 문제10) ACCOUNTING 부서 소속 사원의 이름과 입사일 출력하라
select e.first_name, e.hire_date
From employees e, departments d
where d.department_name = 'Accounting' 
    and e.department_id = d.department_id;
-- 문제11) 급여가 3000이하인 사원의 이름과 급여, 근무지
select e.first_name,l.city,e.salary
from employees e, locations l, departments d
where salary<=3000 and e.department_id = d.department_id 
    and l.location_id = d.location_id;

/*번외
101번 사원에 대해 아래의 결과를 산출하는 쿼리를 작성해 보자
------------
사번 사원명 job명칭 job시작일자 job종료일자 job수행 부서명
--------------------
*/
select a.employee_ID,a.first_name,d.job_title,b.start_date, b.end_date, c.department_name
From employees a, job_history b, departments c, jobs d
Where a.employee_id=b.employee_id 
    and b.department_id = c.department_id
    and b.job_id = d.job_id
    and a.employee_id = '101';
    