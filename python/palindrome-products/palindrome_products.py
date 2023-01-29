import operator


def is_palindrome(n) -> bool:
    digits = str(n)
    return digits == digits[::-1]


def largest(min_factor, max_factor):
    """Given a range of numbers, find the largest palindromes which
       are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
        Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    return palindromes(range(max_factor, min_factor - 1, -1), operator.gt)


def smallest(min_factor, max_factor):
    """Given a range of numbers, find the smallest palindromes which
    are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
        Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    return palindromes(range(min_factor, max_factor + 1, +1), operator.lt)


def palindromes(range, comparator):
    if (range.start < range.stop - range.step) != (range.step > 0):
        raise ValueError("min must be <= max")

    best, factors = None, []

    for left in range:
        improved = False
        for right in range:
            product = left * right
            if best is None or product == best or comparator(product, best):
                improved = True
                if is_palindrome(product):
                    if best is None or comparator(product, best):
                        factors = []
                        best = product
                    factors.append([left, right])
        if not improved:
            break

    return (best, factors)
