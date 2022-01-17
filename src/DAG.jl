using DataStructures, NamedArrays, DataFrames
import Base.show

SymbolList = Union{Symbol, Vector{Symbol}}
SymbolListOrNothing = Union{SymbolList, Nothing}
OrderedDictOrNothing = Union{OrderedDict, Nothing}
NamedArrayOrNothing = Union{NamedArray, Nothing}
DataFrameOrNothing = Union{DataFrame, Nothing}
ModelDefinition = Union{OrderedDict, AbstractString, NamedArray}

mutable struct DAG
  name::AbstractString
  d::OrderedDictOrNothing                    # Name of DAG
  s::NamedArrayOrNothing                     # Covariance matrix as NamedArray
  df::DataFrameOrNothing                     # DataFrame with variables
  vars::Vector{Symbol}                       # Names of variables in DAG
end

function dag_vars(d::OrderedDict)
  vars = Symbol[]
  for var in keys(d)
    if isnothing(var)
      @warn "LHS can't be an empty set: $var."
    elseif typeof(var) == Symbol
      append!(vars, [var])
      handle_rhs!(vars, d[var])
    elseif typeof(var) == Vector{Symbol}
      append!(vars, var)
      handle_rhs!(vars, d[var])
    end
  end
  unique(vars)
end

function handle_rhs!(vars::Vector{Symbol}, rhs::SymbolList)
  if isnothing(var)
    append!(vars, [])
  elseif typeof(rhs) == Symbol
    append!(vars, [rhs])
  elseif typeof(rhs) == Vector{Symbol}
    append!(vars, rhs)
  end
end

function DAG(name::AbstractString, model::ModelDefinition; df::DataFrameOrNothing=nothing)

  local d
  if typeof(model) <: OrderedDict
    d = model
  end    

  vars = dag_vars(d)

  if isnothing(df)
    s = nothing
  else
    # Compute covariance matrix and store as NamedArray
    @assert length(names(df)) == length(vars) "DataFrame has different number of columns"
    s = NamedArray(cov(Array(df)), (names(df), names(df)), ("Rows", "Cols"))
  end

  # Create object

  DAG(name, d, s, df, vars)

end

function dag_show(io::IO, d::DAG)
  println("\nDAG object:\n")
  println(io, "name = \"$(d.name)\"")
  println(io, "vars = $(d.vars)")
  println()
  !isnothing(d.d) && display(d.d)
  println()
end

show(io::IO, d::DAG) = dag_show(io, d)

export
    DAG