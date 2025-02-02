alph = [
    "а", "б", "в", "г", "д", "е", "ж", "з", "и", "к", 
    "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", 
    "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"
]

str = "нельзя недооценивать противника"
password = "пароль"
dimension = (m = 5, n = 6)

function matrixify(str, dimension)
    matr = replace(str, " " => "")  
    matr_chars = collect(matr)  
    res = Vector{Vector{Char}}(undef, dimension.m)  
    counter = 1

    for i in 1:dimension.m
        res[i] = matr_chars[counter:min(counter + dimension.n - 1, end)]
        counter += dimension.n
    end

    return res
end

function matrixFill(matrix, dimension)
    
    while length(matrix[end]) < dimension.n
        push!(matrix[end], 'а')
    end

    return matrix
end

function pushindex(str, alph)
  indexes = Int[]
  for ch in collect(str)  
      index = findfirst(==(string(ch)), alph)  
      if index !== nothing
          push!(indexes, index)
      end
  end
  return indexes
end

function result(arr, indexes, dimension)
    result_str = ""
    map = sort([Dict(:item => indexes[i], :key => i) for i in 1:length(indexes)], 
               by = x -> x[:item])

    print(map)

    for i in 1:dimension.n
        counter = map[i][:key]
        for j in 1:dimension.m
            char = arr[j][counter]
            result_str *= string(char)  
        end
    end

    return uppercase(result_str)
end

matrix = matrixFill(matrixify(str, dimension), dimension)
indexes = pushindex(password, alph)
result_str = result(matrix, indexes, dimension)

println(result_str)