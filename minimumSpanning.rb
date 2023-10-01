

def has_cycles(edge)
    node_one, node_two = edge[:from], edge[:to]
    @minimum_spanning_tree.each { |x| x[:explored] = false }
    cycle_between(node_one, node_two, @minimum_spanning_tree.dup)
  end
  
  def cycle_between(one, two, edges)
    adjacent_edges = edges.select { |edge| edge[:to] == one || edge[:from] == one}
    return false if adjacent_edges.empty?
    adjacent_edges.reject {|edge| edge[:explored] }.each do |edge|
      edge[:explored] = true
      other_node = (edge[:from] == one) ? edge[:to] : edge[:from]
      return true if other_node == two || cycle_between(other_node, two, edges)
    end
    false
  end