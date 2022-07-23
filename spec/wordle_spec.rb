# frozen_string_literal: true

require './lib/wordle'
require './lib/colorize_string'

describe Wordle do
  let(:wordle) { Wordle.new('TEST') }

  describe '#check_guess' do
    it 'highlights letter green when the letter exists in the right position' do
      guess = 'TEST'
      expected_results = ['T'.bg_green.black,
                          'E'.bg_green.black,
                          'S'.bg_green.black,
                          'T'.bg_green.black]
      expect(wordle.check_guess(guess)).to eql(expected_results)
    end

    it 'highlights letter yellow when the letter exists but in the wrong position' do
      guess = 'MUST'
      expected_results = ['M'.bg_grey.black,
                          'U'.bg_grey.black,
                          'S'.bg_green.black,
                          'T'.bg_green.black]
      expect(wordle.check_guess(guess)).to eql(expected_results)
    end

    it 'highlights letter gren when the letter does not exist' do
      guess = '    '
      expected_results = [' '.bg_grey.black,
                          ' '.bg_grey.black,
                          ' '.bg_grey.black,
                          ' '.bg_grey.black]
      expect(wordle.check_guess(guess)).to eql(expected_results)
    end
  end
end