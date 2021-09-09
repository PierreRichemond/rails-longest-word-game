require 'open-uri'
class GamesController < ApplicationController

  def newgame
    @letters = (0...10).map do
      ('a'..'z').to_a[rand(26)]
    end
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    json = open(url).read
    found = JSON.parse(json)["found"]
    @score = []

    condition_true =
    @word.chars.all? { |letter| @letters.include?(letter) }
    # The word can’t be built out of the original grid
     @result =
    if !condition_true
      "Your word is made up"
    elsif @word == ''
      "You haven't enter any letters"
      # The word is valid according to the grid, but is not a valid English word
    elsif condition_true && !found
      "Your found a word that is not registered in the english language"
      # The word is valid according to the grid and is an English word
    elsif condition_true && found

      alphabet = ('a'..'z').to_a
      @word.split('').each do |letter|
        number = (alphabet.index(letter) + 1)
        @score << number
      end
      'The word you found is a valid word.'
    end
  end
end
