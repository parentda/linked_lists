require_relative 'node'

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if @size.zero?
      @head = Node.new(value)
      @tail = @head
    else
      node = Node.new(value)
      @tail.next_node = node
      @tail = node
    end
    @size += 1
    to_s
  end

  def prepend(value)
    if @size.zero?
      @head = Node.new(value)
      @tail = @head
    else
      node = Node.new(value, @head)
      @head = node
    end
    @size += 1
    to_s
  end

  def at(index)
    return unless index.between?(0, @size - 1)

    node = @head
    index.times { node = node.next_node }
    node
  end

  def pop
    return if @size.zero?

    last_value = @tail.value
    @tail = at(@size - 2)
    @tail.next_node = nil
    @size -= 1
    to_s
    last_value
  end

  def contains?(value)
    return false if @size.zero?

    node = @head
    @size.times do
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    return if @size.zero?

    node = @head
    @size.times do |number|
      return number if node.value == value

      node = node.next_node
    end
    nil
  end

  def to_s
    formatted_list = ''
    node = @head
    @size.times do
      formatted_list << "( #{node.value} ) -> "

      node = node.next_node
    end
    puts formatted_list << 'nil'
  end

  def insert_at(value, index)
    return puts 'Error: index out of range' unless index.between?(0, @size)
    return prepend(value) if index.zero?
    return append(value) if index == @size

    prev_node = at(index - 1)
    curr_node = Node.new(value, prev_node.next_node)
    prev_node.next_node = curr_node
    @size += 1
    to_s
  end

  def remove_at(index)
    return puts 'Error: index out of range' unless index.between?(0, @size - 1)

    if index.zero?
      @head = at(index + 1)
      @tail = @head if @size == 1
    else
      prev_node = at(index - 1)
      next_node = at(index + 1)
      prev_node.next_node = next_node
      @tail = prev_node if index == @size - 1
    end
    @size -= 1
    to_s
  end
end

@list = LinkedList.new
num = 5
num.times { |number| @list.append(number) }
