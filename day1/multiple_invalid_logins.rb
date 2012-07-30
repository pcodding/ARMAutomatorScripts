# ========================================================================
#  Author: IntegratID Solutions, LLC
#  ARM Automator
#  (c) Copyright 2010 IntegratID Solutions, LLC. All Rights Reserved.
#  Last Updated: July 25th, 2010
#
#  Descrtiption: Simulate a user logging in unsuccessfully multiple times
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
# Perform 5 logins using an invalid password
5.times { assess_fraud_cost(perform_invalid_login) }