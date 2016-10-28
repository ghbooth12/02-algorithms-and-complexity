include RSpec

require_relative '../heap_sort/heap_sort'
require_relative '../heap_sort/max_binary_heap'

RSpec.describe HeapSort, type: Class do
  let(:arr) { ['E', 'C', 'A', 'B', 'F', 'G', 'D'] }
  let(:hs) { HeapSort.new }

  describe "#build_heap(array)" do
    it "builds a MAX binary heap" do
      hs.build_heap(arr)
      a = ['G', 'E', 'F', 'B', 'C', 'A', 'D']
      expect(hs.heap.printf).to eq a
    end
  end

  describe "#heap_sort(array)" do
    it "returns the sorted array" do
      sorted = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(hs.heap_sort(arr)).to eq sorted
    end

    it "tests with an array of numbers" do
      other = [7, 25, 8, 0, 35, 22, 73, 18, 99]
      sorted = [0, 7, 8, 18, 22, 25, 35, 73, 99]
      expect(hs.heap_sort(other)).to eq sorted
    end

    it "tests with an array of words" do
      other = ["dog", "cat", "rabbit", "chipmunk", "deer"]
      sorted = ["cat", "chipmunk", "deer", "dog", "rabbit"]
      expect(hs.heap_sort(other)).to eq sorted
    end
  end
end
