def range(start, finish)
  return [finish] if start == finish
  range = [start] + range(start + 1, finish)
end

def iter_sum(arr)
  total = 0
  arr.each { |num| total += num }
  total
end

def rec_sum(arr)
  return 0 if arr.empty?
  total = arr[0] + rec_sum(arr[1..-1])
end

def rec_exp1(num, power)
  return 1 if power == 0
  num * rec_exp1(num, power - 1)
end

def rec_exp2(num, power)
  return 1 if power == 0
  return num if power == 1
  if power % 2 == 0
    rec_exp2(num, power / 2) ** 2
  else
    num * (rec_exp2(num, (power - 1) / 2) ** 2)
  end
end

def deep_dup(arr)
  duped_arr = []
  arr.each do |el|
    duped_arr << (el.is_a?(Array) ? deep_dup(el) : el)
  end
  duped_arr
end

def iter_fibs(num)
  return [] if num == 0
  return [0] if num == 1
  fibs = [0, 1]
  while fibs.length < num
    fibs << (fibs[-1] + fibs[-2])
  end
  fibs
end

def rec_fibs(num)
  if num == 0
    []
  elsif num == 1
    [0]
  elsif num == 2
    [0, 1]
  else
    fibs = rec_fibs(num -1)
    fibs << fibs[-1] + fibs[-2]
  end
end

def binary_search(arr, target)
  return nil if arr.empty?
  probe = arr.length / 2
  if arr[probe] == target
    probe
  elsif arr[probe] > target
    binary_search(arr[0...probe], target)
  else
    right_search = binary_search(arr[probe + 1..-1], target)
    right_search.nil? ? nil : (probe + 1 + right_search)
  end
end

def make_change(amount, currency = [25, 10, 5, 1])
  currency = currency.sort.reverse
  return [] if (currency.empty? || amount < currency.last)
  best_change = nil
  
  currency.each_with_index do |coin, index|
    next if coin > amount
    remainder = amount - coin
    remainder_change = make_change(remainder, currency[index..-1])
    current_change = [coin] + remainder_change
    
    if (best_change.nil? || (current_change.length < best_change.length))
      best_change = current_change
    end
  end
  best_change
end

def merge_sort(arr)
  return arr if arr.length < 2
  mid = arr.length / 2
  left, right = arr[0...mid], arr[mid..-1]
  sort_left, sort_right = merge_sort(left), merge_sort(right)
  merge(sort_left, sort_right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first < right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end
  merged + left + right
end

def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr[0...-1])
  subs + subs.map { |sub| sub + [arr.last] }
end