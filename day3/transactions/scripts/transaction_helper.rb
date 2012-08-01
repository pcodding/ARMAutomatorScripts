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
