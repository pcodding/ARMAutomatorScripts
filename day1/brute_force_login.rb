# ========================================================================
#  Author: IntegratID Solutions, LLC
#  ARM Automator
#  (c) Copyright 2010 IntegratID Solutions, LLC. All Rights Reserved.
#  Last Updated: July 25th, 2010
#
#  Descrtiption: Simulate a brute force login from a compromised computer
# ========================================================================
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'training/constants'
require 'training/cost_in_dollars'
include ArmAutomatorLanguage
include Constants
include CostInDollars

@automator = ArmAutomator.instance
# This represents a windows based machine in a botnet that is 
# being used to attempt brute forced logins with invalid passwords
use_browser "windows"

set_user_ip_address FRAUDULENT_IP
10.times do
  use_fraudulent_credentials
  result = assess_fraud_cost(perform_invalid_login)
  ### Troubleshooting
  ## Print the list of actions, alerts, and risk score for each runtime
  puts result
  
  ## Print the list of rules triggered for Pre-Auth
  puts print_triggered_rules result.preAuthResult
  
  ## Print the list of rules triggered for Post-Auth
  #@puts print_triggered_rules result.postAuthResult
end
