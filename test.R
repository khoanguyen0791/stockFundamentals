require(ggplot2)
require(reshape2)
df <- data.frame(time = 1:10,
                 a = cumsum(rnorm(10)),
                 b = cumsum(rnorm(10)),
                 c = cumsum(rnorm(10)))
df <- melt(df ,  id.vars = 'time', variable.name = 'series')

# plot on same grid, each series colored differently -- 
# good if the series have same scale
ggplot(df, aes(time,value)) + geom_line(aes(colour = series))

# or plot on different plots
ggplot(df, aes(time,value)) + geom_line() + facet_grid(series ~ .)