from collections import Counter
from functools import partial

# requirements functions


def any_combination(dice) -> bool:
    return True


def counts(pattern: set, dice) -> bool:
    return pattern.issubset(set(Counter(dice).values()))


def four_of_a_kind(dice) -> bool:
    by_count = {c: d for d, c in Counter(dice).items()}
    return 4 in by_count or 5 in by_count


def straight(starting: int, ending: int, dice) -> bool:
    return set(range(starting, ending + 1)).issubset(set(dice))


# scoring functions


def fixed(n, dice) -> int:
    return n


def n_times_count_of_n(n, dice) -> int:
    return sum(d for d in dice if d == n)


def sum_of_matching_four(dice) -> int:
    by_count = {c: d for d, c in Counter(dice).items()}
    return 4 * (by_count.get(4) or by_count.get(5))


# categories are a requirement function and a scoring function

YACHT = partial(counts, {5}), partial(fixed, 50)
ONES = any_combination, partial(n_times_count_of_n, 1)
TWOS = any_combination, partial(n_times_count_of_n, 2)
THREES = any_combination, partial(n_times_count_of_n, 3)
FOURS = any_combination, partial(n_times_count_of_n, 4)
FIVES = any_combination, partial(n_times_count_of_n, 5)
SIXES = any_combination, partial(n_times_count_of_n, 6)
FULL_HOUSE = partial(counts, {2, 3}), sum
FOUR_OF_A_KIND = four_of_a_kind, sum_of_matching_four
LITTLE_STRAIGHT = partial(straight, 1, 5), partial(fixed, 30)
BIG_STRAIGHT = partial(straight, 2, 6), partial(fixed, 30)
CHOICE = any_combination, sum


def score(dice, category):
    requirement, score = category
    if requirement(dice):
        return score(dice)
    return 0
