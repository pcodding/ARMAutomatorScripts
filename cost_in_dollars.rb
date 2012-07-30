module CostInDollars
  VALID_LOGIN_COST = 100
  FRAUD_LOGIN_COST = 1000
  @valid_logins_cost = 0
  @fraud_logins_cost = 0
  
  def assess_valid_cost(result)
      if (result && result.postAuthResult != "ALLOW")
        @valid_logins_cost += VALID_LOGIN_COST
      end
      return result
  end
  
  def assess_fraud_cost(result)
      if (result && result.postAuthResult == "ALLOW")
        @fraud_logins_cost += FRAUD_LOGIN_COST
      end
      return result
  end
  
  def total_cost
    return "Valid Login Cost: $#{@valid_logins_cost}\nFraud Logins Cost: $#{@fraud_logins_cost}"
  end
end