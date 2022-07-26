# HW_08-Concurrent_programs
# Daniel Cu Sánchez - A01703613
# 22/07/2022
# init program: iex Daniel_Cu_Sanchez_hw8.ex
# Hw.Primes.sum_primes(5000)
# Hw.Primes.sum_primes_parallel(5000)

defmodule Hw.Primes do

  # sum_primes, that receives a single argument, the top limit of the prime numbers to add. It will return the sum of all prime numbers between 2 and the limit provided. This function will work sequentially.
  def sum_primes(top_limit) do
    IO.puts("Secuencial THREAD")
    sum_primes_range(1,top_limit)
  end

  #A function called sum_primes_parallel, that takes two arguments: the limit of the prime numbers to add, and the number of threads to launch. It returns the sum of all prime numbers between 2 and limit, computed in parallel
  def sum_primes_parallel(until_number) do
    IO.puts("Parallel THREAD")
    cores = 12 #How many cores we're working with
    list_cores = Enum.to_list(1..cores) #Makes a list of [1,..,8]
    block = div(until_number, cores) #Creates a block
    limit_botton = for y <- list_cores do
      (y - 1) * block
    end
    limit_top = for x <- list_cores do
      if x == cores do
        until_number
      else
        (block * x)
      end
    end
    _result = 1..cores
      |> Enum.map(&Task.async(fn -> sum_primes_range(Enum.at(limit_botton, (&1 - 1)), Enum.at(limit_top, (&1 - 1))) end)) #We call the parallel prime function
      |> Enum.map(&Task.await(&1, 50000)) #Wait for each tasks to end
      |> Enum.sum() #Sum all the results to get the total
  end

  #A function called sum_primes_range, that takes two arguments: a lower limit and an upper limit, and returns the sum of all prime numbers between those limits. This function can be called from any of the 2 previous ones.
  def sum_primes_range(limit_bottom, limit_top) do
    list_numbers = Enum.to_list(limit_bottom..limit_top-1) #List with limits
    primes_list = for x <- list_numbers do
      if prime(x) do #Evaluate if its prime
        x
      else
        0
      end
    end
    _sum = Enum.sum(primes_list)
  end

  #Auxiliar function patter matching
  def prime(num)
    when num == 2 do #Number 2 is the first prime so we're adding a condition here
      _result = true
  end

  #Auxiliar function patter matching
  def prime(num) do
    limit_top = :math.sqrt(num) #Make the top limit the sqrt(num)
    limit_top = round(limit_top) #Round answer to create a list with bottom limit and top limit
    middle = Enum.to_list(2..limit_top) #Create a list with the limits per number
    limit_bottom = for x <- middle do #Check if the num is prime or not and make a list
      if x < 2 do #If num is less than two return false
          false
        else if rem(num, x) == 0 do #Check if the number is divisible by "x" number inside the range
          false #if the num is divisible by"x" we add a false to the list
        else
          true #Else we add a true to the list
        end
      end
    end

    if Enum.member?(limit_bottom, false) do #Check if the previous list indicates if "num" could be divided by a numer
      _result = false #If it has a false then the number isn't prime
    else
      _result = true #Else the number is prime
    end
  end

end