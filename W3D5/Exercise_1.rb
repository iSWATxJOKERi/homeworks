class Stack
    attr_reader :store_stack
    def initialize
      # create ivar to store stack here!
      @store_stack = []
    end

    def push(el)
      # adds an element to the stack
      @store_stack.push(el)
    end

    def pop
      # removes one element from the stack
      @store_stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @store_stack[-1]
    end
end

class Queue
    def initialize
        @store_stack = []
    end

    def enqueue(el)
        @store_stack.push(el)
    end

    def dequeue
        @store_stack.unshift(el)
    end

    def peek
        @store_stack[0]
    end
end

class Map
    attr_reader :my_map
    def initialize
        my_map = []
    end

    def set(key, value)
        @my_map << [key, value]
    end

    def get(key)
        my_map.each do |pair|
            return key if pair.include?(key)
        end
    end

    def delete(key)
        my_map.each do |pair|
            pair.shift if pair.include?(key)
        end
    end

    def show
        
    end
end