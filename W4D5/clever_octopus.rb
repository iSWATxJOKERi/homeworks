# O(n)
def clever_octopus(a)
    largest = ""
    a.each_with_index do |fish, i|
        largest = fish if fish.length > largest.length
    end
    largest
end

a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p clever_octopus(a)