cd ~/workspace
mvn archetype:generate -DgroupId=com.zirous.oaam.configurableaction -DartifactId=sampleaction -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
cd sampleaction
mvn install:install-file -DgroupId=oracle -DartifactId=vcrypt -Dversion=10.1.4.5.11 -Dpackaging=jar -Dfile=/home/oracle/OAAM/oarm/WEB-INF/lib/vcrypt.jar
cp ~/ARMAutomatorScripts/day2/pom.xml .
cp ~/ARMAutomatorScripts/day2/App.java /home/oracle/workspace/sampleaction/src/main/java/com/zirous/oaam/configurableaction
mvn eclipse:eclipse