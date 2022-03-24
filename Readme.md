# Reveal Julia Expressions

```console
julia> using RevealExpr
REPL mode ExprReveal_mode initialized. Press ) to enter and backspace to exit.

julia> x = 7
7

Expr> 3 * $x
Expr
  head: Symbol call
  args: Array{Any}((3,))
    1: Symbol *
    2: Int64 3
    3: Expr
      head: Symbol $
      args: Array{Any}((1,))
        1: Symbol x
quote
    3 * 7
end

Expr> 3 * $x x y
Expr
  head: Symbol call
  args: Array{Any}((3,))
    1: Symbol *
    2: Int64 3
    3: Expr
      head: Symbol $
      args: Array{Any}((1,))
        1: Symbol x
Symbol x
Symbol y
quote
    3 * 7
    x
    y
end

Expr>
```
