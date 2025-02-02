function cipher_vigenere(msg::String, secret::String)
  alpha_range = 'a':'z'
  result_text = ""
  pos_in_key = 1

  for char in msg
    if isletter(char)
      shift = findfirst(==(secret[pos_in_key]), alpha_range) - 1
      char_pos = findfirst(==(char), alpha_range) + shift
      char_pos > 26 && (char_pos -= 26)
      result_text *= alpha_range[char_pos]
      pos_in_key += 1
      pos_in_key > length(secret) && (pos_in_key = 1)
    else
      result_text *= char
    end
  end

  return result_text
end

msg="hello"
secret="key"

println(cipher_vigenere(msg, secret))