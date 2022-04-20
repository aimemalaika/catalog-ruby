require './classes/book'

module AddBooks
  def add_books(books)
    temp_arr = ['Ohara good', 'Killer bad', 'Whale perfect', 'Hawaii dirty']
    temp_arr.each do |str|
      publisher, cover_state = str.split
      books << Book.new(publisher, cover_state)
    end
  end
end