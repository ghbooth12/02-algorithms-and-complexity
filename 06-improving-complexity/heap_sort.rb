class HeapSort
  def initialize
    @heapList = [0]
    @currentSize = 0
  end
  # This method prepends the root of heap into 'sorted' array.
  # The root of heap has the largest value.
  def heap_sort(array)
    sorted = []

    # Build Max binary heap
    for el in array
      insert(el)
    end

    # If sorted.length == array.length, there is nothing in heap.
    # deleteRoot returns the root that just got removed.
    while sorted.length < array.length
      sorted.unshift(deleteRoot)
    end

    sorted
  end


  private

  def moveUp(i)   # heapList[i]: node newly added
    while i / 2 > 0 # heapList[i / 2]: node newly added's parent
      if @heapList[i] > @heapList[i / 2] # if child is greater
        tmp = @heapList[i / 2] # swap with parent
        @heapList[i / 2] = @heapList[i]
        @heapList[i] = tmp
      end
      i /= 2 # move up to parent's parent
    end
  end

  def moveDown(i) # @heapList[i*2] is child node of heapList[i]
    while (i * 2) <= @currentSize # while @heapList[i*2] is NOT a leaf node
      max_child = maxChild(i) # get the largest node
      if @heapList[i] < @heapList[max_child] # if child is greater than parent
        tmp = @heapList[i] # swap parent with child
        @heapList[i] = @heapList[max_child]
        @heapList[max_child] = tmp
      end
      i = max_child # move down to the largest child
    end
  end

  def maxChild(i)
    # if right child node's index is greater than the total number of nodes == right child node does not exist
    # that is why it doesn't go to the next if statement to compare with right node
    if i * 2 + 1 > @currentSize
        return i * 2 # get left child node
    else
      # heapList[i]'s two child nodes: heapList[i*2], heapList[i*2+1]
      if @heapList[i * 2] > @heapList[i * 2 + 1]
        return i * 2 # left node is greater than right
      else
        return i * 2 + 1 # right node is greater than left
      end
    end
  end

  def insert(item)
    @heapList << item
    @currentSize += 1
    moveUp(@currentSize)
  end

  def deleteRoot
    return if @heapList[1].nil? # if empty heap tree

    i = 1 # root index is 1
    root = @heapList[i] # This will be deleted
    @heapList[i] = @heapList[@currentSize] # recently added node takes empty root spot
    @currentSize -= 1 # the recently added node moved, remove its old spot
    @heapList.pop
    moveDown(i)
    root
  end
end
