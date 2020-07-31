# 0(1)
def constant_dance(a, new_tiles_data_structure)
    return new_tiles_data_structure[a] if new_tiles_data_structure.has_key?(a)
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
p constant_dance("up", tiles_hash)
p constant_dance("right-down", tiles_hash)