# ========================================================================
#  Author: IntegratID Solutions, LLC
#  ARM Automator
#  (c) Copyright 2010 IntegratID Solutions, LLC. All Rights Reserved.
#  Last Updated: July 25th, 2010
#
#  Descrtiption: Simulate a malware keylogger situation in which the
#   user's credentials were stolen and used from a different location in a
#   short time frame.
# ========================================================================
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require 'training/constants'
require 'training/cost_in_dollars'
include ArmAutomatorLanguage
include Constants
include CostInDollars

@automator = ArmAutomator.instance
# Load a random user's location/device information
load_fraudulent_user
# This user brought their laptop with them on a trip to San Francisco...and picked
# up some malware with a key logger somewhere along the way.
use_location :country => "United States", :state => "California", :city => "San Francisco"
perform_login

# The attacker in New York City recieved the key logger details and attempts a login
# as that user.
use_browser "linux"
use_location :country => "United States", :state => "New York", :city => "New York"
assess_fraud_cost(perform_login)
