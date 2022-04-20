require_relative '../classes/author'

module AuthorModule
  def add_authors(authors)
    author_names = %w[Stephen_King Marguerite_Duras Saul_Bellow Ernest_Hemingway]
    author_names.each do |author|
      first_name, last_name = author.split('_')
      authors << Author.new(first_name, last_name)
    end
  end
end
