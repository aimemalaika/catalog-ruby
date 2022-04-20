require_relative 'spec_helper'

describe Book do
  describe '#new' do
    it 'takes 0-2 arguments and returns a Book object' do
      @book = Book.new
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#can be archived?' do
    it 'can_be_archived? private func from Book returns true if parent method returns true OR if cover state is bad' do
      # ARRANGE
      @good_new_book = Book.new('', 'good', publish_date: '01/01/2020')
      @bad_new_book = Book.new('', 'bad', publish_date: '01/01/2020')
      @good_old_book = Book.new('', 'good', publish_date: '01/01/2000')
      @bad_old_book = Book.new('', 'bad', publish_date: '01/01/2000')
      # ASSERT
      expect(@good_new_book.move_to_archive).to be_nil
      expect(@bad_new_book.move_to_archive).to be_truthy
      expect(@good_old_book.move_to_archive).to be_truthy
      expect(@bad_old_book.move_to_archive).to be_truthy
    end
  end
end
