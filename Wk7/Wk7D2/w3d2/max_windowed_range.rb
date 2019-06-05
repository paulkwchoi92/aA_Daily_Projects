#---------PHASE 1 ---------------------

def windowed_max_range(array, size)

    current_max_range = nil

    (0...array.length) do |i|
        window = array.slice(i, size)

    end


    current_max_range
end

windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8