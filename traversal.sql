create or replace function bfsb(start integer) returns setof integer as $$
declare
    queue Integer[] := array[start];
begin
    create temporary table visited (
        id integer NOT NULL,
        unique(id)
    ) on commit drop;

    WHILE array_length(queue,1) > 0 LOOP
        insert into visited (select unnest(queue)) on conflict do nothing;
        queue := array(
            select b
            from (select unnest(queue) as id) as q
            join edges on a = q.id

            --- 4 variants ---

            where not exists (select id from visited where b = id)

            -- except all
            -- select id from visited

            -- where b not in (select id from visited)

            -- left join visited on b = visited.id
            -- where visited.id is NULL
        );
    END LOOP;
    return query (select id from visited);
end;
$$ language plpgsql;


select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);
select count(*) from bfsb(3235);

-- :nmap ö :update<CR>:w !psql<CR>
