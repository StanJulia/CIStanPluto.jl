using CausalInference
using DataFrames

ProjDir = @__DIR__

include(joinpath(ProjDir, "..", "src", "DAG.jl"))
include(joinpath(ProjDir, "..", "src", "to_graphviz.jl"))

d = OrderedDict(
  :u => [:x, :v],
  :s1 => [:u],
  :w => [:v, :y],
  :s2 => [:w]
);

dag = DAG("dag_01", d)
display(dag)

function to_gv(d::NamedTuple, file::AbstractString)
  isfile(file) && rm(file)
  io = open(file, "w")
  #gs = topological_sort(d.a)
  write(io, "digraph $(d.name) {\n")
  vars = names(gs, 1)
  for var in vars
    for (ind, entry) in enumerate(gs[:, var])
      if entry == 1
        write(io, "  $(var) -> $(vars[ind]);\n")
      end
    end
  end
  write(io, "}\n")
  close(io)
end

#=
begin
    fname = joinpath(mktempdir(), "sr6_1.dot")
    to_graphviz(dag, fname)
    Sys.isapple() && run(`open -a GraphViz.app $(fname)`)
end;
=#