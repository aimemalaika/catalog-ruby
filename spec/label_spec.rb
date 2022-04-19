require_relative 'spec_helper'

describe Label do
  describe '#new' do
    it 'takes 1-4 arguments and returns a Book object' do
      # ARRANGE
      @label1 = Label.new('Tom Sawyer')
      @label2 = Label.new('Jim Peach', 'yellow')
      @label3 = Label.new('For dummies', 'green', [@label1, @label2])
      @label4 = Label.new('Pelicans', '#000', [402, 600], id: 500)
      # ASSERT
      expect(@label1).to be_an_instance_of Label
      expect(@label2).to be_an_instance_of Label
      expect(@label3).to be_an_instance_of Label
      expect(@label4).to be_an_instance_of Label
    end
  end

  describe '#add' do
    it 'add_item func takes an item and updates label\'s items and item\'s label' do
      # ARRANGE
      @item = Item.new('12/18/1998', false)
      @label = Label.new('Comedy')
      # ACT
      @label.add_item(@item)
      # ASSERT
      expect(@label.items).to include(@item)
      expect(@item.label).to be(@label)
    end
  end
end
