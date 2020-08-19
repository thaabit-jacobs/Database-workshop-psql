create or replace function
	add_teacher (teach_firstname text, teach_lastname text, teach_email text)
	returns boolean as

$$
declare

total int;

begin 

	select into total count(*) from teacher
		where LOWER(email) = LOWER(teach_email);

	if(total = 0) then
		insert into teacher (first_name, last_name, email) values(teach_firstname, teach_lastname, teach_email);
		return true;
	else
		return false;

	end if;

end;
$$

Language plpgsql;