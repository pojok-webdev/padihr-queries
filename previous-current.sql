select A.id_employee,B.prev_employment,C.id_employment 
from employee A 
left outer join (select id_employee,max(id_employment) prev_employment from employment where status='0' group by id_employee) B on B.id_employee=A.id_employee 
left outer join (select * from employment where status='1') C on C.id_employee=A.id_employee;

