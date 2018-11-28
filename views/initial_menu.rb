class InitialMenu

  def initialize
    puts 'Welcome to Mock Nequi'
  end

  def start
    select_option
  end

  private
  def show_menu
    puts '1. Login'
    puts '2. Check in'
    puts '3. Close Mock Nequi'
  end

  def get_option
    print 'Enter to option: '
    option = gets.chomp.to_i
  end

  def select_option
    begin
      show_menu
      option = get_option
      case option
      when 1
        puts 'login'
      when 2
        puts 'Check'
      when 3
        puts 'bye'
      else
        puts 'Wrong option'
      end
    end while option != 3
  end

end
