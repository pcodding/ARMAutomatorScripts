#########################################################
#  Author: Paul Codding
#  Model: Login Security
#  Rule: Restricted Countries
#  Description: A user logs in from a country in from a 
#     country in the Restricted Users group, block them.
#  Outcome: Block
#  Alerts: Restricted Country
#########################################################

require 'test/unit'
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'jruby/test_assertions'

class LoginSecurityRestrictedCountries < Test::Unit::TestCase
  include TestAssertions
  include ArmAutomatorLanguage
        
  # This method runs once for each test_ method defined below before the test begins
  def setup
    @automator = ArmAutomator.instance
    create_test_user :login_id_prefix => "test", :external_user_id_suffix => "@gmail.com", :group => "training", :country => "China"
  end
  

  # Test for the specific scerio this test is meant to identify
  def test_positive_scenario
    add_location_to_group :country => "China", :group => "Restricted Countries"
    sleep(30)
    result = perform_login
    testFinalActionEqual(result.preAuthResult, "Block")    
  end
  
  # Test for the scenario that should not occur e.g. one less login than required to trigger the positive case
  def test_negative_scenario
    use_location :country => "United States"
    result = perform_login
    testFinalActionEqual(result.preAuthResult, "Allow")
  end
  
  # This method runs once for each test_method defined below after the test is complete
  def teardown
    remove_user :login_id => @user.login_id
    remove_location_from_group :country => "China", :group => "Restricted Countries"
  end
end
