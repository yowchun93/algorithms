class InvestmentQuery
	def initialize(opts= {})
		@stock_id = opts[:stock_id]
		@query_time = opts[:query_time]
		@priority = opts[:priority]
		@investor = opts[:investor]
	end

	def compare_to(investment_query)
		
	end

end