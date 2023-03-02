-- INNER JOIN

select s.stdName, s.addr, c.clubName, t.roomNo
from stdtbl as s
join stdclubtbl as c
on s.stdname = c.stdname
join clubtbl as t
on c.clubName = t.clubname;