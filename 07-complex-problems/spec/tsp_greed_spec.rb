include RSpec

require_relative '../tsp_greed'

RSpec.describe TSPGreed, type: Class do
  let(:c) { {name: "Chicago", visited: false} }
  let(:s) { {name: "Seattle", visited: false} }
  let(:l) { {name: "Los Angeles", visited: false} }
  let(:f) { {name: "Ft. Lauderdale", visited: false} }
  let(:n) { {name: "New York", visited: false} }

  let(:edges) { [
    [c,s,30], [c,l,29], [c,f,20], [c,n,12],
    [s,l,17], [s,f,48], [s,n,43],
    [l,f,39], [l,n,42],
    [f,n,18]
  ] }

  let(:tsp_greed) { TSPGreed.new }

  describe "#find_neighbors" do
    it "returns the neighboring cities from the given city" do
      expect(tsp_greed.find_neighbors(edges, l).size).to eq 4
    end
  end

  describe "#get_city_hash" do
    it "returns the neighbor city in the given edge" do
      edge = [f,n,18]
      expect(tsp_greed.get_city_hash(f, edge)).to eq n
    end
  end

  describe "#tsp" do
    it "returns the nearest possible neighbors from Chicago" do
      result = ["Chicago", "New York", "Ft. Lauderdale", "Los Angeles", "Seattle"]
      path = tsp_greed.tsp(edges, c)
      expect(path[:routes]).to eq result
      expect(path[:distance]).to eq 86
    end

    it "returns the nearest possible neighbors from Seattle" do
      result = ["Seattle", "Los Angeles", "Chicago", "New York", "Ft. Lauderdale"]
      path = tsp_greed.tsp(edges, s)
      expect(path[:routes]).to eq result
      expect(path[:distance]).to eq 76
    end
  end
end
