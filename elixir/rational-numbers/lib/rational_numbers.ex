defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(r1 :: rational, r2 :: rational) :: rational
  def add({a1, b1}, {a2, b2}) do
    reduce({(a1 * b2) + (a2 * b1), b1 * b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(r1 :: rational, r2 :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    reduce({(a1 * b2) - (a2 * b1), b1 * b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(r1 :: rational, r2 :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    reduce({a1 * a2, b1 * b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) when a2 != 0 do
    reduce({a1 * b2, a2 * b1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    reduce({Kernel.abs(a), Kernel.abs(b)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(r :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n >= 0 do
    reduce({Integer.pow(a, n), Integer.pow(b, n)})
  end
  def pow_rational({a, b}, n) when n < 0 do
    reduce({Integer.pow(b, -n), Integer.pow(a, -n)})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, r :: rational) :: float
  def pow_real(x, {a, b}) do
    Float.pow(1.0 * x, a/b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(r :: rational) :: rational
  def reduce({a, _b}) when a==0 do
    {0, 1}
  end
  def reduce({a, b}) when b>=0 do
    g = Integer.gcd(a, b)
    {a/g, b/g}
  end
  def reduce({a, b}) when b<0 do
    g = Integer.gcd(a, b)
    {-a/g, -b/g}
  end
end
