class Pocket

  def initialize(account_id)
<<<<<<< HEAD
     @name
     @balance
     @account_id
     @current_balance
     @amount
     @user_id
=======
     @account_id = account_id
     @total_balance = total_balance_db
>>>>>>> functionalities
  end

  def show_pockets
    i=0
    puts "list of pocket"
    pocket_exits=@db_conection.query("SELECT * FROM pockets")
    pocket_exits.each do|row|
        i = i+1
        puts "#{i}. #{row}"
      end

  end

  def create_pocket
    puts "new pocket "
    @balance=0
    goal_new=@db_conection.query("INSERT INTO 'pockets' ('name', 'balance') VALUES (#{@name}, #{@balance}) WHEN account_id= '#{account_id}')")
  end

  def eliminate_pocket
    puts '3'
  end

  def add_money
    puts "enter the amount of money you want to add to the pocket"
    amount = gets.chomp.to_i
    account_id = return_element(@db_conection.quiery("SELECT id FROM account WHERE user_id= '#{@user_id}''")), 'id'
    @db_conection.query("UPDATE 'pockets' SET 'current_balance' = '#{@current_balance + amount}' WHERE 'pockets'.'id' = '#{@id}'")
    @db_conection.query("INSERT INTO 'transactions' ( 'user_id', 'amount') VALUES (#{@user_id},#{amount})")
    @db_conection.quiery('BEGIN')
    @balance= new_money
  end

  def remove_money
    puts '5'
  end

  def send_money
    puts '6'
  end

  private
  def total_balance_db

  end

end
