module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in (0..(self.length - 1))
      yield self[i], i
    end
    return self
  end

  def my_select
    filtered_array = []
    for i in 0..(self.length - 1)
      if yield self[i]
        filtered_array.push(self[i])
      end
    end
    return filtered_array
  end

  def my_all?
    matching_array = []
    for i in 0..(self.length - 1)
      if yield self[i]
        matching_array << true
      else
        matching_array << false
      end
    end
    return true if matching_array.count(true) == self.length
    return false
  end

  def my_any?
    matching_array = []
    for i in 0..(self.length - 1)
      if yield self[i]
        matching_array << true
      else
        matching_array << false
      end
    end
    return true if matching_array.include?(true)
    return false
  end

  def my_none?
    matching_array = []
    for i in 0..(self.length - 1)
      if yield self[i]
        matching_array << true
      else
        matching_array << false
      end
    end
    return true if matching_array.count(false) == self.length
    return false
  end

  def my_count
    counter = 0
    return self.length unless block_given?
    for i in 0..(self.length - 1)
      if yield self[i]
        counter += 1
      end
    end
    return counter
  end

  def my_map
    mapped_array = []
    self.length.times {|i| mapped_array << yield(self[i])}
    return mapped_array
  end

  def my_inject(initial_value)
    result = initial_value
    for i in 0..(self.length - 1)
      result = yield result, self[i]
    end
    return result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.length.times do |i|
      yield self[i]
    end
    return self
  end
end
