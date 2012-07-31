require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'training/constants'
include ArmAutomatorLanguage
include Constants

@automator = ArmAutomator.instance
puts "Staring master script"
25.times { load_random_user ; assess_valid_cost(perform_login) }
require 'training/day1/brute_force_login'
12.times { load_random_user ; assess_valid_cost(perform_login) }
require 'training/day1/device_multiple_users'
20.times { load_random_user ; assess_valid_cost(perform_login) }
require 'training/day1/improbable_velocity'
10.times { load_random_user ; assess_valid_cost(perform_login) }
require 'training/day1/multiple_invalid_logins'
11.times { load_random_user ; assess_valid_cost(perform_login) }
puts "Finished master script with cost:"
puts total_cost
