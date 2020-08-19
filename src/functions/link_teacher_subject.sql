create or replace function 
	link_teacher_to_subject(the_teacher_id int, the_subject_id int)
	returns boolean as

$$
declare

teachCount int;
subjCount int;
total int;

begin
	select into teachCount count(*) from teacher where id=the_teacher_id;
	select into subjCount count(*) from subject where id=the_subject_id;
	
	select into total count(*) from teacher_subject
	where teacher_id = the_teacher_id and subject_id = the_subject_id;

	if(total = 0 and teachCount = 1 and subjCount = 1) then
		insert into teacher_subject (teacher_id, subject_id) values(the_teacher_id, the_subject_id);
		return true;
	else
		return false;
	end if;

end;
$$

Language plpgsql;
