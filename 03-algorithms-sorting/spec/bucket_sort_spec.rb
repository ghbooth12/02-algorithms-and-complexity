include RSpec

require_relative '../insertion_sort'
require_relative '../bucket_sort'

RSpec.describe BucketSort, type: Class do
  let(:arr) { ['E', 'C', 'A', 'B', 'F', 'G', 'D'] }
  let(:bs) { BucketSort.new }

  describe "#find_max(array)" do
    it "finds the largest item in the given array" do
      expect(bs.find_max(arr)).to eq "G"
    end
  end

  describe "#fill_bucket(array)" do
    it "sets up buckets and distributes each item into the proper bucket according to its value" do
      bs.fill_bucket(arr)
      a = Array.new
      a[6] = ['E', 'C', 'A', 'B', 'D']
      a[7] = ['F', 'G']
      expect(bs.buckets).to eq a
    end
  end

  describe "#insertion_sorting" do
    it "sorts each non-empty bucket in @buckets using 'insertion_sort' algorithms" do
      bs.fill_bucket(arr)
      bs.insertion_sorting
      a = Array.new
      a[6] = ['A', 'B', 'C', 'D', 'E']
      a[7] = ['F', 'G']
      expect(bs.buckets).to eq a
    end
  end

  describe "#bucket_sort(array)" do
    it "visits the buckets in order and put all elements into the array and return it" do
      sorted = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
      expect(bs.bucket_sort(arr)).to eq sorted
    end

    it "tests with an array of numbers" do
      other = [7, 25, 8, 0, 35, 22, 73, 18, 99]
      sorted = [0, 7, 8, 18, 22, 25, 35, 73, 99]
      expect(bs.bucket_sort(other)).to eq sorted
    end

    it "tests with an array of words" do
      other = ["dog", "cat", "rabbit", "chipmunk", "deer"]
      sorted = ["cat", "chipmunk", "deer", "dog", "rabbit"]
      expect(bs.bucket_sort(other)).to eq sorted
    end
  end
end
