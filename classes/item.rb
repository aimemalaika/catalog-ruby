require('date')

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :author, :label, :genre

  def initialize(publish_date, archived, id: Random.rand(1..1000))
    @publish_date = publish_date
    @archived = archived
    @id = id
    @author = nil
    @label = nil
    @genre = nil
  end

  def add_author(author)
    author.add_item(self)
  end

  def add_label(label)
    label.add_item(self)
  end

  def add_genre(genre)
    genre.add_item(self)
  end

  def can_be_archived?
    current_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
