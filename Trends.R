rm(list = ls())
trend <- read.csv("./trend.csv", stringsAsFactors = FALSE)
trend <- trend[-1,]
trend <- as.numeric(trend)
names(trend) <- "trend"
months <- seq(2004, 2019, length = 181)
trend <- as.data.frame(cbind(months, trend))
names(trend) <- c("date", "trend")
spline <- smooth.spline(trend$date, trend$trend)
png("./Trends.png")
plot(trend$date, trend$trend, xlab = "", ylab = "Index de popularité")
title("Recherches du mot clé 'open source' sur Google", sub = "Source: Google Trends et travail personnel")
lines(spline, col = "blue", lwd = 2)
dev.off()
