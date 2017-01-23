```
zcat graph.sql.gz | psql
cat traversal.sql| psql
psql -c "explain analyze select * from bfsb(3235);"
```

```
psql < exportGraph_postgres.sql
cp graph_{edges,posts}.csv ~/local/neo4j/import
JAVA_OPTS="-Xmx6G -Xss1024m"  neo4j-shell  -file importGraph_neo4j.cql

sbt assembly; cp target/scala-2.12/roots-assembly-0.1.0-SNAPSHOT.jar $NEO4J/plugins/
neo4j-shell
> match (n:Post {id: "3235"}) CALL connectedComponent(n) yield node return count(node);
> match (n:Post {id: "3235"}) CALL connectedComponent(n) yield node return node;

```
