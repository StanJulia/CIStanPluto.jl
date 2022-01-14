# CIStanPluto

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->

# CIStanPluto.jl

## Purpose

This project will contain (work in early stages of preogress!!!) a set of Pluto notebooks that contain Julia versions of the examples in the book ["CausalInference: The mixtape" by Scott Cunningham](https://www.scunning.com/mixtape.html).

These notebooks are intended to be used in conjunction with above book.

It is authored by Rob J Goedman. I am attempting to base it on {CausalInference.jl](https://github.com/mschauer/CausalInference.jl)

## Usage

To (locally) reproduce this project, do the following:

0. Download this code base. Notice that raw data are typically not included in the
   git-history and may need to be downloaded independently.
1. Open a Julia console and do:
   ```
   julia> using Pkg
   julia> Pkg.add("DrWatson") # install globally, for using `quickactivate`
   julia> Pkg.activate("path/to/this/project")
   julia> Pkg.instantiate()
   ```

This will install all necessary packages for you to be able to run the scripts and
everything should work out of the box, including correctly finding local paths.
