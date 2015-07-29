
class CombinationFinder

    def create_menu_hash(items, prices)
	    Hash[items.zip prices]
    end

    def find_menu_item_array(hash, prices)
      arr = []
      if prices != nil
		for i in prices		   
		   arr << hash.key(i)
		   end
		end
	  arr	   
    end	

    def find_smallest_element(ary)
    	ary.min
    end

     def find_depth(element, target)
      #finds the depth of an array of same elements that sum up to target
	  sum = element
	  depth = 0
		  while sum <= target.to_i 
		     sum = sum + element
		     depth = depth + 1
		  end
	  depth
    end

    def check_comb(ary, target)
	    for i in ary
		    if i.reduce(:+) == target
		        return i
		    end
	    end
	    nil
    end

    def find_solution(depth, target, ary)
     i = 2
     solution = false
	     while solution == false and i <= depth
	       answer = check_comb(ary.repeated_combination(i), target)
	       if answer != nil
	           solution = true
	           return answer
	       else
	           i = i + 1
	       end
	       end
     if solution == false
         return nil
     end
    end

    def find_number_of_each_item(ary)
    #returns hash of item, number of times repeated
	counts = Hash.new 0
		ary.each do |ary|
		  counts[ary] += 1
		end
		counts
	end

	def put_solution(hsh)
		solution_string = ""
		hsh.each do |key, val|
			if val == 1
				solution_string += val.to_s + " order of " + key.to_s + ", "
		    else
		    	solution_string += val.to_s + " orders of " + key.to_s + ", "
		    end
		end
		solution_string[0...-2]
	end

end