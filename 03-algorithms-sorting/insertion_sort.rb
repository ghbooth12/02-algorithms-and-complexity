class InsertionSort
  def insertion_sort(array)
    sorted = [array.delete_at(0)]

    for val in array
      index = 0
      while index < sorted.length  # loops through 'sorted' array
        if val <= sorted[index]  # if value is less than item in 'sorted'
          if index < 1
            sorted = [val] + sorted
          else
            # insert the value into 'sorted'
            sorted = sorted[0..index-1] + [val] + sorted[index..-1]
          end
          break  # move onto the next value in the given array
        elsif index == sorted.length - 1  # value is greater than 'sorted''s last item(largest item)
          sorted << val  # append the value to 'sorted' array
          break
        end
        index += 1
      end
    end
    sorted
  end
end
