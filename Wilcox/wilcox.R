ennen <-c(5.6, 5.9, 9.3, 4.2, 8.3, 4.6, 6.2, 5.6, 9.6, 4.3)
jalkeen <-c(3.6, 5.4, 8.6, 2.3, 8.7, 2.4, 7.5, 4.4, 8.5, 2.0)

wilcox.test(ennen,jalkeen, paired = TRUE)

"
Wilcoxon signed rank exact test

data:  ennen and jalkeen
V = 48, p-value = 0.03711
alternative hypothesis: true location shift is not equal to 0
"

x <-c(0.03,0.29,0.44,0.07,0.22,0.23,0.18,0.00,0.75,0.34,0.13,0.26,0.70,0.28)
y <-c(0.61,0.55,0.39,0.01,0.41,0.74,0.40,0.30,0.60,0.78)
wilcox.test(y, x, paired = F, exact =  F, correct = F)

"
Wilcoxon rank sum test

data:  y and x
W = 107, p-value = 0.03027
alternative hypothesis: true location shift is not equal to 0
"