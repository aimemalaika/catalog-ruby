require_relative 'spec_helper'

describe Label do
  describe '#new' do
    it 'takes 1-4 arguments and returns a Book object' do
      @label1 = Label.new('Tom Sawyer')
      @label2 = Label.new('Jim Peach', 'yellow')
      @label3 = Label.new('For dummies', 'green', [@label1, @label2])
      @label4 = Label.new('Pelicans', '#000', [402, 600], id: 500)
      expect(@label1).to be_an_instance_of Label
      expect(@label2).to be_an_instance_of Label
      expect(@label3).to be_an_instance_of Label
      expect(@label4).to be_an_instance_of Label
    end
  end
end