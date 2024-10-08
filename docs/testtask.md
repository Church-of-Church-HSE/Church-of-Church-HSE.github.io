---
hide:
  - navigation
tags:
  - Программный проект
---

# Тестовое задание для программных проектов

## Задача 1

Напишите мини-библиотеку для работы с многочленами от одной переменной.
Она должна поддерживать следующие операции:

* [ ] Построение многочлена по его выражению, записанному внутри языка (это не
    задача про парсеры). Например, по выражению

    \[
        1+3x^2-x+8
    \]

    должен быть создан многочлен с коэффициентами $9$,$-1$,$3$ при степенях
    $x^0$,$x^1$,$x^2$ соответственно.

* [ ] Алгебраические операции над многочленами:

    - [ ] константный многочлен
    - [ ] прибавление константы
    - [ ] сложение многочленов
    - [ ] нулевой многочлен
    - [ ] вычитание константы
    - [ ] вычитание многочленов
    - [ ] отрицание многочлена
    - [ ] умножение на константу
    - [ ] умножение на другой многочлен
    - [ ] единичный многочлен
    - [ ] возведение многочлена в натуральную степень

* [ ] Подстановка одного многочлена в другой, вычисление многочлена в заданной
    точке, вычисление многочлена при подстановке квадратной матрицы
    (представление матриц, как и представление многочленов, на Ваше усмотрение).

* [ ] Операция "уборки мусора", приводящая многочлен к максимально компактной
    форме.

Принимаются любые корректные решения, на любом языке программирования, главное
чтобы я мог проверить решение на своём устройстве (Arch Linux).

Плюсом будет, если:

* Решение пишется на том же языке, на котором будет решаться курсовая;
* В решении выдержан определённый стиль оформления;
* Решение также содержит автоматические тесты и документацию;
* Код переиспользуется для получения более простой, краткой, читаемой и
  поддерживаемой реализации;
* При создании многочлена по выражению не используется метапрограммирование;
* Решение можно переиспользовать с различными типами коэффициентов
  (натуральные? целые? рациональные? матрицы?);
* Решение можно переиспользовать с пользовательскими типами коэффициентов,
  не фиксированными заранее;
* Недопустимость операций (например, отрицание многочлена с натуральными
  коэффициентами) сообщается пользователю как можно раньше
  (например, на этапе компиляции);
* При конструировании многочлена с помощью лямбда-выражения, аргумент $x$ не
  поддерживает иных операций, кроме присущих всем объектам выбранного языка и
  кроме необходимых для построения многочленов
  (т.е. его нельзя использовать не по назначению).

## Задача 2*

Всё то же самое, но для многочленов с несколькими переменными. Вдобавок к
вышеозвученным плюсикам в карму, плюсом будет, если:

* Решение можно переиспользовать с различными типами переменных (символы?
  строки? натуральные числа? числа от $1$ до $n$? тип из одного элемента?);
* В многочлены с переменными одного типа $X$ можно подставлять многочлены с
  переменными другого типа $Y$ (в результате должны получаться многочлены с
  переменными типа $Y$).
* При использовании правильного типа переменных, многочлены с несколькими
  переменными вырождаются в многочлены от одной переменной (т.е. для них можно
  выписать то же самое API, что для многочленов от одной переменной).
* Алгебраические операции доступны при использовании произвольного типа
  переменных (хоть пусть переменные являются функциями). При этом, операция
  "уборки мусора" может предъявлять дополнительные требования к используемому
  типу переменных.
