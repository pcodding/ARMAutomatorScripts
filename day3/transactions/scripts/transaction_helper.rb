# ========================================================================
#  Author: IntegratID Solutions, LLC
#  ARM Automator
#  (c) Copyright 2010 IntegratID Solutions, LLC. All Rights Reserved.
#  Last Updated: July 25th, 2010
#
#  Descrtiption: This class is used to contain helper methods that can be
#    used to generate random dollar amounts or account numbers, etc.
# ========================================================================
module TransactionHelper
  
  # Generate a random account number that is 10 characters long
  def gen_account_number(size)
    pool = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    result = Array.new
    10.times { result << pool[rand(8)] }
    return result.join("")
  end
  
  # Generate a random dollar amount given a minimum
  def gen_random_dollar_amount(min)
    return (min.to_i + rand(1000)).to_s
  end
end