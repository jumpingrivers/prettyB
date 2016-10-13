# http://flowingdata.com/2016/03/22/comparing-ggplot2-and-r-base-graphics/
dat1 <- data.frame(
  sex = factor(c("Female","Female","Male","Male")),
  time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(13.53, 16.81, 16.24, 17.42)
)

dat1mat <- matrix( dat1$total_bill,
                   nrow = 2,
                   byrow=TRUE,
                   dimnames = list(c("Female", "Male"), c("Lunch", "Dinner"))
)


mf_col <- 1:2#c("#3CC3BD", "#FD8210")

fm_col = 1
#par(cex=1.2, cex.axis=1.1)
plot(1:10, rnorm(10),
     type="b", lty=1, pch=19, col=fm_col,
        cex=1.5, lwd=3, las=1, bty="n", xaxt="n",

        main="Average Bill for Two People", yaxt="n")


axis(2,  las=1, cex.axis=0.8, col=NA, line = -0.5)
axis(1,col=NA, line = -0.5)
grid(NA, NULL, lty=3, lwd=1, col="#000000")




abline(v=c(1,2), lty=3, lwd=1, col="#000000")



mtext("Lunch", side=1, at=1)
mtext("Dinner", side=1, at=2)
text(1.5, 17.3, "Male", srt=8, font=3)
text(1.5, 15.1, "Female", srt=33, font=3)

matplot(dat1mat)


