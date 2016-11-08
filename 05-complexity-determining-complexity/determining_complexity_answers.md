1. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.
```ruby
def goodbye_world(n)
 puts "Goodbye World! #{n}"
end
```
This method runs and finishes in constant time regardless of input size.
<Worst-case>
O(1)
<Best-case>
Ω(1)



2. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.
```ruby
def find_largest(collection)
 largest = collection[0]
 collection.length.times do |i|
   if collection[i] >= largest
     largest = collection[i]
   end
 end
 largest
end
```
This method is linear. As input size grows, its running time grows linearly. Its running time in the worst case and the best case are the same because even if the largest item is the first one it looks at, but it still has to compare its value with the rest of item in the input collection.

<Worst-case>
O(n)
<Best-case>
Ω(n)


3. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.
```ruby
def find_largest(collection)
 largest = collection[0][0]
   collection.length.times do |i|
    subcollection = collection[i]
    subcollection.length.times do |i|
     if subcollection[i] >= largest
       largest = subcollection[i]
     end
   end
 end
 largest
end
```

100 items in a 2D array, n = 100
collection.length returns 10 (the outer loop does ten iterations)
subcollection.length also does 10 iterations (for each out iteration)
Worst Case for size n = 100 is 100 iterations

10000 times in 2D array, n = 10000
What does collection.length return when collection has 10000 items?
collection.length returns 100 (the outer loop does ten iterations)
subcollection.length also does 100 iterations (for each out iteration)
Worst Case for size n = 10000 is 10000 iterations

1000000 times in 2D array, n = 1000000
collection.length returns 1000 (the outer loop does ten iterations)
subcollection.length also does 1000 iterations (for each out iteration)
Worst Case for size n = 1000000 is 1000000 iterations

 n = 0, Number of iterations is 0
 n = 100, number of iterations is 100
 n = 10000, number of iterations is 10000
 n = 1000000, number of iterations is 1000000
 where n is the size of collection, in other words the size of the input


| Start Here | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | X |
| X | X | X | X | X | X | X | X | X | Largest |


<Worst-case>
O(n): If the 'input size' is the total number of elements in each inner array.
or
O(n^2): If the 'input size' is the inner array's length.


<Best-case>
Ω(n): If the 'input size' is the total number of elements in each inner array.
or
Ω(n^2): If the 'input size' is the inner array's length.
(Because even if the method finds the largest element, it still keeps searching until it reaches the last element in the array.)



4. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.
```ruby
def numbers(n)
 if (n == 0)    # n==0: it takes '1' unit of time
   return 0     
 elsif (n == 1)   # n==1: it takes '1' unit of time
   return 1     
 else
   # n-1: it takes '1' unit of time, n-2: it takes '1' unit of time, + : it takes '1' unit of time
   return numbers(n-1) + numbers(n-2)  
 end
end
```
--------------------------
Let's say T(n): Running time of fib(n)
Known value: T(0) = T(1) = 1
constant factor: one call of fib(n) takes '4' unit of time

T(n) = T(n-2) + T(n-1) + 4
We know that T(n-2) < T(n-1) but it is almost T(n-2) == T(n-1) (approximation)

**Assumption: T(n-1) == T(n-2)**
(T(n-1) has a greater value so this will have a upper bound)

  T(n) = 2T(n-1) + C    # C: 4, T(n-1) = 2T(n-2) + C
       = 2{2T(n-2) + C} + C   
       = 4T(n-2) + 3C   # T(n-2) = 2T(n-3) + C
       = 4{2T(n-3) + C} + 3C
       = 8T(n-3) + 7C   # T(n-3) = 2T(n-4) + C
       = 8{2T(n-4) + C} + 7C
       = 16T(n-4) + 15C

       = 2^k T(n-k) + (2^k -1)C   # if n-k = 0, n=k
       = 2^n T(0) + (2^n -1)C
       = 2^n + 2^n C - C
       = (1+C)2^n - C

  T(n) = O(2^n)  (upper bound)

**Assumption: T(n-2) == T(n-1)**
(T(n-2) has a less value so this will have a lower bound)

  T(n) = 2T(n-2) + C   # T(n-2) = 2T(n-4) + C
       = 2{2T(n-4) + C} + C
       = 4T(n-4) + 3C   # T(n-4) = 2T(n-6) + C
       = 4{2T(n-6) + C} + 3C
       = 8T(n-6) + 7C   # T(n-6) = 2T(n-8) + C
       = 8{2T(n-8) + C} + 7C
       = 16T(n-8) + 15C

       = 2^k T(n-2k) + (2^k -1)C    # if n-2k = 0, k= n/2
       = 2^n/2 T(0) + (2^n/2 -1)C
       = 2^n/2 + 2^n/2 C - C
       = (1+C)2^n/2 - C

  T(n) = Ω(2^n/2) = Ω(2^n)  (lower bound)

---------------------------
# Algorithm to find complexity:
# n is the nth number in the fibonacci sequence
# Graph: n vs. number of recursive function calls it took to find n
# Look at that trend line and fine the "upper bound" of your graph, and that is the Big-O (worst case complexity)

# n (input size) : number of recursive calls
# n = 0 : 1
# n = 1 : 1
# n = 2 : 2 numbers(1) + numbers(0) (this, is one function call which is constant)
# n = 3 : 3 numbers(1) + numbers(0) + numbers(0)
# n = 4 : 5
# n = 5 : 8
# n = 6 : 13
# n = 7 : 20
# n = 8 : 29

5. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.
```ruby
def iterative(n)
 # part 1
 num1 = 0
 num2 = 1

 # part 2
 i = 0
 while i < n-1  
   tmp = num1 + num2
   num1 = num2
   num2 = tmp
   i+=1
 end

 num2
end
```
In the 'part 1', it simply assigns variables. The running time of 'part 1' is O(1).
In the 'part 2', it runs a while loop and this loop runs through n. The running time of 'part 2' is O(n).

T(n): the running time of iterative(n)
T(n) = O(1) + O(n)
     = O(n)    # discards constant factor

6. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.
```ruby
def sort(collection, from=0, to=nil)
 if to == nil
   # Sort the whole collection, by default
   to = collection.count - 1
 end

 if from >= to
   # Done sorting
   return
 end

 # Take a pivot value, at the far left
 pivot = collection[from]

 # Min and Max pointers
 min = from
 max = to

 # Current free slot
 free = min

 while min < max
   if free == min # Evaluate collection[max]
     if collection[max] <= pivot # Smaller than pivot, must move
       collection[free] = collection[max]
       min += 1
       free = max
     else
       max -= 1
     end
   elsif free == max # Evaluate collection[min]
     if collection[min] >= pivot # Bigger than pivot, must move
       collection[free] = collection[min]
       max -= 1
       free = min
     else
       min += 1
     end
   else
     raise "Inconsistent state"
   end
 end

 collection[free] = pivot

 quick_sort collection, from, free - 1
 quick_sort collection, free + 1, to

 collection
end
```
T(n): Time taken to calculate quick_sort
T(0) = T(1) = 1

<Worst-case: When pivot doesn't partition evenly, which means pivot is the least or the largest element, subcollection is only 1 less than the collection. This recursive call takes C(n-1) time and the next recursive call takes C(n-2) time and so on.>

*(n-1)C: time taken to do while loop*
*T(n-1): time taken to recursively call on the most unbalanced subcollection*
*1: time taken to recursively call on the empty array. After partitioning, two subcollection sizes are 0 and n-1*

T(n) = (n-1)C + T(n-1) + 1    # T(n-1) = (n-2)C + T(n-2) + 1
     = (n-1)C + {(n-2)C + T(n-2) + 1} + 1
     = 2Cn - (1+2)C + T(n-2) + 2   # T(n-2) = (n-3)C + T(n-3) + 1
     = 2Cn - (1+2)C + {(n-3)C + T(n-3) + 1} + 2
     = 3Cn - (1+2+3)C + T(n-3) + 3    # T(n-3) = (n-4)C + T(n-4) + 1
     = 3Cn - (1+2+3)C + {(n-4)C + T(n-4) + 1} + 3
     = 4Cn - (1+2+3+4)C + T(n-4) + 4
     ...
     = kCn - C(1+k)k/2 + T(n-k) + k    # if n-k = 0, n = k
     = Cn^2 - C(1+n)n/2 + T(0) + n
     = Cn^2 - Cn/2 - C/2 n^2 + 1 + n
     = (C - C/2)n^2 + (1 - C/2)n + 1


     => O(n^2)   # drops constant coefficient, lower order term and constant term


<Best-case: When pivot is in the middle after partitioning, two subcollection sizes are equal or within 1 of each other.>
*(n-1)C: time taken to do while loop*
*T(n/2): time taken to recursively call on the evenly partitioned subcollection*
*After partitioning, two subcollection sizes are n/2 and n/2*

T(n) = (n-1)C + T(n/2) + T(n/2)
     = (n-1)C + 2T(n/2)   # T(n/2) = (n/2 - 1)C + 2T(n/4)
     = (n-1)C + 2{ (n/2 - 1)C + 2T(n/4) }
     = 2Cn - 3C + 4T(n/4)   # T(n/4) = (n/4 - 1)C + 2T(n/8)
     = 2Cn - 3C + 4{ (n/4 - 1)C + 2T(n/8) }
     = 3Cn - 7C + 8T(n/8)   # T(n/8) = (n/8 - 1)C + 2T(n/16)
     = 3Cn - 7C + 8{ (n/8 - 1)C + 2T(n/16) }
     = 4Cn - 15C + 16T(n/16)
     ...
     = kCn - (2^k -1)C + 2^k T(n/2^k)   # if n/2^k = 1, n = 2^k. So k = lg n
     = Cn lg n - (2^lg n - 1)C + 2^lg n T(1)   # 2^lg n = n
     = Cn lg n - Cn + C + n
     = Cn lg n + (1 - C)n + C


     => Ω(n lg n) = Ω(n log n)  # drops constant coefficient, lower order term and constant term


Worst-case: O(n^2)
Best-case: Ω(n log n)
