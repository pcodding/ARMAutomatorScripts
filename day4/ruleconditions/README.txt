mkdir ~/workspace

~/scripts/startEclipse.sh

Create Java Project (SampleRuleCondition)

unzip training/day4/ruleconditions/samplerulecondition.zip -d ~/workspace

Add jars to classpath
  ~/OAAM/oarm/WEB-INF/lib/vcrypt.jar
  ~/OAAM/oarm/WEB-INF/lib/log4j*.jar
  
vcrypt.tracker.rules.intf.VCryptTracker.*
