```
zcat graph.sql.gz | psql
cat traversal.sql| psql
psql -c "explain analyze select * from bfsb(3235);"
```

```
psql < exportGraph_postgres.sql
JAVA_OPTS="-Xmx6G -Xss1024m"  ~/local/neo4j/bin/neo4j-shell  -file importGraph_neo4j.cql

sbt assembly
cp target/scala-2.12/roots-assembly-0.1.0-SNAPSHOT.jar $NEO4J/plugins/
~/local/neo4j/bin/neo4j-shell
> match (n:Post {id: "3235"}) CALL connectedComponent(n) yield node return node;

```
