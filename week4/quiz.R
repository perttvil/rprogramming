#q1
set.seed(1)
rpois(5, 2)

#q5
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x,y)

#q8
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)