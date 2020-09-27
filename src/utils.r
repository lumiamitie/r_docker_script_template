import("lubridate", "today", "ymd")

export("get_date")

get_date <- function(dt) {
    if (dt == "today") {
        return(today())
    } else {
        return(ymd(dt))
    }
}
