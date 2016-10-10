class InvestmentQuery
	include Comparable
	
	attr_accessor :priority, :query_time, :stock_id, :investor

	def initialize(opts= {})
		@stock_id = opts[:stock_id]
		@query_time = opts[:query_time]
		@priority = opts[:priority]
		@investor = opts[:investor]
	end

	## similar to c# compare to 
	def <=>(other)
		priority_compare = self.priority <=> other.priority
		if priority_compare != 0 
			return priority_compare
		end
		return self.query_time <=> other.query_time
	end

end