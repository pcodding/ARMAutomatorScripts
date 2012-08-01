require 'test/unit'
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'jruby/test_assertions'

class NameOfYourTest < Test::Unit::TestCase
  include TestAssertions
  include ArmAutomatorLanguage
        
  # This method runs once for each test_ method defined below before the test begins
  def setup
    @automator = ArmAutomator.instance
    # Setup your test with any pre conditions such as loading or creating a test user
  end
  

  # Test for the specific scerio this test is meant to identify
  def test_positive_scenario
    # Add your ARM Automator commands here to simulate the scenario
    # Add your test assertions here to validate the simulation has resulted in the correct outcome
  end
  
  # Test for the scenario that should not occur e.g. one less login than required to trigger the positive case
  def test_negative_scenario
    # Add your ARM Automator commands here to simulate a scenario that shouldn't trigger the rule(s) under test
    # Add your test assertions here to validate the simulation has resulted in the correct outcome
  end
  
  # This method runs once for each test_method defined below after the test is complete
  def teardown
    # Remove any test users or temporary browsers created if necessary
  end
end

