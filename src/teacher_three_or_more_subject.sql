select teacher.first_name, teacher.last_name, teacher.email, count(*)
	from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
	group by
	teacher.first_name, teacher.last_name, teacher.email
	having count(*) > 2;