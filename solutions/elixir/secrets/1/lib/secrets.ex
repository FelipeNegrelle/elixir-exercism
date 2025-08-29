defmodule Secrets do
  def secret_add(secret) do
    fn s -> s + secret end
  end

  def secret_subtract(secret) do
    fn s -> s - secret end
  end

  def secret_multiply(secret) do
    fn s -> s * secret end
  end

  def secret_divide(secret) do
    fn s -> if(secret != 0) do trunc(s/secret) else {:error, "You can't divide by 0"} end end
  end

  def secret_and(secret) do
    fn s -> Bitwise.band(s, secret) end
  end

  def secret_xor(secret) do
    fn s -> Bitwise.bxor(s, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn s -> 
      s = secret_function1.(s)
      s = secret_function2.(s)
      s
    end
  end
end
