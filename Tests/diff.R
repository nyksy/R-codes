#Author Juho Nykänen

library(car)
library(userfriendlyscience)


#Levene
a <-c(30,32,29,33,31,28)
b <-c(43,39,36,32,38,35)
c <-c(39,32,30,35,39,41)
dataset <-c(a,b,c)

group <-as.factor(c(rep(1, length(a)), rep(2, length(b)), rep(3, length(c))))

leveneTest(dataset, group)

"Levene's Test for Homogeneity of Variance (center = median)
      Df F value Pr(>F)
group  2  2.2318 0.1417
      15       
"
#ANOVA
fit <-aov(dataset ~ group)
summary(fit)

"
            Df Sum Sq Mean Sq F value Pr(>F)  
group        2  152.1   76.06   6.189  0.011 *
Residuals   15  184.3   12.29                 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
"
#OneWay
oneway.test(dataset ~ group)

"
One-way analysis of means (not assuming equal variances)

data:  dataset and group
F = 9.2203, num df = 2.0000, denom df = 8.6828, p-value = 0.007118
"

#Tukey
TukeyHSD(fit, conf.level=0.95)

"
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = dataset ~ group)

$group
         diff        lwr       upr     p adj
2-1  6.666667  1.4095664 11.923767 0.0128492
3-1  5.500000  0.2428997 10.757100 0.0397892
3-2 -1.166667 -6.4237669  4.090434 0.8345564
"

#Bonferroni
pairwise.t.test(dataset, group, p.adj = "bonf")

"
	Pairwise comparisons using t tests with pooled SD 

data:  dataset and group 

  1     2    
2 0.015 -    
3 0.048 1.000

P value adjustment method: bonferroni 
"
#Aggregate
aggregate(dataset, by=list(group), FUN = mean)

"
  Group.1        x
1       1 30.50000
2       2 37.16667
3       3 36.00000
"

#Games-howell
oneway(group, y = dataset, posthoc = 'games-howell')

"
Omega squared: 95% CI = [.04; .64], point estimate = .37
Eta Squared: 95% CI = [.08; .61], point estimate = .45

                                    SS Df    MS    F    p
Between groups (error + effect) 152.11  2 76.06 6.19 .011
Within groups (error only)      184.33 15 12.29          


### Post hoc test: games-howell

     diff ci.lo ci.hi    t   df    p
2-1  6.67  1.67 11.67 3.89 7.33 .013
3-1  5.50 -0.28 11.28 2.83 6.76 .061
3-2 -1.17 -7.66  5.32 0.49 9.78 .875
"