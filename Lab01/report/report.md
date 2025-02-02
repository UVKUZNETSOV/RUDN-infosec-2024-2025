
---
## Front matter
title: "ЛАБОРАТОРНАЯ РАБОТА №1"
subtitle: "Шифры простой замены"
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

В данном отчёте будет представлена реализация шифров простой замены

# Основное содержание

## Шифры простой замены:

- Шифр Цезаря.
- Шифр Атбаш.

# Кодовая реализация

## Шифр Цезаря

```julia
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
```

## Шифр Атбаш.

```julia
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
```

# Заключение

В данной лабораторной работе были реализованы шифры простой замены (шифр Цезаря и шифр Атбаш)