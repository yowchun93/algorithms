@id = []
(0..9).each do |i|
	@id << i
end	

# constant time finding
def find(p)
	return @id[p]
end

# only maintain the index value if id[p] == id[q]
def union(p, q)
	pid = find(p)
	qid = find(q)
	@id.each_with_index do |a,i|
		# makes all id with value pid to qid
		if @id[i] == pid
			@id[i] = qid
		end	
	end
end

# no tree structure , just a flat array
union(4,5)
puts find(4) #==> 5 

union(4,6)
puts find(4) #==> 6
puts find(5) #==> 6


