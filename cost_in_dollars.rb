module CostInDollars
  VALID_LOGIN_COST = 100
  FRAUD_LOGIN_COST = 1000
  
  attr_accessor :valid_logins_cost, :fraud_logins_cost
  
  def assess_valid_cost(result)
    if (result && (result.postAuthResult.finalAction != nil && result.postAuthResult.finalAction != "ALLOW"))
      if @valid_logins_cost == nil
        @valid_logins_cost = VALID_LOGIN_COST
      else
        @valid_logins_cost += VALID_LOGIN_COST
      end
    end
    return result
  end
  
  def assess_fraud_cost(result)
    if (result == nil || (result && (result.postAuthResult == nil || result.postAuthResult.finalAction == nil || result.postAuthResult.finalAction == "ALLOW")))
    	if @fraud_logins_cost == nil
        @fraud_logins_cost = FRAUD_LOGIN_COST
	    else
	      @fraud_logins_cost += FRAUD_LOGIN_COST
	    end
    end
    return result
  end
  
  def total_cost
    return "Valid Login Cost: $#{@valid_logins_cost}\nFraud Logins Cost: $#{@fraud_logins_cost}"
  end
end
