# O(n ^ 2)
def sluggish_octopus(a)
    largest = ""
    i = 0
    while i < a.length - 1
        j = 1
        while j < a.length
            if (a[i].length > a[j].length) && a[i].length > largest.length
                largest = a[i]
            elsif (a[j].length > a[i].length) && a[j].length > largest.length
                largest = a[j]
            end
            j += 1
        end
        i += 1
    end
    largest
end

a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(a)
