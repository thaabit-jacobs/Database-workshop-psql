select teacher.* from teacher
	join teacher_subject
	on teacher.id = teacher_subject.teacher_id
	join subject 
	on teacher_subject.subject_id = subject.id
	where subject.name = 'Mathmatics';