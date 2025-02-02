
---
## Front matter
title: "ЛАБОРАТОРНАЯ РАБОТА №3"
subtitle: "Шифрование Гаммированием"
author: "Кузнецов Юрий Владимирович"

## Generic options
lang: ru-RU
toc-title: "Содержание"

## PDF output format
toc-depth: 2
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt

## I18n
polyglossia-lang:
  name: russian
  options:
    - spelling=modern
    - babelshorthands=true
polyglossia-otherlangs:
  name: english

## Fonts
mainfont: Noto Serif
romanfont: Noto Serif
sansfont: Noto Sans
monofont: Noto Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9

---

# Введение

В данном отчёте будет представлена реализация шифрования Гаммированием

# Основное содержание

## Шифрование Гаммированием:

- Шифрование Гаммированием

# Кодовая реализация

## Шифрование Гаммированием

```julia
function finiteGammaEncoding(text::String, gamma_code::String, isToBeEncoded::Bool)
  alphabet = vcat(1040:1045, 1025, 1046:1071, 32:33, 44, 46, 63, 1072:1077, 1105, 1078:1103)

  filt_text = filter(x -> findfirst(isequal(Int(x)), alphabet) != nothing, text)
  separated_text = Int.(collect(filt_text))
  n = length(separated_text)

  t_nums = [findfirst(isequal(separated_text[i]), alphabet) for i in 1:n]

  for i in 1:n
      if t_nums[i] > 38
          t_nums[i] -= 38
      end
  end

  println(join(Char.([alphabet[t_nums[i]] for i in 1:n])))

  g_nums = [findfirst(isequal(Int(c)), alphabet) for c in collect(gamma_code)]
  m = length(g_nums)
```

## Шифрование Гаммированием

```julia
  if isToBeEncoded
      encoded_nums = [alphabet[mod(t_nums[i] + g_nums[mod(i-1, m)+1] - 1, 38) + 1] for i in 1:n]
  else
      encoded_nums = [alphabet[mod(t_nums[i] - g_nums[mod(i-1, m)+1] - 1, 38) + 1] for i in 1:n]
  end

  encoded_text = join(Char.(encoded_nums))
  return encoded_text
end

coded_text = finiteGammaEncoding("слово", "ПАРОЛЬ", true)
println(coded_text)

println()

decoded_text = finiteGammaEncoding(coded_text, "ПАРОЛЬ", false)
println(decoded_text)
```

# Заключение

В данной лабораторной работе было реализовано шифрование Гаммированием