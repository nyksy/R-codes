#Author: Juho Nykänen

#Year vectors 
vuodet1=c(100:150) 
vuodet2=c(151:200)

#Configuring the plot
plot(vuodet1, observations$first, xlim= c(100,200), ylim=c(0,2500), xlab="time", ylab="population size", pch=1) 
title(main="Population dynamics") 
#mtext("Opiskelijanumero: ", 3, 0) 

lines(c(100:200), logistic_model) 
points(vuodet2, observations$second, pch=3, col="blue") 


#label for max value
max(observations$first) 
which.max(observations$first) 
text(148, 1753, labels=max(observations$first), pos=3) 

curve(((logistic_model[51]-100)/exp(-150))*exp(-x)+100, from=150, to=200, add=TRUE, col="red") 

#Adding legend
legend(100, 2500, pch=c(26, 26, 1, 3), lty=c(1,1,0,0), 
       col=c("black","red","black","blue"), 
       legend=c("logistic growth model", "exponential decay model", 
                "observations in years 100-150", "observations in years 151-200")) 