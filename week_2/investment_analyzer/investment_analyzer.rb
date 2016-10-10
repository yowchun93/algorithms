require 'byebug'

class InvestmentAnalyzer
	attr_accessor :queries , :stock_2_rating

	def initialize(stock_trader)
		@stock_trader = stock_trader
		@queries = []
		## stores the cache of stocks and its rating 
		@stock_2_rating = []
	end

	#public interface
	def handle_query(query)
		@queries << (query)
	end

	def analyze_queries
		while(@queries.count > 0)
			rating = 0
			query = get_first_priority(@queries)
			
			# linear time operation also
			cache_element = @stock_2_rating.find { |a| a.stock_id == query.stock_id }
			
			if !cache_element.nil?
				rating = cache_element.rating
			else
				rating = calculate_rating(query.stock_id)
				@stock_2_rating << RatingCacheElement.new(stock_id: query.stock_id,
														  rating: rating)
			end
			## redundant part
			if rating > 80
				stock_trader.enqueue_stock_for_trading(query)
			end
		end
	end

	private

	## why not just pass in the instance variable?
	def get_first_priority(queries)
		min_query = nil
		# linear time loop o(n) , compare every single element
		queries.each do |query|
			# if min_query in nil or query is smaller than min_query
			if(min_query.nil? || (query <=> min_query) < 0 )
				min_query = query
			end
		end
		queries.delete(min_query)
		return min_query
	end

	def calculate_rating(stock_id)
		rand(100)
	end

end


class RatingCacheElement
	def initialize(stock_id, rating)
		@stock_id = stock_id
		@rating = rating
	end
end

