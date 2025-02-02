function solovay_strassen(number)
  if number < 5
    return "Invalid"
  end

  base = rand(2:number-2)

  power = powermod(base, (number - 1) ÷ 2, number)
  if power != 1 && power != number - 1
    return "$number`s composite."
  end
  jacobi = jacobi_symbol(base, number)
  if power == jacobi
    return "$number`s composite."
  else
    return "$number`s probably prime."
  end

end

println(solovay_strassen(12345))