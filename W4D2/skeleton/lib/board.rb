require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    self.place_stones
  end

  def place_stones
    # debugger
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |cup|
      if cup == 6 || cup == 13
        @cups[cup] = []
      else
        stones = []
        4.times do 
          stones << :stone
        end
        @cups[cup] = stones
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0
      raise "Invalid starting cup"
    elsif @cups[start_pos].length == 0
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      @cups[start_pos] = []
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

p k = Board.new("e","j")
