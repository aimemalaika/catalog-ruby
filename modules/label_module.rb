require './classes/label'

module AddLabels
  def add_labels(labels)
    temp_arr = ['Ohara red', 'Killer black', 'Whale blue', 'Hawaii green']
    temp_arr.each do |str|
      title, color = str.split
      labels << Label.new(title, color)
    end
  end
end
