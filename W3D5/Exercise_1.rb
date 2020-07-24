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