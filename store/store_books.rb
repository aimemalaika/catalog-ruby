def store_books
  books = @books.each_with_index.map do |book, index|
    { class: book.class, publisher: book.publisher, cover_state: book.cover_state,
      label: (book.label ? book.label.id : nil),
      index: index, id: book.id }
  end
  json_books = JSON.generate(books)
  File.write(BOOKS_FILE, json_books)
end
