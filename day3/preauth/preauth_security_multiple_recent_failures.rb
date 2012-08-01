#########################################################
#  Author: Paul Codding
#  Model: Login Security
#  Rule: Multiple Recent Failures
#  Description: A user has three or more failed logins, 
#     and then succeeds.
#  Outcome: Challenge
#  Alerts: None
#########################################################

require 'test/unit'
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'jruby/test_assertions'

class LoginSecurityMultipleRecentFailures < Test::Unit::TestCase
  include TestAssertions
  include ArmAutomatorLanguage
        
  # This method runs once for each test_ method defined below before the test begins
  def setup
    @automator = ArmAutomator.instance
    create_test_user :login_id_prefix => "test", :external_user_id_suffix => "@gmail.com", :group => "training"
  end
  

  # Test for the specific scerio this test is meant to identify
  def test_positive_scenario
    # Fail login three times
    2.times { perform_invalid_login }
    result = perform_invalid_login
    
    testFinalActionEqual(result.preAuthResult, "Challenge")    
    testRuleTrigger(result.preAuthResult, "Multiple Recent Failures")
  end
  
  # Test for the scenario that should not occur e.g. one less login than required to trigger the positive case
  def test_negative_scenario
    # Fail login two times
    perform_invalid_login
    result = perform_invalid_login
    testFinalActionEqual(result.preAuthResult, "Allow")
  end
  
  # This method runs once for each test_method defined below after the test is complete
  def teardown
    remove_user :login_id => @user.login_id
  end
end
