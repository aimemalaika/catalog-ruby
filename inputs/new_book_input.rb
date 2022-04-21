def new_book_input
  puts "Let's create a book!"

  print "\nPlease enter the name of it's publisher: "
  publisher = gets.chomp

  print "\nPlease enter the state of it's cover [good or bad]: "
  cover_state = gets.chomp

  puts "\nChoose a label from the following list using a number"
  sleep(1)
  list_all_labels

  print "\nYour selected label: "
  label_chosen = gets.chomp.to_i

  new_book = Book.new(publisher, cover_state)
  new_book.add_label(@labels[label_chosen - 1])

  @books << new_book

  puts "\nBook created successfully!"

  puts "\n\n...Returning to main menu...\n\n"
  sleep(1)
end
