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

  def tail
    if size == 0
      nil
    elsif size == 1
      @head
    else
      cursor = @head
      cursor = cursor.next_node until cursor.next_node.nil?
      cursor
    end
  end

  def at(index)
    case index
    when 0
      @head
    when -1
      tail
    else
      cursor = @head
      index.times { cursor = cursor.next_node }
      cursor
    end
  end

  def pop
    to_delete = tail

    new_tail = @head
    new_tail = new_tail.next_node until new_tail.next_node == to_delete

    new_tail.next_node = nil
  end

  def contains?(value)
    cursor = @head
    until cursor.nil?
      return true if cursor.value == value

      cursor = cursor.next_node
    end
    false
  end

  def find(value)
    i = 0
    cursor = @head
    until cursor.nil?
      return i if cursor.value == value

      cursor = cursor.next_node
      i += 1
    end
    nil
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
