class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(id: Rand.random(1.1000), publish_date: 'Unknown', archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
  end

  def move_to_archive
  end

  private can_be_archived?
end


# @genre = genre
# @author = author
# @source = source
# @label = label

# genre = 'Unknown', author = 'Unknown', source = 'Unknown', label = 'Unknown',