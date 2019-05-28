def all_words_capitalized?(arr)
    arr.all? { |ele| ele.capitalize == ele}
end

def no_valid_url?(arr)
    correct = ['.com', '.net', '.io', '.org']

    arr.none? do |ele|
        correct.any? { |ele2| ele.end_with?(ele2)}
    end
end

def any_passing_students?(arr)
    arr.any? do |ele|
        grades = ele[:grades]
        avg = grades.sum / (grades.length * 1.0)
        avg >= 75
    end
end