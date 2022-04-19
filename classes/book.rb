require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher = 'Unknown', cover_state = 'Unknown', archived: false,
                 publish_date: Date.today.year, id: Random.rand(1..1000))
    super(publish_date: publish_date, archived: archived, id: id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?; end

  private :can_be_archived?
end
