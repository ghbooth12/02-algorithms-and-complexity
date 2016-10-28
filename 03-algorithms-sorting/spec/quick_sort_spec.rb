include RSpec

require_relative '../quick_sort'

RSpec.describe QuickSort, type: Class do
  let(:arr) { ['E', 'C', 'A', 'B', 'F', 'G', 'D'] }
  let(:qs) { QuickSort.new }

  describe "#combine(left, pivot, right)" do
    it "combines sub-arrays and pivot" do
      left = ['a', 'e']
      right = ['s', 'u']
      pivot = 'o'
      result = ['a', 'e', 'o', 's', 'u']
      expect(qs.combine(left, pivot, right)).to eq result
    end

    it "combines when pivot is equal to sub-array" do
      left = ['o']
      right = ['s', 'u']
      pivot = 'o'
      result = ['o', 's', 'u']
      expect(qs.combine(left, pivot, right)).to eq result
    end
  end

  describe "#quick_sort(array)" do
    it "returns the sorted array" do
      sorted = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(qs.quick_sort(arr)).to eq sorted
    end

    it "tests with an array of numbers" do
      other = [7, 25, 8, 0, 35, 22, 73, 18, 99]
      sorted = [0, 7, 8, 18, 22, 25, 35, 73, 99]
      expect(qs.quick_sort(other)).to eq sorted
    end

    it "tests with an array of words" do
      other = ["dog", "cat", "rabbit", "chipmunk", "deer"]
      sorted = ["cat", "chipmunk", "deer", "dog", "rabbit"]
      expect(qs.quick_sort(other)).to eq sorted
    end
  end
end
