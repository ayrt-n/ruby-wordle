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
      guess = 'STOP'
      expected_results = ['S'.bg_yellow.black,
                          'T'.bg_yellow.black,
                          'O'.bg_grey.black,
                          'P'.bg_grey.black]
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

    it 'highlights letters all three colors when it should' do
      complex_wordle = Wordle.new('QQQWWEQQWERTTYUUIIOP')
      guess = 'QWQQW  QQQUAASRUI PP'
      expected_results = ['Q'.bg_green.black, 'W'.bg_yellow.black, 'Q'.bg_green.black, 'Q'.bg_yellow.black, 'W'.bg_green.black,
                          ' '.bg_grey.black, ' '.bg_grey.black, 'Q'.bg_green.black, 'Q'.bg_yellow.black, 'Q'.bg_grey.black,
                          'U'.bg_yellow.black, 'A'.bg_grey.black, 'A'.bg_grey.black, 'S'.bg_grey.black, 'R'.bg_yellow.black,
                          'U'.bg_green.black, 'I'.bg_green.black, ' '.bg_grey.black, 'P'.bg_grey.black, 'P'.bg_green.black]
      expect(complex_wordle.check_guess(guess)).to eql(expected_results)
    end
  end
end