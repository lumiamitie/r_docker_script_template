import("cranlogs", "cran_downloads")
import("lubridate", "ymd")
import("logger", "log_info")
import("glue", "glue")
import("dplyr")

export("get_data")

get_data <- function(package, target_dt) {
    log_info(glue("Package : {package}, Target date : {target_dt}"))

    to <- ymd(target_dt)
    from <- to - (100 - 1)
    data <- cran_downloads(package = package, from = from, to = to)

    list(
        train = data %>% filter(date < (to - 19)),
        test = data %>% filter(date >= (to - 19))
    )
}
