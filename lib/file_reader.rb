
class FileReader

  attr_accessor :prices, :items, :price1, :text, :contents, :filename

  def initialize(filename)
  	@filename = filename
  end

  def get_contents
  	@text = open(filename)
  	@contents = File.read(filename)
  end
  
  def collect_prices
    @prices = @contents.scan(/\d+[.]\d+/)
    @prices.collect! &:to_f
    @price1 = prices.delete_at(0)
  end

  def collect_items
    @items = contents.scan(/[^$\d.,]/m).join("").split(/\n/)
    @items.delete_at(0)
  end
end





