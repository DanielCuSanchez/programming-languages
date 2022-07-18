# HW_05-Elixir_lists
# Daniel Cu Sánchez - A01703613
# 18/07/2022

defmodule Hw.Lists
#Init module Lists
do
  # 1) swapper: Takes a list, and two elements A and B as arguments. It will return a new list with any appearance of A substituted for B, and vice versa. Any other elements are kept in the same place
  def swapper(list, first, second), do: swapper_help(list, first, second,[])
  #If list empty, return result
  defp swapper_help([], _first, _second, result),
    do: result
  #In other hand this changes the first element for the second element in list
  defp swapper_help([head | tail], first, second, result) when head == first,
    do: swapper_help(tail, first, second, result ++ [second])
  #Third case the second element is changed by the first element
  defp swapper_help([head | tail], first, second, result) when head == second,
    do: swapper_help(tail, first, second, result ++ [first])
  # Last case this do not anything
  defp swapper_help([head | tail], first, second, result),
    do: swapper_help(tail, first, second, result ++ [head])



  # 2) invert_pairs: Takes a list of tuples as argument. All tuples must have only two elements. Returns a new list of tuples, where each tuple has the elements in inverse order:
  def invert_pairs(list), do: invert_pairs(list, [])
  defp invert_tuple({a,b}), do: {b,a}
  #If the list is empty, return result
  defp invert_pairs([], result),
    do: result
  defp invert_pairs([head | tail], result),
    do: invert_pairs(tail, result ++ [invert_tuple(head)])



  # 3) deep_reverse: Takes a list as arguments. The list may contain nested lists. It will return another list, where the elements are in reverse order. The elements in any nested list must also reverse their order. You can NOT use the built in function for reverse:
  def deep_reverse(list), do: deep_reverse_help(list, [])
  #If the list is empty, return result
  defp deep_reverse_help([], result),
    do: result
  #Reverse the elements on the nested list
  defp deep_reverse_help([head | tail], result) when is_list(head),
    do: deep_reverse_help(tail, [deep_reverse(head) | result])
  #Reverse the elements on the list
  defp deep_reverse_help([head | tail], result),
    do: deep_reverse_help(tail, [head | result])



  # 4) mean: Takes a list of numbers as argument. Computes the average of its values, as the sum of all of them divided by the number of elements in the list
  def mean(list), do: mean_help(list, 0, 0)
  #If the list starts empty
  defp mean_help([], 0, 0),
    do: 0
  # End of list case
  defp mean_help([], result, counter),
    do: result/counter#Returns the mean
  # Appliying recursion
  defp mean_help([head | tail], result, counter),
  #countering the elements by adding 1 to counter
    do: mean_help(tail, head + result, counter + 1)


  # 5) std_dev: Takes a list of numbers as argument. Computes the standard deviation, using the following formula:
  def sum([]),
    do: 0
  def sum([head | tail]),
    do: head + sum(tail)
  # The basic case, list empty
  def std_dev([]),
    do: 0
  def std_dev(list)
    do
      numE = Enum.count(list)
      # Getting total of elements from list
      mean = mean(list)
      #Calulating the mean
      total = :math.sqrt(sum(Enum.map(list, fn x -> (x - mean) * (x - mean) end))/numE)
      # Returning the result
      total
    end
end
