# frozen_string_literal: true

require './lib/game_controller'

describe GameController do
  let(:game) { GameController.new('TEST') }

  describe '#win?' do
    it 'returns true if provided the correct word' do
      expect(game.win?('TEST')).to be true
    end

    it 'returns false if provided the incorrect word' do
      expect(game.win?('NOPE')).to be false
    end
  end
end