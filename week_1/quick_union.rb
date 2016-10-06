require 'byebug'

def quick_union

end

@id = []

(0..9).each do |i|
  @id[i] = i
end

# not sure why there is nil
@id.delete(nil)

# find site which has a link to itself
# in other words, its finding the root of a node/site
def find(a) 
  until @id[a] == a
    a = @id[a]
  end
  return a
end

# union
def union(p,q)
  p_root = find(p)
  q_root = find(q)
  
  @id[p_root] = q_root
end

union(4,3)
puts find(4)
union(3,8)
puts find(3) # ==> 8
puts find(4) # ==> 8

union(6,5) 
puts find(6) # ==> 5
# union(0,1)
# union(0,2)
# union(0,7)
# union(1,5)
# union(5,6)

# what should be the number?

