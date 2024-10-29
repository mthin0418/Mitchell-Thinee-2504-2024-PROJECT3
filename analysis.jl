using DataFrames, CSV, StatsPlots,  Plots,  PlotlyJS
csv_file = CSV.File("data/Melbourne_housing_FULL.csv")
df = DataFrame(csv_file)
#println("Data size: ", size(df))
#println("Columns in the data: ", names(df))
#println(first(df,10))

# Changing the Method name sint he Dataframe to thier actual, for plotting.
method_mapping = Dict("PI" => "Property passed in", 
                      "PN" => "Sold prior not Disclosed", 
                      "S" => "Property Sold",
                      "SA" => "Sold After Auction", 
                      "SN" => "Sold not Disclosed", 
                      "SP" => "Property Sold Prior",
                      "SS" => "Sold After Auction", 
                      "VB" => "Vendor Bid", 
                      "W" => "Withdrawn prior to Auction")




#Histogram of Price
histogram(df.Price, bins=20, xlabel="Price", ylabel="Count", title="Distribution of Property Prices")

scatter(df.Rooms, df.Price, xlabel="Number of Rooms", ylabel="Price", title="Price vs. Number of Rooms")

# Filter out rows with missing values in either Distance or Price
# filtered_df = dropmissing(df, [:Distance, :Price])

# # Create a box plot with the filtered data
histogram(filtered_df.Distance, filtered_df.Price,
    xlabel="Distance", ylabel="Price",
    title="Price by Distance", label = "")


# using StatsPlots

# Group by Distance and calculate average prices
# grouped_df = combine(groupby(df, :Distance), :Price => (x -> mean(skipmissing(x))) => :AvgPrice)

# # Create a bar plot for average price by distance
# scatter(grouped_df.Distance, grouped_df.AvgPrice,
#     xlabel = "Distance (km)", ylabel = "Average Price (AUD)",
#     title = "Average Price by Distance",
#     legend = false)

    # Specify bins that match the unique values in Distance
# bins = 0:1:maximum(grouped_df.Distance)  # Adjust as necessary for your data

# Create a histogram with specified bins
# histogram(grouped_df.Distance, bins = bins, legend=false,
#     xlabel = "Distance (km)", ylabel = "Frequency",
#     title = "Frequency of Distance")

#     # Create a line plot with average prices by distance
# plot(grouped_df.Distance, grouped_df.AvgPrice,
# xlabel = "Distance (km)", ylabel = "Average Price (AUD)",
# title = "Average Price by Distance",
# legend = false, marker = :circle)

# # Create a box plot with the cleaned data
# scatter(cleaned_df.Distance, cleaned_df.Price,
#     xlabel = "Distance (km)", ylabel = "Price (AUD)", title = "Price by Distance", label = "")

    
# Group the data and calculate average price, skipping missing values
# rooms_methods_df = combine(groupby(df, [:Rooms, :Method]), 
#                      :Price => (x -> mean(skipmissing(x))) => :AvgPrice)

# # Maps the abbreviated method names to full names
# full_method_names = [method_mapping[m] for m in rooms_methods_df.Method]

# Creates the bar plot
# bar(rooms_methods_df.Rooms, rooms_methods_df.AvgPrice, group=full_method_names, 
#     xlabel="Number of Rooms", ylabel="Average Price (AUD)", 
#     title="Average Price by Rooms and Method of Sale",
#     titlefontsize=11, legend=:topleft, legendfontsize=9)  # Adjust title size here
                  

# # ## Landsize compared to number of Rooms
# scatter(df.Rooms, df.Landsize,
#     xlabel = "Number of Rooms",
#     ylabel =  "Land Size (sqm)",
#     title = "Land Size vs Number of Rooms",
#     legend = false)

# scatter(df.Rooms, df.Price,
#     xlabel = "Number of Rooms",
#     ylabel =  "Price (AUD)",
#     title = "Price Vs Number of Rooms in a Property",
#     legend = false)


    