function miller_rabin(number)
  if number < 5
      return "Invalid"
  end
  remainder = number - 1
  power = 0
  while remainder % 2 == 0
      power += 1
      remainder ÷= 2
  end
  base = rand(2:number-2)
  current = powermod(base, remainder, number)
  if current != 1 && current != number-1
      for _ in 1:power-1
          current = (current^2) % number
          if current == 1
              return "$number`s composite."
          end
      end
      if current != number-1
          return "$number`s composite."
      end
  end
  return "$number`s simple."
end

println(miller_rabin(12349))