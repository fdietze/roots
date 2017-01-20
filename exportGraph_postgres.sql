\COPY (SELECT * FROM posts) TO 'graph_posts.csv' WITH (FORMAT CSV, header)
\COPY (SELECT * FROM edges) TO 'graph_edges.csv' WITH (FORMAT CSV, header)
