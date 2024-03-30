class StringCalculator
  def self.add(numbers)
    delimiters = [',', "\n"]
    
    if numbers.start_with?("//")
      custom_delimiter = numbers[2]
      delimiters.push(custom_delimiter)
      numbers = numbers.split("\n", 2)[1]
    end

    numbers_array = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    
    negatives = numbers_array.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    numbers_array.sum
  end
end