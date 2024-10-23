using DataFrames, CSV
csv_file = CSV.File("data/Melbourne_housing_FULL.csv"; missingstring = "NA")
df = DataFrame(csv_file)
println("Data size: ", size(df))
println("Columns in the data: ", names(df))
df[1:10, :]