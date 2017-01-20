create or replace function bfsb(start integer) returns setof integer as $$
declare
    queue Integer[] := array[start];
begin
    create temporary table visited (id integer NOT NULL) on commit drop;
    create unique index on visited (id);

    WHILE array_length(queue,1) > 0 LOOP
        insert into visited (select unnest(queue)) on conflict do nothing;
        queue := array(
            select b
            from (select unnest(queue) as id) as q
            join edges on a = q.id
            left outer join visited on b = visited.id
            where visited.id is NULL
        );
    END LOOP;
    return query (select id from visited);
end;
$$ language plpgsql;
