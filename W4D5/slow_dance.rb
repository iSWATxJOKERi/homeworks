# O(n)
def slow_dance(direction, tiles_arr)
    tiles_arr.each_with_index do |move, i|
        return i if move == direction
    end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)