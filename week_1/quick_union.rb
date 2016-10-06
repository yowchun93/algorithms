require 'byebug'

def quick_union

end

@id = []

(1..9).each do |i|
  @id[i] = i
end

# find site which has a link to itself
def find(a) 
  until @id[a] == a
    a = @id[a]
  end
  return a
end

puts find(5)

# union
def union(p,q)

end

