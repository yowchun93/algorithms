require 'byebug'

@id = []
@size = []

(0..9).each do |i|
  @id[i] = i
  @size[i] = i
end

@id.delete(nil)
@size.delete(nil)

def find(p)
	until @id[p] == p
		p = @id[p]
	end
	return p;
end

def weighted_union(p, q)
	i = find(p)
	j = find(q)
	
	if @size[i] < @size[j] 
		@id[i] = j
		@size[j] += @size[i]
	else
		@id[j] = i
		@size[i] += @size[j]
	end 
end

weighted_union(4,5)
puts find(4)
weighted_union(4,6)
puts find(4)
weighted_union(4,7)
puts find(4)