using StataDTAFiles, Test, Dates
using StataDTAFiles: LSF, verifytag, read_header, read_map, read_variable_types,
    read_variable_names, read_sortlist, read_formats, TIMESTAMPFMT, readrow
using Parameters: @unpack
import Tables
using DataFrames
using CSV

ProjDir = @__DIR__

CI_dir = ENV["JULIA_MIXTAPE_HOME"]

function is_dta(filename::AbstractString)
    if length(filename) > 5
        return filename[end-3:end] == ".dta"
    else
        return false
    end
end

function toDataFrame(filename::AbstractString; cols=[])
        println("Working on $(filename)")
        local testdata = joinpath(CI_dir, filename)
        local dta = open(DTAFile, testdata)
        local df = DataFrame(dta)
        if length(cols) > 0
            for col in cols
                df[!, Symbol(col)] = String.(df[:, Symbol(col)])
            end
        end
        local csv_file = 
            joinpath(ProjDir, split(filename, ".")[1] * ".csv")
        println("$(csv_file)")
        CSV.write(csv_file, df)
end

dta_files = readdir(CI_dir)
dta_files2 = filter(is_dta, dta_files)

skip_files = ["auto.dta", "castle.dta", "cps_mixtape.dta",
    "lmb-data 2.dta", "lmb-data.dta", "nsw_mixtape.dta", "texas.dta",
    "training_example.dta", "yule.dta", "ri.dta"]

for dta_f in dta_files2
    if !(dta_f in skip_files)
        toDataFrame(dta_f)
    end
end

#=  # To check if a Stata file contains StrFs formatted columns
testdata = joinpath(CI_dir, "ri.dta")
dta = open(DTAFile, testdata)
=#

# Convert StrFs columns to Symbols
toDataFrame("auto.dta"; cols = ["make"])
toDataFrame("castle.dta"; cols = ["state"])
toDataFrame("cps_mixtape.dta"; cols = ["data_id"])
toDataFrame("lmb-data 2.dta"; cols = ["name", "poolename"])
toDataFrame("lmb-data.dta"; cols = ["name", "poolename"])
toDataFrame("nsw_mixtape.dta"; cols = ["data_id"])
toDataFrame("texas.dta"; cols = ["state"])
toDataFrame("training_example.dta"; cols = ["earnings_treat"])
toDataFrame("yule.dta"; cols = ["location"])
toDataFrame("ri.dta"; cols = ["name", "y0", "y1"])

