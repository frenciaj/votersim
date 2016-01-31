class World

  def initialize
    @politicians = []
    @voters = []
  end


  end

  def main_menu
    puts "What would you like to do?
    (C)reate, (L)ist, (U)pdate, or (D)elete"
    main_menu_input = gets.chomp.downcase
    until main_menu_input == "c" || main_menu_input == "l" || main_menu_input == "u" || main_menu_input == "d"
      puts "Wrong key entered, please try again"
      main_menu_input = gets.chomp.downcase
    end
    if main_menu_input == "c"
      create
    elsif main_menu_input == "l"
      list
    elsif main_menu_input == "u"
      update
    elsif main_menu_input == "d"
      delete
    end
  end


  def create
    puts "What would you like to create?
    (P)olitician or (V)oter"
    create_input = gets.chomp.downcase
    until create_input == "p" || create_input == "v"
      puts "Wrong key entered, please try again"
      create_input = gets.chomp.downcase
    end
    if create_input == "p"
      politician
    elsif create_input == "v"
      voter
    end
  end

  def list

    @politicians.each do |politics|
      puts "Politician:  Name: #{politics.name} - Party: #{politics.party}"
    end
    @voters.each do |voter|
      puts "Voter:  Name: #{voter.name} - Politics: #{voter.politics}"
    end
    puts "Press a key to go back to the menu"
    input_list = gets
    main_menu
  end

  def update
    puts "Who would you like to update? (P)oliticians or (V)oters"
    update_input = gets.chomp.downcase
    until update_input == "p" || update_input == "v"
      puts "Wrong keyword entered, Who would you like to update? (P)oliticians or (V)oters"
      update_input = gets.chomp.downcase
    end
    if update_input == "p"
      puts "Ok, you want to update a politician, please tell me the name"
      update_name_input = gets.chomp.capitalize
      @politicians.each do |politic|
        if politic.name == update_name_input
          puts "#{update_name_input} is on our list, do you want to change the (N)ame or (P)arty?"
          update_politic_input1 = gets.chomp.downcase
          until update_politic_input1 == "n" || update_politic_input1 == "p"
            puts "Wrong keyword entered, do you want to change the (N)ame or (P)arty?"
            update_politic_input1 = gets.chomp.downcase
          end
          if update_politic_input1 == "n"
            puts "Please tell me the new name?"
            update_name_input_new = gets.chomp.capitalize
            politic.name = update_name_input_new
            # politic.name = input
          elsif
            if update_politic_input1 == "p"
              puts "Please tell me the new party, (D)emocrat or (R)epublican?"
              update_name_input_new1 = gets.chomp.downcase
              until update_name_input_new1 == "d" || update_name_input_new1 == "r"
                puts "Wrong keyword entered,  (D)emocrat or (R)epublican?"
                update_name_input_new1 = gets.chomp.downcase
              end
              if update_name_input_new1 == "d"
                politic.party = "Democrat"
              elsif update_name_input_new1 == "r"
                politic.party = "Republican"
              end
              puts "Thank you for updating your database"
              main_menu
            end

          end
          puts "Thank you for updating your database"
          main_menu

        end
      end
      puts "Sorry, #{update_name_input} is not on the list...."
      main_menu
      # end

    elsif update_input == "v"
      puts "Ok, you want to update a voter, please tell me the name"
      update_name_input = gets.chomp.capitalize!
      @voters.each do |voter|
        if voter.name == update_name_input
          puts "#{update_name_input} is on our list, do you want to change the (N)ame or (P)olitics?"
          update_politic_input1 = gets.chomp.downcase
          until update_politic_input1 == "n" || update_politic_input1 == "p"
            puts "Wrong keyword entered, do you want to change the (N)ame or (P)olitics?"
            update_politic_input1 = gets.chomp.downcase
          end
          if update_politic_input1 == "n"
            puts "Please tell me the new name?"
            update_name_input_new = gets.chomp.capitalize!
            voter.name = update_name_input_new
          elsif
            if update_politic_input1 == "p"
              puts "Please tell me the new party, (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
              update_name_input_new1 = gets.chomp.downcase
              until update_name_input_new1 == "l" || update_name_input_new1 == "c" || update_name_input_new1 == "t" || update_name_input_new1 == "s" || update_name_input_new1 == "n"
                puts "Wrong keyword entered,  (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
                update_name_input_new1 = gets.chomp.downcase
              end
              if update_name_input_new1 == "l"
                voter.politics = "Liberal"
              elsif update_name_input_new1 == "c"
                voter.politics = "Conservative"
              elsif update_name_input_new1 == "t"
                voter.politics = "Tea Party"
              elsif update_name_input_new1 == "s"
                voter.politics = "Socialist"
              elsif update_name_input_new1 == "n"
                voter.politics = "Neutral"
              end
              puts "Thank you for updating your database"
              main_menu
            end
          end
          puts "Thank you for updating your database"
          main_menu
        end
      end
    end
    puts "Sorry, #{update_name_input} is not on the list...."
    main_menu

  end

  def politician
    puts "Please tell me the name of the politician"
    politician_name_input = gets.chomp.capitalize!
    puts "Now please tell me your party
    (D)emocrat or (R)epublican"
    politician_party_input = gets.chomp.downcase
    until politician_party_input == "d" || politician_party_input == "r"
      puts "Wrong keyword entered,  (D)emocrat or (R)epublican"
      politician_party_input = gets.chomp.downcase
    end
    if politician_party_input == "d"
      @politicians << Politician.new(politician_name_input, "Democrat")
    elsif
      politician_party_input == "r"
      @politicians << Politician.new(politician_name_input, "Republican")
    end
    puts "Thank you for your input!"
    main_menu
  end


  def voter
    puts "Please tell me the name of the voter"
    voter_name_input = gets.chomp.capitalize
    puts "Now please tell me your politics
    (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    voter_party_input = gets.chomp.downcase
    until voter_party_input == "l" || voter_party_input == "c" || voter_party_input == "t" || voter_party_input == "s" || voter_party_input == "n"
      puts "Wrong keyword entered,  (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
      voter_party_input = gets.chomp.downcase
    end
    if voter_party_input == "l"
      @voters << Voter.new(voter_name_input, "Liberal")

    elsif voter_party_input == "c"
      @voters << Voter.new(voter_name_input, "Conservative")

    elsif voter_party_input == "t"
      @voters << Voter.new(voter_name_input, "Tea Party")

    elsif voter_party_input == "s"
      @voters << Voter.new(voter_name_input, "Socialist")
    elsif voter_party_input == "n"
      @voters << Voter.new(voter_name_input, "Neutral")
    end
    puts "Thank you for your input!"
    main_menu
  end

  def delete
    puts "So, do you want to delete a (P)olitician or a (V)oter?"
    input_delete = gets.chomp.downcase
    until input_delete == "p" || input_delete == "v"
      puts "Sorry, you didnt type a valid keyword,  do you want to delete a (P)olitician or a (V)oter?"
      input_delete = gets.chomp.downcase
    end
    if input_delete == "p"
      puts "Ok, please tell me the name of the politician?"
      input_delete_name = gets.chomp.capitalize!
      @politicians.each do |politic|
        if politic.name == input_delete_name
          puts "It seems that #{input_delete_name} is on our database, are you sure that you want to delete it? (Y)es / (N)o"
          input_delete_confirmation = gets.chomp.downcase
          until input_delete_confirmation == "y" || input_delete_confirmation == "n"
            puts "Please type the correct key (Y)es / (N)o"
            input_delete_confirmation = gets.chomp.downcase
          end
        end
        if input_delete_confirmation == "y"
          @politicians.delete_if{|h| h.name == input_delete_name}
          puts "Thanks for updating our database"
          main_menu
        end
      end
        main_menu
    elsif input_delete == "v"
      puts "Ok, please tell me the name of the voter?"
      input_delete_name_voter = gets.chomp.capitalize!
      @voters.each do |voter|
        if voter.name == input_delete_name_voter
          puts "It seems that #{input_delete_name_voter} is on our database, are you sure that you want to delete it? (Y)es / (N)o"
          input_delete_confirmation = gets.chomp.downcase
          until input_delete_confirmation == "y" || input_delete_confirmation == "n"
            puts "Please type the correct key (Y)es / (N)o"
            input_delete_confirmation = gets.chomp.downcase
          end
        end
        if input_delete_confirmation == "y"
          @voters.delete_if{|h| h.name == input_delete_name_voter}
          puts "Thanks for updating our database"
          main_menu
        end
      end
    end
    main_menu
  end
end

class Politician
attr_accessor :name, :party

  def initialize(name, party)
    @party = party
    @name = name
  end


end

class Voter
attr_accessor :name, :politics

  def initialize(name, politics)
    @politics = politics
    @name = name
  end
end


puts "Welcome to the Voter List!"

world = World.new
world.main_menu
