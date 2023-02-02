defmodule Secrets do
  import Bitwise

  def secret_add(secret) do
    fn addend -> addend + secret end
  end

  def secret_subtract(secret) do
    fn subtrahend -> subtrahend - secret end
  end

  def secret_multiply(secret) do
    fn factor -> factor * secret end
  end

  def secret_divide(secret) do
    fn dividend -> div(dividend, secret) end
  end

  def secret_and(secret) do
    fn operand -> operand &&& secret end
  end

  def secret_xor(secret) do
    fn operand -> operand ^^^ secret end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn operand -> secret_function2.(secret_function1.(operand)) end
  end
end
