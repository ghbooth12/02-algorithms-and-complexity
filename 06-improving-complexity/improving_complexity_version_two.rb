require_relative 'merge_sort'

class ImprovingComplexity
  # This method takes n arrays as input and combine them in sorted ascending order
  def sort(*arrays)
    combined_array = []
    arrays.each do |array|
      combined_array += array
    end

    MergeSort.new.merge_sort(combined_array)
  end
end
