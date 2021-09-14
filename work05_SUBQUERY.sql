-- 문제1) EMPLOYEES 테이블에서 Kochhar(last_name)의 급여보다 많은 사원의 정보를 사원번호,이름,담당업무,급여를 출력하라.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Kochhar');                
--풀이와 똑같음

-- 문제2) EMPLOYEES 테이블에서 급여의 평균보다 적은 사원의 사원번호,이름,담당업무,급여,부서번호를 출력하여라.  
SELECT employee_id, first_name, salary, job_ID,department_ID 
FROM employees
WHERE salary < (select(trunc(avg(salary)))
                from employees)
ORDER BY Salary;
--풀이와 똑같음

-- 문제3) EMPLOYEES 테이블에서 100번 부서의 최소 급여보다 최소 급여가 많은 다른 모든 부서를 출력하라
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
                      
--틀림

-- 문제4) 업무별로 최소 급여를 받는 사원의 정보를 사원번호,이름,업무,부서번호를 출력하여라. 
-- 단 업무별로 정렬하여라.
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
        
--풀이와 똑같음

-- 문제5) EMPLOYEES 과 DEPARTMENTS 테이블에서 업무가 SA_MAN 사원의 정보를 이름,업무,부서명,근무지를 출력하라.
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
--두번째 풀이로 절반 맞음
-- 문제6) EMPLOYEES 테이블에서 가장 많은 사원을 갖는 MANAGER의 사원번호를 출력하라.
SELECT manager_id, count(*)
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_ID) = (SELECT MAX(count(*))
                            FROM employees
                            group by manager_id);
--못풀었었음
-- 문제7) EMPLOYEES 테이블에서 가장 많은 사원이 속해 있는 부서 번호와 사원수를  출력하라.
SELECT department_id, count(*)
FROM employees
GROUP BY department_id
HAVING count(department_ID) =  (SELECT MAX(COUNT(*))
                                FROM employees
                                GROUP BY department_id);
--틀림
-- 문제8) EMPLOYEES 테이블에서 사원번호가 123인 사원의 직업과 같고 사원번호가 192인 사원의 급여보다 많은 사원의 사원번호,이름,직업,급여를 출력하라.
SELECT employee_id, first_name, job_id, salary
FROM employees
where job_id IN (SELECT job_id
                 FROM employees
                 WHERE employee_id = '123') 
   AND salary > (SELECT salary
                 FROM employees
                 WHERE employee_id='192');
--정답
-- 문제9)직업별로 최소급여를 받는 사원의 정보를 사원번호,이름,업무,부서명을 출력하라.
-- 조건1 :직업별로 내림차순정렬
SELECT e.employee_id, e.first_name, e.job_id, d.department_name
FROM employees e, departments d
WHERE (job_id,salary) IN ( SELECT job_id, min(salary)
                           FROM employees
                           GROUP BY job_id) 
                  and e.department_id=d.department_id
ORDER BY JOB_ID desc;
--틀림 다시 쓰기
-- 문제10) EMPLOYEES 테이블에서 50번 부서의 최소 급여를 받는 사원보다 많은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 
-- 단 50번은 제외
SELECT employee_id , first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT min(salary)
                FROM employees
                WHERE department_id = 50)
        AND department_id <> 50;

-- 문제11) EMPLOYEES 테이블에서 50번 부서의 최고 급여를 받는 사원보다 많은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 
-- 단50번은 제외
SELECT employee_id , first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT max(salary)
                FROM employees
                WHERE department_id = 50)
        AND department_id <> 50;







