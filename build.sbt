name := "roots"
version := "0.1.0-SNAPSHOT"

scalaVersion := "2.12.1"

val neo4jVersion = "3.0.8"

libraryDependencies ++=
  "org.neo4j" % "neo4j" % neo4jVersion % "provided" ::
  Nil

// assemblyMergeStrategy in assembly := {
//   case m if m.toUpperCase.endsWith("META-INF/LICENSES.TXT") => MergeStrategy.filterDistinctLines
//   case m if m.toUpperCase.matches("META-INF") => MergeStrategy.filterDistinctLines
//   case m if m.toUpperCase.matches("META-INF/MANIFEST.MF") => MergeStrategy.filterDistinctLines
//   case _ => MergeStrategy.filterDistinctLines
// }

// assemblyShadeRules in assembly := Seq(
//   ShadeRule.rename("org.neo4j.cypher.internal.compiler.v2_3.planner.**" -> "shadeio.@1", "org.mozilla.javascript.**" -> "shadeio.@1").inAll
// )
