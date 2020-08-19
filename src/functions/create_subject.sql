create or replace function 
	create_subject (the_name text)
	returns boolean as

$$
declare

total int;

begin

	select into total count(*) from subject
		where LOWER(name) = LOWER(the_name);

	if(total = 0) then
		insert into subject (name) values (the_name);
		return true;
	else
		return false;

	end if;

end;
$$

Language plpgsql;