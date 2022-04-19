class Book
  attr_accessor :publisher, :cover_state

  def initialize publisher='Unknown', cover_state='Unknown'
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
  end

  private :can_be_archived?
end