class Node
  
  class << self
    def create_nodes(data, similarity_measure)
      nodes = {}
      data.each_pair do |key, position|
        nodes[key] = new(position, similarity_measure)
      end
      nodes
    end
  end
  
  attr_accessor :position, :best_distance, :closest_centroid
  
  def initialize(position, similarity_measure)
    @position = position
    @similarity_measure = similarity_measure
  end
  
  def update_closest_centroid(centroids)
    calculate_initial_centroid(centroids.first) unless @closest_centroid
    updated = false
    centroids.each do |centroid|
      distance = calculate_distance(centroid)
      if distance < best_distance
        updated = true
        @closest_centroid = centroid
        @best_distance = distance
      end
    end
    updated == true ? 1 : 0
  end
    
  private
  
  def calculate_initial_centroid(centroid)
    @closest_centroid = centroid
    @best_distance = calculate_distance(centroid)
  end
  
  def calculate_distance(centroid)
    begin
      @position.send(@similarity_measure, centroid.position)
    rescue NoMethodError
      raise "Hey, that's not a measurement. Read the REAdME for available measurements"
    end
  end
  
end
