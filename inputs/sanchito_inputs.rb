def grap_book_data
  print "\nPlease enter the name of it's publisher: "
  publisher = gets.chomp

  print "\nPlease enter the state of it's cover [good or bad]: "
  cover_state = gets.chomp

  [publisher, cover_state]
end
