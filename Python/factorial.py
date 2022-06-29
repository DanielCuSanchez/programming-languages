"""
Implementations of the factorial function using iteration
and recursion

Daniel Cu Sánchez
A01703613
"""

def factorial_iteration(n):
    result = 1
    while n > 0:
      result = result * n
      n = n - 1
    return result

print("Iteration: ",factorial_iteration(5))


def factorial_recursive(n):
    if n < 1:
      return 1
    else:
      return n * factorial_recursive(n - 1)

print("Recursive: ",factorial_recursive(5))

