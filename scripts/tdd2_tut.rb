require "minitest/autorun"

# Represent Standard Playng Cards
class PlayingCard
  attr_reader :rank, :suit
  def initialize(s: nil, r: nil)
    @suit = suit
    @rank = rank
    throw Exception unless valid?(s, r)
  end

  def random
    @suit = %w[hearts spades diamonds clubs].sample
    @rank = rand(13)
    self
  end

  def to_s
    card_to_english
  end

  def card_to_engish
    rank_to_english + ' of ' + @suit
  end

  def valid?(r, s)
    r >= 1 && r <= 13 && !s.nil?
  end

  private

  def rank_to_english
    if @rank == '1'
      'Ace'
    elsif @rank > 1 && @rank < 11
      number_to_english(@rank)
    elsif @rank == 11
      'Jack'
    elsif @rank == 12
      'Queen'
    elsif @rank == 13
      'King'
    end
  end

  def number_to_english(val)
    %w[fail0 fail1 two three four five six seven eight nine ten][val]
  end
end

### Represent a Deck of cards
class Deck
  def initialize
    @cards = {}
  end

  def deal
  end

  def length
    @cards.length
  end
end

#### Minitest/spec for Playing card

describe PlayingCard do
  it 'creates a valid card' do
    @a_card = PlayingCard.new.random
    @a_card.valid?.must_equal true
  end

  it 'Cant create an invalid card' do
    assert_raises Exception do
      PlayingCard.new(suit: 100, rank: 200)
    end
  end
end


describe Deck do
  it "starts out empty" do
    deck = Deck.new
    deck.length.must_equal 0
  end

  it 'can deal a card' do
    deck = Deck.new
    acard = deck.deal
    acard.valid?.assert_equal true
  end

  it "can receive a card" do
    deck = Deck.new
    deck.insert(PlayingCard.new.random)
    deck.cards_left.must_equal 1
  end
end
