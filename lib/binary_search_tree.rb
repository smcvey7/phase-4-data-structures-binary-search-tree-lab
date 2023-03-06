require_relative './node'
require 'pry'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    if root.nil?
      return nil
    end
    node = root
    response = nil
    while node.value != value
      node = value > node.value ? node.right : node.left

      if node.nil?
        return nil
      end

      if node.value == value
        response = node
      end
    end
    response
  end

  def insert(value)
    if search(value)
      return nil
    end

    node = Node.new(value)

    if root.nil?
      @root = node
      return node
    end

    check = @root
    check_next = value > root.value ? root.right : root.left

    while check_next != nil
      check = check_next
      check_next = helper(check_next, value)
    end

    if value > check.value
      return check.right
    else
      return check.left
    end
  end

  def helper(check, value)
    if value > check.value
      return check.right
    else
      return check.left
    end
  end

end 
