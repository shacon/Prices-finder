
require 'combinationfinder'

describe 'CombinationFinder Class' do
  
  before (:each) do
  	@com = CombinationFinder.new
  end

   it 'creates a hash mapping one array to another' do
   	a = ["eggs", "bacon", "tea", "coffee"]
	b = [[1.00], [3.12], [4.05], [5.11]]
   	@com.create_menu_hash(a, b).should == {"eggs"=>[1.0], "bacon"=>[3.12], "tea"=>[4.05], "coffee"=>[5.11]}
   end

   it 'finds menu items by looking up prices of each returning an array of these items' do
   	hash = {"eggs"=>1.0, "bacon"=>3.12, "tea"=>4.05, "coffee"=>5.11}
   	price_array = [1.0, 4.05]
   	@com.find_menu_item_array(hash, price_array).should == ["eggs", "tea"]
   end

   it 'finds menu items by looking up prices of each returning an array of these items' do
   	hash = {"mixed fruit"=>2.75, "french fries"=>2.15, "tea"=>12.9}
   	price_array = [2.15, 12.9]
   	@com.find_menu_item_array(hash, price_array).should == ["french fries", "tea"]
   end

   it 'finds the depth of an array filled with smallest number that adds up to equal target' do
   	price = 15
   	smallest_element = 3
   	@com.find_depth(smallest_element, price).should == 5
   end

   it 'finds the smallest element in an array' do
   	ary = [2, 3, 4]
   	@com.find_smallest_element(ary).should  == 2
   end

   it 'finds a solution' do
   	depth = 8
   	target = 15
   	ary = [2, 3, 4]
    @com.find_solution(depth, target, ary).should == [3, 4, 4, 4]
  end

   it 'returns nil when there is no solution' do
   	depth = 8
   	target = 15
   	ary = [2, 4, 6]
   	@com.find_solution(depth, target, ary).should == nil
   end
   
   it 'makes a hash of items in solution and number of times item appears' do
   	ary = ["hot wings","hot wings","mixed fruit","french fries"]
   	@com.find_number_of_each_item(ary).should == {"hot wings"=>2, "mixed fruit"=>1, "french fries"=>1}
   end

   it 'prints out solution in appropriate format' do
   	hash_solution = {"hot wings"=>2, "mixed fruit"=>1, "french fries"=>1}
   	@com.put_solution(hash_solution).should == "2 orders of hot wings, 1 order of mixed fruit, 1 order of french fries"
   end

end
