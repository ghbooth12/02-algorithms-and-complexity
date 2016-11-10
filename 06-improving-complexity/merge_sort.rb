class MergeSort
  def merge_sort(array)
    return array if array.length <= 1  # base-case: single item array is returned

    mid = (array.length - 1) / 2
    left = merge_sort(array[0..mid])  # divides array into left array and right array.
    right = merge_sort(array[mid+1..-1])
    merge(left, right) # Recursion! Keep dividing until base-case.
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left[0] <= right[0]
      [left[0]] + merge(left[1..-1], right)  # Recursion! Keep comparing each first items until either array is empty.
    else
      [right[0]] + merge(left, right[1..-1])  # Recursion!
    end
  end
end
