require_relative 'spec_helper'

describe Book do
  describe '#new' do
    it 'takes 0-2 arguments and returns a Book object' do
      @book = Book.new
      expect(@book).to be_an_instance_of Book
    end
  end
end
