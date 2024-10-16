---
tags:
  - Проект 24/25
  - Программный проект
  - Системы эффектов
  - Инициативный
---

# Research plugin для direct-style вычислений в Scala с Kyo

[Upstream issue](https://github.com/getkyo/kyo/issues/211)

Kyo &mdash; новая библиотека для работы с алгебраическими эффектами в Scala. 
Она поддерживает как стандартный монадический стиль для комбинации эффектов, 
так и новый direct style. 

Например, монадический стиль, с использованием `map`

```scala
val fibMonadic: Unit < Routes = AtomicRef
  .init((0, 1, 1))
  .map(state =>
    Routes.add(_.get.in("fib").out(stringBody)): _ =>
      state
        .updateAndGet((_, b, c) => (b, c, b + c))
        .map((a, _, _) => a.toString)
  )
```

В настоящее время переводится в следующий код с использованием direct style

```scala
val fib: Unit < Routes = defer:
  val state = await(AtomicRef.init[(Int, Int, Int)]((0, 1, 1)))
  await(
    Routes.add(
      _.get.in("fib").out(stringBody)
    ): _ =>
      defer:
        val (a, _, _) = 
          await(state.updateAndGet((_, b, c) => (b, c, b + c)))
        a.toString
  )
```

Видно, что в данном коде много лишних выражений, использование которых обусловлено
текущими ограничениями языка. Предлагается ввести новое ключевое слово `pure`, 
при помощи которого возможно будет аннотировать функции, классы и их конструкторы,
таким образом, что внутри аннотированного кода нельзя будет использовать impure
конструкты языка, такие как `var`, `try`, `throw` и подобные, а также изменять 
поведение типов с эффектами таким образом, что вместо типа эффекта при вызове
функций и методов будет использоваться итоговый тип, например:

```scala
pure def x: Int < IO = IO(3).map(_ + 3)
```

вызовет ошибку компиляции, так как тип `Int`, являющийся итоговым типом pending типа
`Int < IO`, являющимся типом выражения `IO(3)`, не имеет функции `map`. С другой стороны,
код 

```scala
pure def x: Int < IO = IO(3) + 3
```

скомпилируется и при вычислении получится 6. Исходный пример будет выглядеть примерно
так:

```scala
pure def fib: Unit < Routes =
  val state = AtomicRef.init[(Int, Int, Int)]((0, 1, 1))
  Routes.add(
    _.get.in("fib").out(stringBody)
  ): _ =>
    val (a, _, _) = 
      state.updateAndGet((_, b, c) => (b, c, b + c))
      a.toString
```

Что не отличается от императивной версии того же кода, при этом сохраняя информацию
об используемых эффектах

Итогом проекта должен являться готовый research plugin, имплементирующий 
большую часть вышеописанной функциональности. 
Работы очень много, в одиночку не управиться, поэтому на этот проект ищется 
команда заинтересованных людей