def triangle(sides):
    a, b, c = sides
    return all((
        a > 0,
        b > 0,
        c > 0,
        (a + b >= c),
        (a + c >= b),
        (b + c >= a)
    ))

def equilateral(sides):
    return triangle(sides) and len(set(sides)) == 1


def isosceles(sides):
    return triangle(sides) and len(set(sides)) <= 2


def scalene(sides):
    return triangle(sides) and len(set(sides)) == 3
