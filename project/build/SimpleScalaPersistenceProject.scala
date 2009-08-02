import sbt._

class SimpleScalaPersistenceProject(info:ProjectInfo) extends DefaultProject(info) {
	// override looking for jars in ./lib
	override def dependencyPath = "src" / "main" / "lib"
	// override path to managed dependency cache
	override def managedDependencyPath = "project" / "lib_managed"
}
