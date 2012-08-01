# ========================================================================
#  Author: IntegratID Solutions, LLC
#  ARM Automator
#  (c) Copyright 2010 IntegratID Solutions, LLC. All Rights Reserved.
#  Last Updated: July 25th, 2010
#
#  Descrtiption: This script is used to performance test the bill pay
#     transaction.  It will spawn 2 threads and each thread will execute
#     the TransactionTest class's test method as many times as possible.
#     The results will be recorded and are visible from the web interface
#     under the performance test named "Billpay Test".
# ========================================================================
require 'jruby/scriptable_performance_test_runner'
require File.dirname(__FILE__) + '/transaction_helper'

class BillPayPerformanceTest < ScriptablePerformanceTestRunner
  def setup
    configure_performance_test :name => "BillPay Test", :threads => 2, :duration => 60
    @test_class = TransactionTest
  end
end

class TransactionTest < ScriptablePerformanceTest
  include TransactionHelper
  
  def test
    load_random_user
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
    contextData["dest_account.account_number"] = "3157718283"
    contextData["dest_account.type"] = "checking"
    contextData["dest_account.date_opened"] = "10/05/2008"
    
    # Set the Transaction data
    contextData["bill_pay.amount"] = "#{gen_random_dollar_amount(30)}.26"
        
    # Run the custom runtime
    run_transaction :transactionType => "bill_pay", :contextMap => contextData, :status => 2
    result = run_rules :runtime => 600, :contextMap => contextData
  end
end
BillPayPerformanceTest.run