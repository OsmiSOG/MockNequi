
require 'db_conection'
lass Goal

  @id
  

  attr_accessor :name, :current_balance, :status, :active, :finish_time
  
  def initialize(db_conection,id )
    @id= id
    @db_conection= db_conection
    data=@db_conection.query("SELECT* FROM 'goals' WHERE 'id' = #{@id}")
    data.each do |i|
    @name
    @goal_balance i['goal_balance']#saldo meta
    @current_balance= i['current_balance'] #saldo actual
    @create_time = i['create_time'] #fecha de inicio
    @finish_time = i['finish_time']#fecha final
    @status= i['status'] #estado de la cuenta 
    @active= i['active']
  end
end

  def goals_created
  end
  def deposit_money
  end
  
  def close_goal
  end

  

end

