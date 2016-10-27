library(prettyB)
theme_set("minimal")
plot(0:10, 0:10)
plot(-10:10, -10:10)
par(mfrow=c(1, 2))
plot(rnorm(10), xlab="sfdsf", main="title")
plot(rexp(10), xlab="sfdsf", main="title", log="xy")


qqnorm(rnorm(10), ylab="sdfsd")

qqnorm(rnorm(10))

y = runif(10)
qqnorm(y,  ylab="sdfsd")


theme_set("minimal")
x = rt(100, 2)
hist(x)

