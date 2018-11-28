class MattressMenu

def start
select_option
end
private 
def show_menu
puts "1.check the money saved in the mattress."
puts "2.Add available money to the mattress."
puts "3.withdraw money from the mattress, which will be available again in the account."
puts "4. return menu"
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
          puts 'check'
          puts 'money in the mattress'
        when 2
          puts 'add money mattress'
        when 3
          puts 'withdram money'
        when 4
          puts 'return'
        else
          puts 'Wrong option'
        end
      end while option != 4
end

end
