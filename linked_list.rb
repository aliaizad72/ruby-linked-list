# frozen_string_literal: true

# class LinkedList; contains the whole list
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      @head = Node.new(value)
    else
      cursor = @head
      cursor = cursor.next_node until cursor.next_node.nil?
      cursor.next_node = Node.new(value)
    end
  end
end

# class Node that contains a value and a link
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
