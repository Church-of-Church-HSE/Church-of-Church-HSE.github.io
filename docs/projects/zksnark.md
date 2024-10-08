---
tags:
  - КР 24/25
  - ВКР 24/25
  - Исследовательский проект
  - Программный проект
  - zkSNARK
---

# Проект по zkSNARK

## Описание

[zkSNARK](https://z.cash/learn/what-are-zk-snarks/) &mdash; одно из новейших
изобретений криптографической науки. С их помощью можно:

* доказать обладание некоторой секретной информацией без её раскрытия;
* производить гомоморфные вычисления за разумное время;
* доказывать правильность вычислений, произведённых сторонним агентом, за
  сублинейное время.

Подобная технология открывает огромное количество возможностей. Среди прочего,
на тему их дизайна и практического применения можно написать множество курсовых
работ:

* По собственно изучению принципа работы доказательств с нулевым разглашением;
* По разработке нового протокола доказательств с нулевым разглашением;
* По дизайну распределённых систем, использующих нулевое разглашение;
* ...
* Проявите фантазию!

Принимаются инициативные темы.

См. также: [zkSNARK для Sanskrit](./sanskrit.md/#sanskrit-zksnark)

## Тестовое задание

### Задача 1

Алиса и Боб были друзьями с детства, но обстоятельства разлучили их. Однако они
договорились, что если судьба сведёт их снова, Алиса сможет узнать Боба по
коэффициентам многочлена $P \in \mathbb{Z}_p[x]$ достаточно большой степени $N$,
о которых они договорились заранее.

Шли года, и вот Алиса встретила красивого статного мужчину, отдалённо
напоминающего её друга из детства (назовём этого мужчину Боб II). Она хочет
убедиться, что это действительно Боб; помогите ей!

Предложите вероятностный алгоритм со следующими свойствами:

* Алгоритм задаёт протокол одностороннего общения между Алисой и Бобом II, в
  ходе которого Алиса может задавать вопросы Бобу II, а он &mdash; отвечать на
  них одним элементом $\mathbb{Z}_p$;
* Результатом работы алгоритма является ответ "да, это Боб" или
  "нет, это не Боб";
* Если это действительно Боб, алгоритм не ошибается;
* Если это не Боб, и Алиса задала $k$ вопросов, то вероятность ошибки составляет
  $O(1/p^k)$;
* Подслушивающий их Майк не сможет узнать ни одного коэффициента заветного
  многочлена ни при каких обстоятельствах, если $k \ll N$ (кроме как угадать).

### Задача 2

Будем говорить, что система из $m$ уравнений от $n+k+1$ переменной

\[
\left\{\begin{array}{l}
  p_1(x_1\ldots x_n, y, z_1\ldots z_k)=0,\\
  \ldots,\\
  p_m(x_1\ldots x_n, y, z_1\ldots z_k)=0.
\end{array}\right.
\]

_описывает_ функцию от $n$ переменных $f : \mathbb{Z}_p^n \to \mathbb{Z}_p$,
если

*   для любых $x_1\ldots x_n$ найдутся такие $z_1\ldots z_k$, что

    \[
      (x_1,\ldots,x_n,f(x_1,\ldots,x_n),z_1,\ldots,z_k)
    \]

    является решением системы, и

*   любое решение системы имеет вид

    \[
      (x_1,\ldots,x_n,f(x_1,\ldots,x_n), z_1,\ldots,z_k)
    \]

    для некоторых $\vec{x}$ и $\vec{z}$.

В данной задаче нас интересуют уравнения вида

\[
  axy + bx + cy + dz + e = 0,
\]

Где $a$, $b$, $c$, $d$, $e$ &mdash; произвольные коэффициенты из $\mathbb{Z}_p$,
а $x$, $y$, $z$ &mdash; произвольные переменные из
$\{x_1,\ldots,x_n,y,z_1,\ldots,z_k\}$.

1.  Какими системами можно описать следующие функции?

    \[
    \begin{array}{c}
      f(x_1, x_2) = x_1 + x_2;\\
      g(x_1, x_2) = x_1 x_2.
    \end{array}
    \]

    Постарайтесь обойтись как можно меньшим числом вспомогательных переменных и
    уравнений в системе.

2.  Описывает ли система $x y = 1$ следующую функцию?

    \[
      f(x) = \begin{cases}
        x^{-1}, &x\ne 0;\\
        0, &\text{иначе}.
      \end{cases}
    \]

    Почему нет? Постарайтесь придумать систему, которая опишет эту функцию.

3.  Какой системой можно описать следующую функцию?

    \[
      f(x_1, x_2) = \begin{cases}
        1, &x_1=x_2;\\
        0, &\text{иначе}.
     \end{cases}
    \]

    Постарайтесь обойтись как можно меньшим числом вспомогательных переменных и
    уравнений в системе.
