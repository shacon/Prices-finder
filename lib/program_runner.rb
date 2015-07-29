require './combinationfinder'
require './file_reader'
filename = ARGV.first

@com = CombinationFinder.new
@file_reader = FileReader.new(filename)

def run
	@file_reader.get_contents
	@file_reader.collect_prices
	@file_reader.collect_items

	#create a hash of menu with keys as items and prices as values
	menu = @com.create_menu_hash(@file_reader.items, @file_reader.prices)

    smallest = @com.find_smallest_element(@file_reader.prices)
    target = @file_reader.price1
    depth = @com.find_depth(smallest, target)
    price_combs = @com.find_solution(depth, target, @file_reader.prices)

    if price_combs == nil
    	puts "There is no solution"
    else
	    solution_array = @com.find_menu_item_array(menu, price_combs)
	    solution_hash = @com.find_number_of_each_item(solution_array)
	    puts @com.put_solution(solution_hash)
	end

 end

run
