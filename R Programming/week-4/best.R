best <- function(state, oc) {
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
    dh <- data.frame(name = ds$Hospital.Name, cdata = cdata, stringsAsFactors = FALSE)
    head(dh)
    dh <- dh[order(dh$cdata, dh$name), ]
    dh <- na.omit(dh)
    hosname <- dh$name[1]
    return(hosname)
}