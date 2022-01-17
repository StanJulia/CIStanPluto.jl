# CIStanPluto.jl

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->

## Purpose

This project will contain (work in early stages of preogress!!!) a set of Pluto notebooks that contain Julia versions of the examples in the book ["CausalInference: The mixtape" by Scott Cunningham](https://www.scunning.com/mixtape.html).

These notebooks are intended to be used in conjunction with above book.

It is authored by Rob J Goedman. I am attempting to base it on [CausalInference.jl](https://github.com/mschauer/CausalInference.jl)

## Prerequisites

To complete below steps and run the notebooks you need:

1. A functioning [cmdstan](https://mc-stan.org/users/interfaces/cmdstan.html).
2. A functioning [Julia](https://julialang.org/downloads/).
3. Access to some development tools, e.g. git and a C++ toolchain.
4. A Julia base environment containing `Pkg`, `DrWatson`, `Pluto` and `PlutoUI`.

## Setup the Pluto based CIStanPluto notebooks

To (locally) use this project, do the following:

Select and download CIStanPluto.jl from [StanJulia on Github](https://github.com/StanJulia/), e.g. to clone it to the `~/.julia/dev/CIStanPluto` directory:
```Julia
# Use git clone or the Github site options.
$ git clone https://github.com/StanJulia/CIStanPluto.jl ~/.julia/dev/CIStanPluto
$ cd CIStanPluto.jl # Move to the downloaded directory
$ julia --project=CIStanPluto # Available from Julia-1.7 onwards.
(CIStanPluto) pkg> activate .
(CIStanPluto) pkg> instantiate     # Only the first time
```

Still in the Julia REPL, start a Pluto notebook server.
```Julia
julia> using Pluto
julia> Pluto.run()
```

A Pluto page should open in a browser. See [this page](https://www.juliafordatascience.com/first-steps-5-pluto/) for a quick Pluto introduction.

## Usage

Select a notebook in the `open a file` entry box, e.g. type `./`.

A few more details can be found in [TIPS.jl](https://github.com/StanJulia/CIStanPluto.jl/blob/master/TIPS.md).
