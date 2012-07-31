require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
include ArmAutomatorLanguage

@automator = ArmAutomator.instance
load_user :login_id => "ari.kleitz"
va = get_vcrypt_auth
questionSet = va.getSignOnQuestions(@user.external_user_id)
questionSet.each { |dropdown| dropdown.each { |question| puts question.question } ; puts "\n" }