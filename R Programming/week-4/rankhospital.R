rankhospital <- function(state, oc, num = "best") {
    ds <- subset(outcome, outcome$State == state)
    head(ds$Hospital.Name)
    if (nrow(ds) == 0) {
        return("invalid state")
    }
    d <- (gsub(" ", ".", oc))
    if (d == "heart.attack") {
        cdata <- as.numeric(ds[, 11])
    } else if (d == "heart.failure") {
        cdata <- as.numeric(ds[, 17])
    } else if (d == "pneumonia") {
        cdata <- as.numeric(ds[, 23])
    } else {
        return("invalid outcome")
    }
    dh <- data.frame(name = ds$Hospital.Name, cdata, stringsAsFactors = FALSE)
    dh <- dh[order(dh$cdata, dh$name), ]
    dh <- na.omit(dh)
    if (num == "best") {
        ind <- 1
    } else if (num == "worst") {
        ind <- nrow(dh)
    } else if (is.numeric(num)) ind <- num
    if (ind > nrow(dh)) {
        return(NA)
    }
    hosname <- dh$name[ind]
    return(hosname)
}