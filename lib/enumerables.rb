module Enumerable
  def my_each
    for i in self
      yield i
    end
  end

  def my_each_with_index
    counter = 0
    for i in self
      yield i, counter
      counter += 1
    end
  end

  def my_select
    return_array = []
    for i in self
      return_array.push i if yield i
    end
    return_array
  end

  def my_all?
    for i in self
      if not yield i
        return false
      end
    end

    return true
  end

  def my_any?
    for i in self
      if yield i
        return true
      end
    end
    return false
  end

  # def my_map
  #   return_array = []
  #   for i in self
  #     return_array.push yield i
  #   end
  #   return_array
  # end

  def my_inject result_memo
    return_result_memo = result_memo
    for i in self
      return_result_memo = yield(return_result_memo, i)
    end
    return_result_memo
  end

  def my_map a_proc = nil
    return_array = []
    if a_proc
      self.my_each { |i| return_array.push proc.call(i) }
    else
      self.my_each { |i| return_array.push yield i }
    end
    return_array
  end
  
  def multiply_els block
    block.my_inject(1) { |result_memo, object| result_memo * object } 
  end

end

a = []
[1,2,3].my_each{ |i| a << i + 1 }
p a