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




# Histogram of Price
#histogram(df.Price, bins=20, xlabel="Price", ylabel="Count", title="Distribution of Property Prices")

#scatter(df.Rooms, df.Price, xlabel="Number of Rooms", ylabel="Price", title="Price vs. Number of Rooms")

#boxplot(df.Distance, df.Price, xlabel="Distance", ylabel="Price", title="Price by Distance")

# grouped_df = combine(groupby(df, [:Rooms, :Method]), 
#                      :Price => (x -> mean(skipmissing(x))) => :AvgPrice)

# Plot with custom method names
# bar(grouped_df.Rooms, grouped_df.AvgPrice, group=grouped_df.Method, 
#     xlabel="Rooms", ylabel="Average Price", 
#     title="Average Price by Rooms and Method (Skipping Missing)",
#     titlefontsize=11)  # Adjust title size here



# Group the data and calculate average price, skipping missing values
rooms_methods_df = combine(groupby(df, [:Rooms, :Method]), 
                     :Price => (x -> mean(skipmissing(x))) => :AvgPrice)

# Maps the abbreviated method names to full names
full_method_names = [method_mapping[m] for m in rooms_methods_df.Method]

# Creates the bar plot
bar(rooms_methods_df.Rooms, rooms_methods_df.AvgPrice, group=full_method_names, 
    xlabel="Number of Rooms", ylabel="Average Price (AUD)", 
    title="Average Price by Rooms and Method of Sale",
    titlefontsize=11, legend=:topleft, legendfontsize=9)  # Adjust title size here
                    

# Get the unique methods in your DataFrame
# unique_methods = unique(grouped_df.Method)

# # Create a dictionary that maps each unique method to its custom label
# method_label_map = Dict(unique_methods[i] => method_labels[i] for i in 1:length(unique_methods))

# Bar plot with custom labels for each method in the legend
# bar(grouped_df.Rooms, grouped_df.AvgPrice, group=grouped_df.Method, 
#     label=[method_label_map[m] for m in grouped_df.Method],  # Assign labels based on method
#     xlabel="Rooms", ylabel="Average Price", 
#     title="Average Price by Rooms and Method (Skipping Missing)",
#     titlefontsize=14)



#     # Bar plot using StatsPlots
# @df grouped_df bar(:Rooms, :AvgPrice, group=:Method, 
# xlabel="Rooms", ylabel="Average Price", 
# title="Average Price by Rooms and Method (Skipping Missing)", 
# label=[method_label_map[m] for m in grouped_df.Method], legend=:topright)
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


    # begin
    #     p1 = plot(USdata.Quarters, [USdata.GDP  USdata.INV  USdata.M2])
    #     restyle!(p1, 
    #         name = ["GDP"  "INV"  "M2"],
    #         line_color = ["BlueViolet" "maroon" "navy"]) # any other colors will do
    #     relayout!(p1, 
    #         title_text = "My title using relayout but you can do it with Layout", 
    #         title_x = 0.5, # centers the title
    #         xaxis_title = "Quarters", yaxis_title = " Billion dollars", 
    #         height = 450, width = 900) # in PlutoPlotly default will be height=400, width=Pluto window width
    #     p1
    # end


    # df_rooms = dataset(df, df.Rooms)
    # plot(df_rooms, x=:total_bill, kind="histogram")


    