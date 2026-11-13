# London Airbnb Listings - First Exploration
# Big Data for Economic Growth and Development | Imperial College London
#
# Goal: Which 10 London boroughs have the most Airbnb listings?
#
# Before running: Clone the class GitHub repository, then change repo_dir
# below to the location of the cloned folder on YOUR computer.

# 1. Set your local repository path -------------------------------------

repo_dir <- "/Users/sarasethia/github/london-airbnb-listings"  # CHANGE THIS!

# The dataset is in the main folder of the repository.
data_path <- file.path(repo_dir, "listings.csv")

# Stop with a helpful message if the file path is incorrect.
if (!file.exists(data_path)) {
  stop("Could not find listings.csv. Check the repo_dir path at the top of this script.")
}

# 2. Load and explore the data ------------------------------------------

listings <- read.csv(data_path, stringsAsFactors = FALSE)

cat("Number of rows and columns:\n")
print(dim(listings))

cat("\nColumn names:\n")
print(names(listings))

cat("\nFirst six rows:\n")
print(head(listings))

# 3. Count listings by London borough -----------------------------------

borough_counts <- sort(table(listings$neighbourhood), decreasing = TRUE)
top_20 <- head(borough_counts, 20)

cat("\nTop 10 boroughs by number of Airbnb listings:\n")
print(top_20)

# 4. Make and save a simple bar chart -----------------------------------

output_dir <- file.path(repo_dir, "outputs")
dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

chart_path <- file.path(output_dir, "top_20_boroughs.png")

png(chart_path, width = 1200, height = 800)
par(mar = c(5, 12, 4, 2))
barplot(
  rev(top_20),
  horiz = TRUE,
  las = 1,
  col = "steelblue",
  main = "London boroughs with the most Airbnb listings",
  xlab = "Number of listings"
)
dev.off()

cat("\nChart saved to:\n", chart_path, "\n")

# Optional: Can you change the chart to show the top 5 boroughs instead?

