rankall <- function(oc, num = "best") {
    statename <- sort(unique(outcome$State))
    d <- (gsub(" ", ".", d4))
    if (d == "heart.attack") {
        cdata <- as.numeric(outcome[, 11])
    } else if (d == "heart.failure") {
        cdata <- as.numeric(outcome[, 17])
    } else if (d == "pneumonia") {
        cdata <- as.numeric(outcome[, 23])
    } else {
        return("invalid outcome")
    }
    fdf <- data.frame(hospital = outcome$Hospital.Name, state = outcome$State, cdata = cdata)
    rankdf <- data.frame()
    for (x in statename) {
        ds <- subset(fdf, fdf$state == x)
        dh <- ds[order(ds$cdata, ds$hospital), ]
        dh <- na.omit(dh)
        if (rank == "best") {
            ind <- 1
        } else if (rank == "worst") {
            ind <- nrow(dh)
        } else if (is.numeric(rank)) ind <- rank
        hosname <- dh$hospital[ind]
        sdf <- data.frame(state = x, hospital = hosname)
        rankdf <- rbind(rankdf, sdf)
    }
    return(rankdf)
}