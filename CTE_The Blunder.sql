Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.


Sln:

declare @sum decimal(10,2);
declare @sumzero decimal(10,2);

with cte (sal) as (
    select cast (replace(salary,'0','') as int) sal from employees
    )
    select @sum=avg(sal) from cte
    select @sumzero=avg(salary) from employees
    
    select cast((@sumzero-@sum) as int)+1