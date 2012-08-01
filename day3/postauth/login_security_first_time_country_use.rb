#########################################################
#  Author: Paul Codding
#  Model: Login Security
#  Rule: First Time Country Use
#  Description: A user has logged in from a country for 
#     the first time.
#  Outcome: Challenge
#  Alerts: User First Time in Country Alert
#########################################################

require 'test/unit'
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'jruby/test_assertions'

class LoginSecurityFirstTimeCountryUse < Test::Unit::TestCase
  include TestAssertions
  include ArmAutomatorLanguage
        
  # This method runs once for each test_ method defined below before the test begins
  def setup
    @automator = ArmAutomator.instance
    create_test_user :login_id_prefix => "test", :external_user_id_suffix => "@gmail.com", :group => "training", :country => "United States"
    perform_login
  end

  # Test for the specific scerio this test is meant to identify
  def test_positive_scenario
    use_location :country => "Canada"
    result = perform_login
    testRuleTrigger(result.postAuthResult, "First Time Country Use")
    testAlertSubstringPresent(result.postAuthResult, "User First Time in Country Alert")
  end
  
  # Test for the scenario that should not occur e.g. one less login than required to trigger the positive case
  def test_negative_scenario
    result = perform_login
    testFinalActionEqual(result.postAuthResult, "Allow")
  end
  
  # This method runs once for each test_method defined below after the test is complete
  def teardown
    remove_user :login_id => @user.login_id
  end
end
