require_relative '../classes/author'

module AuthorModule
  def add_authors(authors)
    author_names = ['Stephen King', 'Marguerite Duras', 'Saul Bellow', 'Ernest Hemingway']
    author_names.each do |author|
      first_name, last_name = author.split(' ')
      authors << Author.new(first_name, last_name)
    end
  end
end
