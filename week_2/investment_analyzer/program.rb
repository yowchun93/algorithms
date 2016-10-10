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
		Benchmark.bm do |x|
			x.report { 
				5000.times do 
					analyzer.handle_query(create_query)
				end 
			}
		end
		
		puts "analyzing query"
		## analysis of queries
		Benchmark.bm do |x|
			x.report { analyzer.analyze_queries }
		end

		puts "handling trading"
		Benchmark.bm do |x|
			x.report { stock_trader.handle_trading }
		end
		
	end

	def create_query
		stock_id =  "Stock" + rand(100).to_s
		return InvestmentQuery.new(stock_id: stock_id, 
			query_time: Time.now, priority: rand(5), investor: "someone")
	end

end

program = Program.new
program.run