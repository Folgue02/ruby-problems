<<EXERCISE
  Given the head of a linked list head, in which each node contains an integer value.

  Between every pair of adjacent nodes, insert a new node with a value equal to the 
  greatest common divisor of them.

  Return the linked list after insertion.

  The greatest common divisor of two numbers is the largest positive integer that evenly
  divides both numbers.
EXERCISE

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.of_array(array)
    head = ListNode.new
    curr_node = head

    array.each.with_index do |num, n_index|
      curr_node.val = num
      new_node = ListNode.new
      
      break if n_index == array.length - 1

      curr_node.next = new_node
      curr_node = new_node
    end

    head
  end

  def ==(other)
    @val == other.val && @next == other.next
  end

  def to_s
    "VAL: #{@val}, NEXT: (#{@next})"
  end
end

# @param {ListNode} head
# @return {ListNode}
def insert_greatest_common_divisors(head)
  curr_node = head
  result = [curr_node.val]

  while !curr_node.nil?
    break if curr_node.next.nil?
    result << curr_node.val.gcd(curr_node.next.val)
    result << curr_node.next.val
    
    curr_node = curr_node.next
  end

  result
end
