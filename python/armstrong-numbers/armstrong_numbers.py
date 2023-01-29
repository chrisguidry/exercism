def is_armstrong_number(number):
    digits = str(number)
    return sum((int(d) ** len(digits)) for d in digits) == number
