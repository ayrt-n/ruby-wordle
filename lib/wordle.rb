# frozen_string_literal: true

require './lib/colorize_string'

# Class representation of hidden word and related functionality
class Wordle
  attr_reader :word

  def initialize(word)
    @word = word.upcase.split('')
  end

  # Takes string guess and returns array of characters highlighted based on whether the letter is
  # Correct (green), partially correct (yellow), or incorrect (grey)
  def check_guess(guess)
    # Create duplicate array of hidden word to manipulate/keep track of characters already counted
    word_tmp = word.dup

    # Turn guess string into array of upper cased characters to keep track of correct/partial/incorrect letters
    guess_array = guess.upcase.split('')

    # Highlight the correct, partially correct, and incorrect letters
    feedback_array = highlight_correct_letters(guess_array, word_tmp)
    feedback_array = highlight_partially_correct_letters(feedback_array, word_tmp)
    highlight_incorrect_letters(feedback_array)
  end

  # Check if provided string is equal to @word (case insensitive), returns bool
  def equal?(other)
    word.join('') == other.upcase
  end

  private

  # Checks guess for correct letter, correct position and highlights green
  # Takes array of guess characters and the hidden word and returns array
  def highlight_correct_letters(guess_array, tmp_word_array)
    guess_array.map.with_index do |char, i|
      if char == tmp_word_array[i]
        tmp_word_array[i] = nil
        char.bg_green.black
      else
        char
      end
    end
  end

  # Check guess for correct letter, wrong position and highlight yellow
  # Takes array of guess characters and the hidden word and returns array
  def highlight_partially_correct_letters(guess_array, tmp_word_array)
    guess_array.map do |char|
      if tmp_word_array.include?(char)
        tmp_index = tmp_word_array.index(char)
        tmp_word_array[tmp_index] = nil
        char.bg_yellow.black
      else
        char
      end
    end
  end

  # Check guess for incorrect letters and highlight grey
  # Takes array of guess characters and the hidden word and returns array
  def highlight_incorrect_letters(feedback_array)
    feedback_array.map do |char|
      char.include?("\[e") ? char : char.bg_grey.black
    end
  end
end
