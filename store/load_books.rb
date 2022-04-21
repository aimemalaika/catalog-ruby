def load_books
  return [] unless File.exist?(BOOKS_FILE)

  file = File.open(BOOKS_FILE)
  books_read = File.read(file)
  books_json = JSON.parse(books_read)

  loaded_books = []

  books_json.each do |book|
    book_label = @labels.select { |label| label.id == book['label'] }

    single_book = Book.new(book['publisher'], book['cover_state'], id: book['id'])
    single_book.add_label(book_label[0]) unless book_label.empty?

    loaded_books << single_book
  end
  file.close
  loaded_books
end
