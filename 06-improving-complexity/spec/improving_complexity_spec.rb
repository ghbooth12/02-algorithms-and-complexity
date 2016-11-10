include RSpec

# require_relative '../improving_complexity_version_one'
require_relative '../improving_complexity_version_three'

RSpec.describe ImprovingComplexity, type: Class do
  let(:ic) { ImprovingComplexity.new }
  let(:a1) { ['R', 'U', 'L', 'E'] }
  let(:a2) { ['T', 'I', 'M', 'F'] }
  let(:a3) { ['S', 'C', 'O', 'A'] }

  describe "#sort(arrays)" do
    it "returns the sorted array" do
      result = ['A', 'C', 'E', 'F', 'I', 'L', 'M', 'O', 'R', 'S', 'T', 'U']
      expect(ic.sort(a1,a2,a3)).to eq result
    end

    it "returns empty array" do
      result = []
      expect(ic.sort([])).to eq result
    end

    it "returns single element array" do
      result = ['a']
      expect(ic.sort(['a'])).to eq result
    end
  end
end



# ic = ImprovingComplexity.new
# a1 = ['R', 'U', 'L', 'E']
# a2 = ['T', 'I', 'M', 'F']
# a3 = ['S', 'C', 'O', 'A']
#
# ic.insertion_sort(a1,a2,a3)
