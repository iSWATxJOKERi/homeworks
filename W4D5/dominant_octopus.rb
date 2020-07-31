# O(n log n)
def dominant_octopus(array)
    sorted = sort_octopus(array)
    sorted[-1]
end

def sort_octopus(arr)
    return arr if arr.length < 2
    middle = arr.length / 2
    left = sort_octopus(arr[0...middle])
    right = sort_octopus(arr[middle + 1..-1])

    merge(left, right)
end

def merge(left, right)
    arr = []
    while (left.length > 0) && (right.length > 0)
        if left[0].length < right[0].length
            arr << left.shift
        else
            arr << right.shift
        end
    end
    arr + left + right
end

a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p dominant_octopus(a)