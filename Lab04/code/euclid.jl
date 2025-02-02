a, b = 13345, 54321
println(a, " ", b)

function euclid(a::Int, b::Int)::Int
  while a != 0 && b != 0
    if a >= b
      a %= b
    else
      b %= a
    end
  end
  return a != 0 ? a : b
end

println(euclid(a, b))

function euclid_bin(a::Int, b::Int)::Int
  g = 1
  while a % 2 == 0 && b % 2 == 0
    a ÷= 2
    b ÷= 2
    g *= 2
  end
  u, v = a, b
  while u != 0
    if u % 2 == 0
      u ÷= 2
    elseif v % 2 == 0
      v ÷= 2
    elseif u >= v
      u -= v
    else
      v -= u
    end
  end
  return g * v
end

println(euclid_bin(a, b))

function euclid_ext(a::Int, b::Int)::Tuple{Int,Int,Int}
  if a == 0
    return b, 0, 1
  else
    div, x, y = euclid_ext(b % a, a)
    return div, y - (b ÷ a) * x, x
  end
end

println(euclid_ext(a, b))

function euclid_bin_ext(a::Int, b::Int)::Tuple{Int,Int,Int}
  g = 1
  while a % 2 == 0 && b % 2 == 0
    a ÷= 2
    b ÷= 2
    g *= 2
  end
  u, v = a, b
  A, B, C, D = 1, 0, 0, 1
  while u != 0
    if u % 2 == 0
      u ÷= 2
      if A % 2 == 0 && B % 2 == 0
        A ÷= 2
        B ÷= 2
      else
        A = (A + b) ÷ 2
        B = (B - a) ÷ 2
      end
    elseif v % 2 == 0
      v ÷= 2
      if C % 2 == 0 && D % 2 == 0
        C ÷= 2
        D ÷= 2
      else
        C = (C + b) ÷ 2
        D = (D - a) ÷ 2
      end
    elseif u >= v
      u -= v
      A -= C
      B -= D
    else
      v -= u
      C -= A
      D -= B
    end
  end
  return g * v, C, D
end

println(euclid_bin_ext(a, b))