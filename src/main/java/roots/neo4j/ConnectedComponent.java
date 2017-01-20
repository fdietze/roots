package roots.neo4j;

import org.neo4j.graphdb.*;
import org.neo4j.graphdb.traversal.*;
import org.neo4j.helpers.collection.Iterables;
import org.neo4j.procedure.Context;
import org.neo4j.procedure.Name;
import org.neo4j.procedure.Procedure;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;

public class ConnectedComponent {
    @Context
    public GraphDatabaseService graphDatabaseService;

    private static enum RelTypes implements RelationshipType {
        CONNECTS
    }

    @Procedure(value = "connectedComponent")
    public Stream<Visited> connectedComponent(@Name("start") Node start) {
        return graphDatabaseService.traversalDescription()
               .depthFirst()
               .relationships( RelTypes.CONNECTS, Direction.OUTGOING )
               .uniqueness( Uniqueness.RELATIONSHIP_GLOBAL )
               .traverse( start )
               .nodes().stream().map(Visited::new);
    }

    public static class Visited {
        public final Node node;
        public Visited(Node node) {
            this.node = node;
        }
    }
}
