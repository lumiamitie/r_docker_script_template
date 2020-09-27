import("forecast", "auto.arima")
import("logger", "log_info")
import("tibble", "tibble")
# import generic function "predict"
import("stats", "predict")

export("fit_arima", "compare_result")

fit_arima <- function(trainset) {
    log_info("Fitting ARIMA model")
    auto.arima(trainset$count)
}

forecast_arima <- function(model, n = 20) {
    as.numeric(predict(model, n.ahead = n)$pred)
}

compare_result <- function(model, testset) {
    log_info("Compare fitting result and test data")
    pred <- forecast_arima(model, n = nrow(testset))
    tibble(
        date_id = testset$date,
        real = testset$count,
        prediction = pred
    )
}
