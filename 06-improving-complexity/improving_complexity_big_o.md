* `improving_complexity_version_one.rb`: has code optimizations

* `improving_complexity_version_two.rb`: improves the time complexity

* `improving_complexity_version_three.rb`: improves the space complexity

###Find Big-O of each version

1. Version one(code optimizations)
  * **time complexity: O(n^2)**

      There is a loop inside another loop in the beginning. => O(n^2)
      Then it does 'insertion sorting'. => O(n^2)
  * **space complexity: O(1)**

      A computer saves variables and the state of the method `sort` in the memory. And the method `sort` does not recursively call itself. So it only takes a constant space. => O(1)

2. Version two(improving time complexity)

  In order to improve time complexity, `merge sort`, `quick sort` and `heap sort` can be used instead of `insertion sort`. Because:

  time complexity | merge sort | heap sort | quick sort
  -----|------------|-----------|-----------
  Best-case | O(n log n) | O(n log n) | O(n log n)
  Average-case | O(n log n) | O(n log n) | O(n log n)
  Worst-case | O(n log n) | O(n log n) | O(n^2)

  Thus I used 'merge sorting' to replace the 'insertion sorting' code.

    * **time complexity: O(n log n)**

      T(n): Time taken to execute 'sort'
      T(0) = T(1) = 1
      sqrt(n): two-dimensional array. If input size is n, it iterates sqrt(n) times.  

      T(n) = sqrt(n) + 2T(n/2) + n + C  # sqrt(n) is lower order term than n
           => 2T(n/2) + n + C
           = 4T(n/4) + 2n + 3C
           = 8T(n/8) + 3n + 7C
           = 16T(n/16) + 4n + 15C

           = 2^kT(n/2^k) + kn + (2^k -1)C   # when n/2^k = 1, k = lg n
           = n + n lg n + (n-1)C

           => O(n lg n)

    * **space complexity: O(n lg n) or O(n)**

      'merge sort' calls itself recursively. Every time it calls itself recursively, a computer saves variables and the state. This is stacked in the memory.

        If we do not clear extra memory for 'left' and 'right': O(n lg n)
        If we clear extra memory in each call: O(n)

3. Version three(improving space complexity)

  In order to improve space complexity, `insertion sort`, `selection sort`, `bubble sort` and `heap sort` can be used instead of `merge sort`. Because:

  space complexity| insertion sort | selection sort | bubble sort | heap sort
  -----|------------|-----------|-----------|------------
  Worst-case | O(1) | O(1) | O(1) | O(1)

  Thus I used 'heap sorting' to replace the 'merge sorting' code.

    * **time complexity: O(n log n)**

      lg n: When it calls `moveUp` or `moveDown`, the while loop in `moveUp` and `moveDown` runs in the levels of the heap. => (lg n) iterations

      T(n) = sqrt(n) + n(C + lg n) + n(C + lg n)

           => O(n log n )

    * **space complexity: O(1)**

      A computer saves variables and the state of the method `sort` in the memory. And the method `sort` does not recursively call itself. So it only takes a constant space. => O(1)
