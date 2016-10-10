require_relative 'stock_trader'
require_relative 'investment_analyzer'
require_relative 'investment_query'
require 'byebug'
require 'benchmark'


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

		## analysis of queries
		analyzer.analyze_queries

		stock_trader.handle_trading

	end

	def create_query
		stock_id =  "Stock" + rand(10000).to_s
		return InvestmentQuery.new(stock_id: stock_id, 
			query_time: Time.now, priority: rand(5), investor: "someone")
	end

end

program = Program.new
program.run