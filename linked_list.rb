require_relative 'node'

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if size.zero?
      @head = Node.new(value)
      @tail = @head
    else
      node = Node.new(value)
      @tail.next_node = node
      @tail = node
    end
    @size += 1
  end

  def prepend(value)
    if size.zero?
      @head = Node.new(value)
      @tail = @head
    else
      node = Node.new(value, @head)
      @head = node
    end
    @size += 1
  end

  def at(index); end

  def pop; end

  def contains?(value); end

  def find(value); end

  def to_s; end

  def insert_at(value, index); end

  def remove_at(value, index); end
end
