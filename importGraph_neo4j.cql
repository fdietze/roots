// https://neo4j.com/developer/guide-importing-data-and-etl/

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/graph_posts.csv" AS row
CREATE (:Post {id: row.id, title: row.title});

CREATE CONSTRAINT ON (p:Post) ASSERT p.id IS UNIQUE;

schema await

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/graph_edges.csv" AS row
MATCH (a:Post {id: row.a})
MATCH (b:Post {id: row.b})
MERGE (a)-[:CONNECTS]->(b);
