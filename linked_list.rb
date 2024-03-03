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

  def prepend(value)
    if head.nil?
      @head = Node.new(value)
    else
      new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    if head.nil?
      0
    else
      i = 1
      cursor = @head
      until cursor.next_node.nil?
        cursor = cursor.next_node
        i += 1
      end
      i
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

list = LinkedList.new
list.prepend(3)
list.prepend(2)
list.append(4)

p list.size
