# ========================================================================
#  Author: IntegratID Solutions, LLC
#  ARM Automator
#  (c) Copyright 2010 IntegratID Solutions, LLC. All Rights Reserved.
#  Last Updated: July 25th, 2010
#
#  Descrtiption: This script is used to represent multiple users using the
#    same device in a branch office.
# ========================================================================
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'training/constants'
require 'training/cost_in_dollars'
include ArmAutomatorLanguage
include Constants
include CostInDollars

@automator = ArmAutomator.instance
# May represent a shared workstation commonly used by branch users
# This will try to use a specific browser and if it doesn't exist it will create one for future use
begin
  use_named_browser "branchOffice"
rescue
  create_named_browser :browser_name => "branchOffice", :operating_system => "windows"
  use_named_browser "branchOffice"
end
# May represent branch office location with a NAT'd firewall
set_user_ip_address "12.130.33.139"
5.times do
  use_normal_credentials
  assess_valid_cost(perform_login)
end
