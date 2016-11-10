class TSPGreed
  # This method returns the nearest possible neighbors using a greedy methodology(heuristics).
  def tsp(cities, current)
    path = {routes: [current[:name]], distance: 0}
    while !current[:visited]
      current[:visited] = true
      neighbors = find_neighbors(cities, current)
      # Unless it has visited all the cities
      unless neighbors.empty?
        next_edge = neighbors[0]

        # Finds the least cost path
        for neighbor in neighbors[1..-1]
          # Each egde has distance value at the last index
          if neighbor[-1] < next_edge[-1]
            next_edge = neighbor
          end
        end

        # Get the neighbor city of the current city
        next_city = get_city_hash(current, next_edge)
        path[:routes] << next_city[:name]
        path[:distance] += next_edge[-1]
        current = next_city
      end
    end
    path
  end

  # This method returns the neighboring cities from the given city.
  # The argument edges: cities passed from tsp()
  def find_neighbors(edges, city)
    output = []
    for edge in edges
      another_city = get_city_hash(city, edge)
      # If the city is included in the edge AND the city's neighbor has never been visited.
      if edge.include?(city) && !another_city[:visited]
        output << edge
      end
    end
    output
  end

  # This method returns the neighbor city of the init_city in the given edge.
  # The argument init_city: current city
  # The argument edge: edge which contains 'init_city'
  def get_city_hash(init_city, edge)
    i = edge.index(init_city)
    if i == 1
      return edge[0]
    elsif i == 0
      return edge[1]
    end
  end
end

# c = {name: "Chicago", visited: false}
# s = {name: "Seattle", visited: false}
# l = {name: "Los Angeles", visited: false}
# f = {name: "Ft. Lauderdale", visited: false}
# n = {name: "New York", visited: false}
#
# edges = [
#   [c,s,30], [c,l,29], [c,f,20], [c,n,12],
#   [s,l,17], [s,f,48], [s,n,43],
#   [l,f,39], [l,n,42],
#   [f,n,18]
# ]
#
# p TSPGreed.new.tsp(edges, c)
