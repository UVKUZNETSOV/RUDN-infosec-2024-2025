function jacobi_symbol(a, n)
  if n < 3 || a >= n || a < 0
      return "Invalid"
  end
  result = 1
  while a != 0
      count = 0
      while a % 2 == 0
          count += 1
          a ÷= 2
      end

      if count % 2 == 1 && (n % 8 == 3 || n % 8 == 5)
          result *= -1
      end

      if n % 4 == 3 && a % 4 == 3
          result *= -1
      end

      a, n = n % a, a
  end
  return n == 1 ? result : 0
end

println(jacobi_symbol(23, 32))