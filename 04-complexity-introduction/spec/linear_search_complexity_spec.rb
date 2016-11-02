include RSpec

require_relative '../linear_search_complexity'

RSpec.describe LinearSearchComplexity, type: Class do
  let(:ls_comp) { LinearSearchComplexity.new }
  let(:arr) { ['O', 'A', 'S', 'R', 'T', 'G', 'H'] }

  describe "#iteration_counter(array, target)" do
    it "does not count when array is empty" do
      empty_arr = []
      expect(ls_comp.iteration_counter(empty_arr, empty_arr[-1])).to eq 0
    end

    it "counts when iteration runs once" do
      target = 'O'
      expect(ls_comp.iteration_counter(arr, target)).to eq 1
    end

    it "counts when iteration runs 3" do
      target = 'S'
      expect(ls_comp.iteration_counter(arr, target)).to eq 3
    end

    it "counts when iteration runs 7" do
      target = 'H'
      expect(ls_comp.iteration_counter(arr, target)).to eq 7
    end
  end

  describe "#get_complexity(input_size)" do
    it "returns 0 when input_size is 0" do
      expect(ls_comp.get_complexity(0)).to eq 0
    end

    it "returns 3 when input_size is 3" do
      expect(ls_comp.get_complexity(3)).to eq 3
    end

    it "returns 100 when input_size is 100" do
      expect(ls_comp.get_complexity(100)).to eq 100
    end
  end
end
