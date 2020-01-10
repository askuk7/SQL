declare @id int
set @id=7

with EmployeeCTE AS
(
	select EmployeeId, EmployeeName, ManagerId From Employee where EmployeeId=@id
	UNION ALL
	select employees.employeeId, employees.employeeName, employee.MangerId from Employees
	join employeeCTE on employees.employeeId = employeeCTE.ManagerId
)

select e1.employeeName, isnull(e2,EmployeeName,'No Boss') as ManagerName
from employeeCTE E1
LEFT JOIN employeeCTE e2
on e1.ManagerId = E2.EmployeeId