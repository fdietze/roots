create or replace function bfsb(start integer) returns setof integer as $$
WITH RECURSIVE visited(id) AS (
	VALUES (start)

	UNION -- discards duplicates

	SELECT edges.b FROM visited INNER JOIN edges ON a = visited.id
)
SELECT * FROM visited;
$$ language sql IMMUTABLE;


-- warmup
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

-- :nmap ö :update<CR>:w !docker exec -i postgres-benchmark psql -U postgres<CR>
