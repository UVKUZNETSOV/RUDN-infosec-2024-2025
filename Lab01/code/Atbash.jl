function atbash(message)
  alph_uppercase = ['A':'Z';]
  alph_lowercase = ['a':'z';]

  str = Char[]

  for letter in message
    if letter in alph_uppercase
      index = findfirst(x -> x == letter, alph_uppercase)
      push!(str, alph_uppercase[end - index + 1])
    elseif letter in alph_lowercase
      index = findfirst(x -> x == letter, alph_lowercase)
      push!(str, alph_lowercase[end - index + 1])
    else
      push!(str, letter)
    end
  end

  return String(str)
end

println(atbash("Hello, world!"))