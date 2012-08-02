require 'pp'
require 'jruby/arm_automator'
require 'jruby/arm_automator_language'
require File.dirname(__FILE__) + '/transaction_helper'
include ArmAutomatorLanguage
include TransactionHelper

@automator = ArmAutomator.instance
create_test_user :login_id_prefix => "test", :external_user_id_suffix => "@gmail.com", :group => "training"

3.times {
  perform_login
  contextData = Hash.new
  # Set the User Entity Data
  # The user's login id is in the format firstname.lastname
  contextData["user.first_name"] = @user.login_id.split(".").first
  contextData["user.last_name"] = @user.login_id.split(".").last
  contextData["user.login_date"] = Time.now.strftime("%m/%d/%Y")
  
  # Set the SourceAccount entity data
  contextData["source_account.account_number"] = gen_account_number(10)
  contextData["source_account.type"] = "checking"
  contextData["source_account.date_opened"] = "12/05/2002"
  
  # Set the DestinationAccount entity data
  contextData["dest_account.account_number"] = "3157718294"
  contextData["dest_account.type"] = "checking"
  contextData["dest_account.date_opened"] = "10/05/2008"
  
  # Set the Transaction data
  contextData["bill_pay.amount"] = "#{gen_random_dollar_amount(30)}.26"
  
  # Troubleshooting: Print the map to see what data is sent to ARM
  #puts pp contextData
  
  # Run the custom runtime
  run_transaction :transactionType => "bill_pay", :contextMap => contextData, :status => 2
  result = run_rules :runtime => 600, :contextMap => contextData
  
  # Troubleshooting: Print the rules result and all triggered rules
  puts result
  puts print_triggered_rules result
}

remove_user :login_id => @user.login_id
