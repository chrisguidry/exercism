def steps(n):
    if n < 1:
        raise ValueError("Only positive integers are allowed")

    i = 0
    while n != 1:
        if n % 2 == 0:
            n = n / 2
        else:
            n = 3*n + 1
        i += 1

    return i




# Take any positive integer n.
# If n is even, divide n by 2 to get n / 2.
# If n is odd, multiply n by 3 and add 1 to get 3n + 1.
# Repeat the process indefinitely.
# The conjecture states that no matter which number you start with, you will always reach 1 eventually.

# Given a number n, return the number of steps required to reach 1.
