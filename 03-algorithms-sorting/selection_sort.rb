class SelectionSort
  def selection_sort(array)
    l = array.length

    # Exclude the last item. Because the second-to-last item will be compared with the last item.
    for i in 0..l-2
      min_index = i
      for j in i+1..l-1  # Elements to be compared with (Note: it includes the last item)
        if array[j] < array[min_index]  # Finds the minimum value
          min_index = j
        end
      end

      # If it finds the minimum value, then swap.
      if i != min_index
        temp = array[i]
        array[i] = array[min_index]
        array[min_index] = temp
      end
    end
    array
  end
end
