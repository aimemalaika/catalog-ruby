require('date')

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :author

  def initialize(publish_date, archived, id: Random.rand(1..1000))
    @publish_date = publish_date
    @archived = archived
    @id = id
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
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
