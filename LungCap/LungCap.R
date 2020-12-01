#Author Juho Nykänen

lungcap <-read.table(file.choose(),sep=";",dec=".",header=TRUE)

Keisarinleikkaus <-as.numeric(lungcap$Caesarean=="yes")
Tupakointi <-as.numeric(lungcap$Smoke=="yes")
Sukupuoli <-as.numeric(lungcap$Gender=="male")

lungcap = cbind(lungcap, Keisarinleikkaus, Tupakointi, Sukupuoli)
head(lungcap)

"
LungCap Age Height Smoke Gender Caesarean Keisarinleikkaus Tupakointi Sukupuoli
1   6.475   6   62.1    no   male        no                0          0         1
2  10.125  18   74.7   yes female        no                0          1         0
3   9.550  16   69.7    no female       yes                1          0         0
4  11.125  14   71.0    no   male        no                0          0         1
5   4.800   5   56.9    no   male        no                0          0         1
6   6.225  11   58.7    no female        no                0          0         0
> "

sapply(lungcap, class)

malli <-lm(LungCap ~ Age + Height + Tupakointi + Sukupuoli + Keisarinleikkaus, data=lungcap)

summary(malli)

"Call:
lm(formula = LungCap ~ Age + Height + Tupakointi + Sukupuoli + 
    Keisarinleikkaus, data = lungcap)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.3388 -0.7200  0.0444  0.7093  3.0172 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -11.32249    0.47097 -24.041  < 2e-16 ***
Age                0.16053    0.01801   8.915  < 2e-16 ***
Height             0.26411    0.01006  26.248  < 2e-16 ***
Tupakointi        -0.60956    0.12598  -4.839 1.60e-06 ***
Sukupuoli          0.38701    0.07966   4.858 1.45e-06 ***
Keisarinleikkaus  -0.21422    0.09074  -2.361   0.0185 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.02 on 719 degrees of freedom
Multiple R-squared:  0.8542,	Adjusted R-squared:  0.8532 
F-statistic: 842.8 on 5 and 719 DF,  p-value: < 2.2e-16
"