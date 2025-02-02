
---
## Front matter
title: "ЛАБОРАТОРНАЯ РАБОТА №5"
subtitle: "Вероятностные алгоритмы проверки чисел на простоту"
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

В данном отчёте будет представлена реализация вероятностных алгоритмов проверки чисел на простоту

# Основное содержание

## Шифры простой замены:

- Тест Ферма
- Символ Якоби
- Тест Соловэя-Штрассена
- Тест Миллера-Рабина

# Кодовая реализация

## Тест Ферма

```julia
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
```

## Символ Якоби

```julia
ffunction jacobi_symbol(a, n)
  if n < 3 || a >= n || a < 0
      return "Invalid"
  end
  result = 1
  while a != 0
      count = 0
      while a % 2 == 0
          count += 1
          a ÷= 2
      end

      if count % 2 == 1 && (n % 8 == 3 || n % 8 == 5)
          result *= -1
      end

      if n % 4 == 3 && a % 4 == 3
          result *= -1
      end

      a, n = n % a, a
  end
  return n == 1 ? result : 0
end

println(jacobi_symbol(23, 32))
```

## Тест Соловэя-Штрассена

```julia
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
```

## Тест Миллера-Рабина

```julia
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
```

# Заключение

В данной лабораторной работе были реализованы вероятностные алгоритмы проверки чисел на простоту