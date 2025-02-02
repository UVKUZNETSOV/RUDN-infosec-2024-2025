function ceasar(text, shift)
  alphabet = ['A': 'Z'; 'a': 'z']

  encrypted_text = Char[]

  for char in text
    if char in alphabet
      isUpper = isuppercase(char)
      base = isUpper ? 'A' : 'a'
      encrypted_char = base + ((char - base + shift) % 26)
      push!(encrypted_text, Char(encrypted_char))
    else 
      push!(encrypted_text, char)
    end
  end

  return String(encrypted_text)
end

println(uppercase(ceasar("Veni, vidi, vici", 3)))