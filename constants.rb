module Constants
  FRAUDULENT_IP = "72.30.38.140"
  FRAUDULENT_USERS = { "ari.kleitz","tom.dapp","pierre.difozzio","pradeep.roberts","muriel.fen" }
  NORMAL_USERS = { "weem.ingles","kosmo.tyler","deb.summers","lea.cook","manhkiet.king","guru.segal","srikanth.stewart","arnault.geller","ross.milton","winona.corvino","ross.newburg","katie.kilpatrick","stan.delott","alfred.lowe","marcio.stewart","katherine.leutwyler","sylvia.smythe","heath.jasuja","leonard.teichgraeber","george.dvorak","ocey.arredondo","silvia.piccione","guru.krishnamurthy","alfred.kolli","hormazd.lopez","satish.sherman","guru.evans","nilesh.anniston","paolo.kiessel","julio.geller","manhkiet.fischetti","winona.mccoy","iris.nam","alastair.curry","jen.lang","al.fen","ruby.galos","nathan.jones","veronica.wei","ethan.florek","kosmo.guralnick","vikki.schube","gurudatt.koski","adina.leutwyler","agarwal.fen","gustavo.knowler","connie.nash","veronica.purdon","vic.cuche" }
  
  def load_fraudulent_user
    load_user :login_id => get_random_fraudulent_login_id
  end
  
  def load_normal_user
    load_user :login_id => get_random_normal_login_id
  end
  
  def use_fraudulent_credentials
    use_credentials :login_id => get_random_fraudulent_login_id
  end
  
  def use_normal_credentials
    use_credentials :login_id => get_random_normal_login_id
  end
  
  private
  
  def get_random_fraudulent_login_id
    FRAUDULENT_USERS[rand(FRAUDULENT_USERS.size)]
  end
  
  def get_random_normal_login_id
    NORMAL_USERS[rand(NORMAL_USERS.size)]
  end
end