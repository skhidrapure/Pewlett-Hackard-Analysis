SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t on e.emp_no=t.emp_no 
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31' )
ORDER BY emp_no;

SELECT COUNT(*)FROM retirement_titles
select * from retirement_titles;
drop table retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no, 
first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

DROP TABLE unique_titles;
SELECT COUNT (*) from unique_titles;
SELECT * from unique_titles;

SELECT COUNT(title), title
FROM unique_titles 
group by title 
order by COUNT(title) DESC;

--DELIVERABLE 2

SELECT DISTINCT ON (e.emp_no)e.emp_no, 
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date, 
t.title
--INTO merged_table
INTO mentorship_eligibilty
FROM employees as e 
LEFT JOIN dept_emp as d 
ON e.emp_no = d.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT COUNT(*) FROM mentorship_eligibilty;
SELECT * from mentorship_eligibilty;
DROP TABLE merged_table

