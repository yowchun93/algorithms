class StockTrader

	def initialize
		## change the stock_to_trade into a linked-list
		@stocks_to_trade = []
	end

	def enqueue_stock_for_trading(query)
		@stocks_to_trade << query
	end

	def handle_trading
		while(@stocks_to_trade.count > 0 )
			## getting the first element
			## this is a o(n) operation
			query = @stocks_to_trade.first
			@stocks_to_trade.shift
		end
	end

end