class Node
  attr_accessor :position, :parent, :children

  def initialize(position, parent, children)
    @position = position
    @parent = parent
    @children = children
  end
end
