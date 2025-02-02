function fermat_test(number)
  if number < 5
      return "Invalid."
  end
  base = rand(2:number-2)
  result = powermod(base, number-1, number)
  if result == 1
      return "$number`s simple."
  else
      return "$number`s composite."
  end
end

println(fermat_test(234))