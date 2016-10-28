include RSpec

require_relative '../merge_sort'

RSpec.describe MergeSort, type: Class do
  let(:arr) { ['E', 'C', 'A', 'B', 'F', 'G', 'D'] }
  let(:ms) { MergeSort.new }

  describe "#bubble_sort(array)" do
    it "returns the sorted array" do
      sorted = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(ms.merge_sort(arr)).to eq sorted
    end

    it "tests with an array of numbers" do
      other = [7, 25, 8, 0, 35, 22, 73, 18, 99]
      sorted = [0, 7, 8, 18, 22, 25, 35, 73, 99]
      expect(ms.merge_sort(other)).to eq sorted
    end

    it "tests with an array of words" do
      other = ["dog", "cat", "rabbit", "chipmunk", "deer"]
      sorted = ["cat", "chipmunk", "deer", "dog", "rabbit"]
      expect(ms.merge_sort(other)).to eq sorted
    end
  end
end
