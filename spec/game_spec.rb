require_relative 'spec_helper'

describe 'Game' do
  context 'when create a new game' do
    it 'return a new object' do
      game = Game.new(false, '22/2/2002', '2/2/2019')
      expect(game).to be_an_instance_of(Game)
    end

    it 'return the correct data' do
      game = Game.new(false, '22/2/2002', '2/2/2019')
      expect(game.multiplayer).to be false
    end
  end

  context 'when call can_be_archived? method' do
    it "should return true if parent's method returns true AND if last_played_at is older than 2 years" do
      game1 = Game.new(false, '22/2/2002', '2/2/2019')
      game2 = Game.new(false, '22/2/2002', '2/2/2000')
      expect(game1.can_be_archived?).to be_falsy
      expect(game2.can_be_archived?).to be_truthy
    end
  end
end
