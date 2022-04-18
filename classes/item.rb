require('date')

class Item
  attr_reader :id, :archived
  attr_accessor :publish_date

  def initialize(id: Rand.random(1.1000), publish_date: Date.today.year, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
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
