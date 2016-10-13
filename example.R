library(prettyB)
theme_set("minimal")
plot(rnorm(10), rnorm(10), xlim=c(-10, 10), ylim=c(-10, 10))
plot(rnorm(10), xlab="sfdsf", main="title")
plot(rexp(10), xlab="sfdsf", main="title", log="xy")


qqnorm(rnorm(10), ylab="sdfsd")

qqnorm(rnorm(10))

y = runif(10)
qqnorm(y,  ylab="sdfsd", ylim=c(-10, 10))
