class LRUCache
    def initialize(n)
        @cache = Array.new(n)
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      repeat = false
      @cache.each_with_index do |e, i|
        if el == e 
            repeat = true
            @cache = @cache[0...i] + @cache[(i + 1)..-1]
            @cache.push(el) if i == (self.count - 1)
        end
    end

      if repeat == false
        if @cache < self.count
            @cache << el
        elsif self.count == n
            @cache.shift
            @cache << el
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @cache
    end

    private
    # helper methods go here!

end 

johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]