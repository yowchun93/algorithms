require_relative 'stock_trader'
require_relative 'investment_analyzer'
require_relative 'investment_query'

class Program

	def run
		stock_trader = StockTrader.new
		analyzer = InvestmentAnalyzer.new(stock_trader)
		## 
		puts "querying"
		# benchmark
		50000.times do 
			
			analyzer.handle_query(create_query)
		end
	end

	def create_query
		stock_id =  "Stock" + rand.(10000)
		return InvestmentQuery.new(stock_id: stock_id, 
			query_time: Time.now, priority: random.next(5), investor: "someone")
	end

end

program = Program.new
program.run