def merge_sort(n, merged_array = [])
  if n.length == 1
    return n
  else
    half = (n.length / 2).ceil
    first_half = n.slice(0, half)
    second_half = n.slice(half, n.length - half)

    sorted_first_half = merge_sort(first_half)
    sorted_second_half = merge_sort(second_half)

    while !sorted_first_half.empty? && !sorted_second_half.empty?
      if sorted_first_half.first <= sorted_second_half.first
        merged_array.push(sorted_first_half.shift)
      else
        merged_array.push(sorted_second_half.shift)
      end
    end
    merged_array.concat(sorted_first_half) unless sorted_first_half.empty?
    merged_array.concat(sorted_second_half) unless sorted_second_half.empty?

    return merged_array
  end
end

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
