# frozen_string_literal: true

require './lib/wordle'

# Class representation of Wordle gameflow
class GameController
  attr_reader :word, :number_of_rounds
  attr_accessor :round

  def initialize(word, round = 0, number_of_rounds = 5)
    @word = Wordle.new(word)
    @round = round
    @number_of_rounds = number_of_rounds
  end

  def win?(guess)
    word.equal?(guess)
  end
end