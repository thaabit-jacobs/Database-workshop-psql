create or replace function
	find_teachers_teaching_multiple_subjects (numOfSubj int)
	returns table(
	first_name text,
	last_name text,
	email text,
	count bigint
	) as

$$
begin

return query
	Select teacher.first_name, teacher.last_name,teacher.email, count(*)
	from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
	group by
	teacher.first_name, teacher.last_name, teacher.email
	having count(*)=numOfSubj;

end;
$$
Language plpgsql;