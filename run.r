doc <- "
Sample batch script using R.

Usage:
  run.r [--target_dt=<date>] [--package=<p>]
  run.r (-h | --help)
  runBatch.r --version

Options:
  -h --help            Show this screen.
  --version            Show version.
  --target_dt=<date>   Target date [default: today].
  --package=<package>  Target package [default: dplyr].
"

# Load modules
lib <- modules::use("src")

# Parse parameters
arguments <- docopt::docopt(doc, version = "1.0\n")
TARGET_DATE <- lib$utils$get_date(arguments$target_dt)
PACKAGE <- arguments$package

# Modeling
data <- lib$data$get_data(PACKAGE, TARGET_DATE)
model <- lib$fit$fit_arima(data$train)
forecast <- lib$fit$compare_result(model, data$test)

# Print Result
logger::log_info("Printing result...")
print(forecast)
