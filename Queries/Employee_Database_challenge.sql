--Deliverable 1
--Join titles and employees table to create table of employees that are retiring, with their titles included
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

--- Use Dictinct with Orderby to remove duplicate rows
--Remove duplicates in the titles table and get latest title, since employees have switched titles multiple times
--Created two versions of the tables from this point forward, one without "WHERE" line (line 31), since when not using that line
--the output table is correct and matches what is given in the challenge.
--Although this doesn't make sense, since there is no filter for current employees. Any table with the number 2 at the end, is the 
--table that matches the tables given in the challenge. 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles2
FROM retirement_titles 
--WHERE (retirement_titles.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles2

--Use GROUPBY and COUNT function to populate data based on titles
SELECT COUNT(ue.title), ue.title
INTO retiring_titles2
FROM unique_titles2 as ue
GROUP BY ue.title
ORDER BY count desc;

SELECT * FROM retiring_titles2


--Deliverable 2 
-- Create a table that populates the eligible employees for the Mentorship Program
--Join employees, dept_emp, and titles tables along with the DISTINCT ON function with filters and order by 
--In the challenge, it does not say to order by to_date, which I think is wrong, because you do not get the most recent title
--To get the latest title, you would need to order by to_date, so that the newest date is on top and the DISTINCT function will retrieve it
SELECT DISTINCT ON (t.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles2 as t
ON (de.emp_no = t.emp_no)
WHERE (de.to_date ='9999-01-01' )
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY t.emp_no, t.to_date DESC;

--Summary queries
--Question 1
-- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	t.from_date,
	t.to_date
INTO rt
FROM employees as e
INNER JOIN titles2 as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT COUNT(rt.title), rt.title,
	date_trunc('year', rt.birth_date) as year
--INTO retiring_titles2
FROM rt 
WHERE (rt.birth_date BETWEEN '1955-01-01' AND '1955-12-31')
GROUP BY rt.title, year
ORDER BY year, count(rt.title) DESC;
