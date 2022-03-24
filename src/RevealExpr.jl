module RevealExpr

using REPL
using REPL.LineEdit

using ReplMaker


function __init__()

  function parse_multi(src::AbstractString)::Union{Missing,Vector{Any}}
    x = Meta.parse("@reveal " * src)
    if Meta.isexpr(x, :incomplete)
      return missing
    end
    @assert Meta.isexpr(x, :macrocall)
    xs = x.args[2:end]
    if length(xs) >= 1 && xs[1] isa LineNumberNode
      xs = xs[2:end]
    end
    return xs
  end

  function dump_expr_by_src(s)
    xs = parse_multi(s)
    for x in xs
      dump(x, maxdepth=30) # TODO: un-hardcode `maxdepth`?
    end
    # admit interpolation
    return Expr(:quote, Expr(:block, xs...))
  end

  function is_complete_julia(s)
    input = String(take!(copy(LineEdit.buffer(s))))
    return parse_multi(input) !== missing
  end

  initrepl(dump_expr_by_src,
    prompt_text="Expr> ",
    prompt_color=:blue,
    start_key=')',
    mode_name="ExprReveal_mode",
    valid_input_checker=is_complete_julia,
  )
end


end # module
