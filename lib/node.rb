class Node
  attr_accessor :value, :parent, :children

  def initialize(value, parent, children)
    @value = value
    @parent = parent
    @children = children
  end
end
