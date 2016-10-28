include RSpec

require_relative '../bubble_sort'

RSpec.describe BubbleSort, type: Class do
  let(:arr) { ['E', 'C', 'A', 'B', 'F', 'G', 'D'] }
  let(:bs) { BubbleSort.new }

  describe "#bubble_sort(array)" do
    it "returns the sorted array" do
      sorted = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(bs.bubble_sort(arr)).to eq sorted
    end

    it "tests with an array of numbers" do
      other = [7, 25, 8, 0, 35, 22, 73, 18, 99]
      sorted = [0, 7, 8, 18, 22, 25, 35, 73, 99]
      expect(bs.bubble_sort(other)).to eq sorted
    end

    it "tests with an array of words" do
      other = ["dog", "cat", "rabbit", "chipmunk", "deer"]
      sorted = ["cat", "chipmunk", "deer", "dog", "rabbit"]
      expect(bs.bubble_sort(other)).to eq sorted
    end
  end
end
