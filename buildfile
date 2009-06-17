# Generated by Buildr 1.3.4, change to your liking
require 'buildr/scala'

# Maven 2.0 remote repository
repositories.remote << "http://www.ibiblio.org/maven2/"
# Scala Tools
repositories.remote << 'http://scala-tools.org/repo-releases/'
# Google Maven Repository
repositories.remote << 'http://google-maven-repository.googlecode.com/svn/repository/'
# Google Maven Snapshot Repository
repositories.remote << 'http://google-maven-repository.googlecode.com/svn/snapshot-repository/'

# Constants
VERSION_NUMBER = '1.0'
# Dependencies
# Scala Jars should be included from SCALA_HOME environment variable (or macports install)
SCALA = group('scala-library','scala-compiler',:under => 'org.scala-lang', :version => '2.7.5')
# Testing Dependencies
SPECS = 'org.scala-tools.testing:specs:jar:1.5.0'
# Set to use Java 1.5 because Java 6 (1.6) is not working
ENV['JAVA_HOME'] = '/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home'
ENV['USE_FSC'] = 'yes'

desc 'Simple Scala Persistence'
define 'ssp' do
	# Project config
	DEPS = [SCALA]
	CLASSPATH = DEPS
	TEST_DEPS = [SPECS] << DEPS
	# Build config
	webapp = _('src/main/webapp/*')
	resources = _('target/resources/*')
	src = _('target/classes/*')
	war = _('target/war')
	warclasses = _(war, 'WEB-INF/classes')
	warlib = _(war, 'WEB-INF/lib')
	
	# Buildr properties
	project.group = 'com.bryanjswift'
	project.version = VERSION_NUMBER
	manifest['Copyright'] = 'Bryan J Swift (C) 2009'
	compile.using(:warnings => 'true', :target => '1.5').with DEPS, CLASSPATH
	test.with TEST_DEPS
	test.using :specs
	package(:jar, :id => 'quotidian').with DEPS
end
