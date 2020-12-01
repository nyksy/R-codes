#Author Juho Nykänen

library(gmodels)


data <-matrix(c(17,97,30,142,89,816),dimnames =list(c("Underweight","Overweight","Appropriate"),c("Yes","No")),byrow=T,ncol=2,)

head(data)

CrossTable(data, digits = 3, expected = T, chisq = TRUE,format=c("SPSS"))

"
   Cell Contents
|-------------------------|
|                   Count |
|         Expected Values |
| Chi-square contribution |
|             Row Percent |
|          Column Percent |
|           Total Percent |
|-------------------------|

Total Observations in Table:  1191 

             |  
             |      Yes  |       No  | Row Total | 
-------------|-----------|-----------|-----------|
 Underweight |       17  |       97  |      114  | 
             |   13.018  |  100.982  |           | 
             |    1.218  |    0.157  |           | 
             |   14.912% |   85.088% |    9.572% | 
             |   12.500% |    9.194% |           | 
             |    1.427% |    8.144% |           | 
-------------|-----------|-----------|-----------|
  Overweight |       30  |      142  |      172  | 
             |   19.641  |  152.359  |           | 
             |    5.464  |    0.704  |           | 
             |   17.442% |   82.558% |   14.442% | 
             |   22.059% |   13.460% |           | 
             |    2.519% |   11.923% |           | 
-------------|-----------|-----------|-----------|
 Appropriate |       89  |      816  |      905  | 
             |  103.342  |  801.658  |           | 
             |    1.990  |    0.257  |           | 
             |    9.834% |   90.166% |   75.987% | 
             |   65.441% |   77.346% |           | 
             |    7.473% |   68.514% |           | 
-------------|-----------|-----------|-----------|
Column Total |      136  |     1055  |     1191  | 
             |   11.419% |   88.581% |           | 
-------------|-----------|-----------|-----------|

 
Statistics for All Table Factors


Pearson's Chi-squared test 
------------------------------------------------------------
Chi^2 =  9.790615     d.f. =  2     p =  0.007481609 

"
