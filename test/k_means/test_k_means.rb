require 'helper'

class TestKMeans < Test::Unit::TestCase
  context "A KMeans Instance" do
    
    setup do
	  @data = {}
	    200.times do |i|
      @data[i] = [rand, rand]
	  end
      @kmeans = KMeans.new(@data, :centroids => 2, :distance_measure => :cosine_similarity)
    end
  
    should "return a hash" do
      assert_kind_of String, @kmeans.inspect
    end
    
    should "have 2 centroids" do
      assert_equal 2, @kmeans.centroids.size
    end
    
    should "have 200 nodes" do
      assert_equal 200, @kmeans.nodes.size
    end
        
  end
end
