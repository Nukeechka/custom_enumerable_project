# frozen_string_literal: true

# module Enum
module Enumerable
  def my_each_with_index
    index = 0
    for item in self # rubocop:disable Style/For
      yield(item, index)
      index += 1
    end
  end

  def my_select
    new_array = []
    for item in self # rubocop:disable Style/For
      new_array << item if yield(item)
    end
    new_array
  end

  def my_map
    new_array = []
    for item in self # rubocop:disable Style/For
      new_array << yield(item)
    end
    new_array
  end

  def my_none?
    for item in self # rubocop:disable Style/For
      return false if yield(item)

    end
    true
  end

  def my_any?
    for item in self # rubocop:disable Style/For
      return true if yield(item)

    end
    false
  end

  def my_count
    count = 0
    return size unless block_given?

    for item in self # rubocop:disable Style/For
      count += 1 if yield(item)
    end
    count
  end

  def my_all?
    for item in self # rubocop:disable Style/For
      return false unless yield(item)
    end
    true
  end

  def my_inject(accumulator = nil)
    for item in self # rubocop:disable Style/For
      if accumulator.nil? # rubocop:disable Style/ConditionalAssignment
        accumulator = item
      else
        accumulator = yield(accumulator, item)
      end
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

# class Array
class Array
  # Define my_each here
  def my_each
    for item in self # rubocop:disable Style/For
      yield(item)
    end
  end
end
