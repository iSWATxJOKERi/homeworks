class GraphNode
    attr_reader :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(more)
        @neighbors = more
    end

end

def bfs(starting_node, target_value, visited = Set.new)
    queue = [starting_node]
    while !queue.empty?
        first = queue.shift
        if first.value == target_value
            return first.value
        end
        queue.concat(first.neighbors)
    end
    return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "f")