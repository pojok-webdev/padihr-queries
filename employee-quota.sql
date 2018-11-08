select 
A.fullname,
timestampdiff(YEAR,joindate,now()) workingduration,
B.level,
C.prev_level,
case when (timestampdiff(YEAR,joindate,now())=0) then '0' when (timestampdiff(YEAR,joindate,now())=1) then 'prorate' when (timestampdiff(YEAR,joindate,now())>1) then B.quota else 'undefined' end curleavequota  
from(select a.fullname,b.id_employee,min(b.tgl_mulai)joindate from employee a left outer join employment b on b.id_employee=a.id_employee group by a.fullname,b.id_employee) A
left outer join (select id_employee,max(id_level) level, case max(id_level) 
when 1 then 12 
when 2 then 12
when 3 then 15 
when 4 then 18
when 5 then 24 
end quota from employment group by id_employee) B on B.id_employee=A.id_employee
left outer join (select id_employee,max(id_level) prev_level,case max(id_level)
when 1 then 12 
when 2 then 12
when 3 then 15 
when 4 then 18
when 5 then 24 
end quota
 from employment where status='0' group by id_employee) C on C.id_employee=A.id_employee
;

