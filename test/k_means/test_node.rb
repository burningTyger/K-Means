require 'helper'

class TestNode < Test::Unit::TestCase
  context "A Data Instance" do
    
    setup do
      @node = Node.new([4, 4], :euclidean_distance)
    end
  
    should "return an array" do
      assert_kind_of Array, @node.position
    end
    
    should "create a hash of nodes" do
	  data = {}
	    10.times do |i|
      data[i] = [rand, rand]
	  end
      nodes = Node.create_nodes(data, :euclidean_distance)
      assert_kind_of Hash, nodes
    end
    
    should "create 10 nodes" do
	  data = {}
	    10.times do |i|
      data[i] = [rand, rand]
	  end
      nodes = Node.create_nodes(data, :euclidean_distance)
      assert_equal 10, nodes.size
    end
    
    should "initialize closest centroid" do
      a = @node.closest_centroid
      centroids = [Centroid.new([4, 4]), Centroid.new([5, 4])]
      @node.update_closest_centroid(centroids)
      assert_not_equal nil, @node.closest_centroid
    end
    
    should "update closest centroid" do
      centroids = [Centroid.new([5, 4])]
      @node.update_closest_centroid(centroids)
      a = @node.closest_centroid
      @node.update_closest_centroid([Centroid.new([4,4])])
      
      assert_not_equal a, @node.closest_centroid
      assert_equal 0, @node.best_distance
    end
    
    should "raise error if a false measure is specified" do
      assert_raise NoMethodError do
        Node.new([9,9], :fakey).calculate_distance([1,1])
      end
    end
        
  end
end