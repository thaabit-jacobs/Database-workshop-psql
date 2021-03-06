create or replace function
	find_teachers_for_subject (subj text) 
	returns table(
	id int,
	first_name text,
	last_name text,
	name text
	) as

$$
begin 

return query
	select teacher.id, teacher.first_name, teacher.last_name, subject.name from teacher
	join teacher_subject
	on teacher.id = teacher_subject.teacher_id
	join subject
	on teacher_subject.subject_id = subject.id
	where subject.name=subj;

end;
$$
Language plpgsql;