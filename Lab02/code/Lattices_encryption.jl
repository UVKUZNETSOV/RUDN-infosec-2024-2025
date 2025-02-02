function rot90(matrix::Array{T,2}) where {T}
  return [matrix[j, end-i+1] for i in 1:size(matrix, 1), j in 1:size(matrix, 2)]
end

function encrypt_with_rails(input_text::String, cipher_key::String, matrix_dim::Int)
  base_matrix = fill("", matrix_dim, matrix_dim)
  encryption_matrix = fill("", 2 * matrix_dim, 2 * matrix_dim)
  char_sequence = 1
  result_text = ""
  sanitized_text = replace(input_text, " " => "")

  for i in 1:matrix_dim, j in 1:matrix_dim
    base_matrix[i, j] = string(char_sequence)
    encryption_matrix[i, j] = string(char_sequence)
    char_sequence += 1
  end

  for row in 1:(2*matrix_dim)
    for col in (2*matrix_dim):-1:1
      if encryption_matrix[row, col] == ""
        base_matrix = rot90(base_matrix)
        for i in 0:(matrix_dim-1), j in 0:(matrix_dim-1)
          encryption_matrix[row+i, col-j] = base_matrix[matrix_dim-i, matrix_dim-j]
        end
      end
    end
  end

  char_sequence = 1
  used_positions = String[]
  for char in sanitized_text
    placed = false
    for i in 1:(2*matrix_dim), j in 1:(2*matrix_dim)
      if encryption_matrix[i, j] == string(char_sequence) && !placed
        position_key = string(i, ",", j)
        if !(position_key in used_positions)
          encryption_matrix[i, j] = string(char)
          push!(used_positions, position_key)
          placed = true
        end
      end
    end
    char_sequence += 1
    if char_sequence > matrix_dim^2
      char_sequence = 1
      empty!(used_positions)
    end
  end

  sorted_key = sort(collect(cipher_key))
  for key_char in sorted_key
    column_index = findfirst(==(key_char), cipher_key)
    for row in 1:(2*matrix_dim)
      cell = encryption_matrix[row, column_index]
      result_text *= cell != "" ? cell : " "
    end
  end

  return result_text
end

text="word"
key="key"
matrix_size = 2

println(encrypt_with_rails(text, key, matrix_size))