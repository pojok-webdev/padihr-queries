select 
    A.id_employee,A.fullname,A.email,B.prev_id_employment,B.prev_id_level,B.beginning_date,
    C.cur_id_employment,C.cur_id_level,C.beginning_date
from employee A 
left outer join (
    (
        select a.id_employee,a.prev_id_employment,b.id_level prev_id_level,b.tgl_mulai beginning_date from     (
            select id_employee,max(id_employment) prev_id_employment 
            from employment where status='0' group by id_employee) a     
            left outer join employment b on b.id_employment=a.id_employee
    )
    ) B on B.id_employee=A.id_employee 
left outer join (    
    select id_employee,id_employment cur_id_employment,id_level cur_id_level,tgl_mulai beginning_date 
    from employment where status='1'
) C on C.id_employee=A.id_employee
;

