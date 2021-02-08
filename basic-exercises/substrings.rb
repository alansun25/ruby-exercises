def substrings(words, arr)
    substrings = Hash.new(0)
    arr.each do |str|
        words.downcase.split.each { |word| substrings[str] += 1 if word.include?(str) }
    end
    substrings
end

# Tests
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)