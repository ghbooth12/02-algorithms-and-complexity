include RSpec

require_relative '../insertion_sort'

RSpec.describe InsertionSort, type: Class do
  let(:arr) { ['E', 'C', 'A', 'B', 'F', 'G', 'D'] }
  let(:ins) { InsertionSort.new }

  describe "#bubble_sort(array)" do
    it "returns the sorted array" do
      sorted = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(ins.insertion_sort(arr)).to eq sorted
    end

    it "tests with an array of numbers" do
      other = [7, 25, 8, 0, 35, 22, 73, 18, 99]
      sorted = [0, 7, 8, 18, 22, 25, 35, 73, 99]
      expect(ins.insertion_sort(other)).to eq sorted
    end

    it "tests with an array of words" do
      other = ["dog", "cat", "rabbit", "chipmunk", "deer"]
      sorted = ["cat", "chipmunk", "deer", "dog", "rabbit"]
      expect(ins.insertion_sort(other)).to eq sorted
    end
  end
end
