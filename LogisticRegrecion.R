> url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"
> data <- read.csv(url, header=FALSE)
> head(data)
V1 V2 V3  V4  V5 V6 V7  V8 V9 V10 V11 V12 V13 V14
1 63  1  1 145 233  1  2 150  0 2.3   3 0.0 6.0   0
2 67  1  4 160 286  0  2 108  1 1.5   2 3.0 3.0   2
3 67  1  4 120 229  0  2 129  1 2.6   2 2.0 7.0   1
4 37  1  3 130 250  0  0 187  0 3.5   3 0.0 3.0   0
5 41  0  2 130 204  0  2 172  0 1.4   1 0.0 3.0   0
6 56  1  2 120 236  0  0 178  0 0.8   1 0.0 3.0   0
> colnames(data)<-c(
  +   "age",
  +   "sex",
  +   "cp",
  +   "trestbps",
  +   "chol",
  +   "fbs",
  +   "restecg",
  +   "thalach",
  +   "exang",
  +   "oldpeak",
  +   "slope",
  +   "ca",
  +   "thal",
  +   "hd")
> head(data)
age sex cp trestbps chol fbs restecg thalach exang oldpeak slope  ca thal hd
1  63   1  1      145  233   1       2     150     0     2.3     3 0.0  6.0  0
2  67   1  4      160  286   0       2     108     1     1.5     2 3.0  3.0  2
3  67   1  4      120  229   0       2     129     1     2.6     2 2.0  7.0  1
4  37   1  3      130  250   0       0     187     0     3.5     3 0.0  3.0  0
5  41   0  2      130  204   0       2     172     0     1.4     1 0.0  3.0  0
6  56   1  2      120  236   0       0     178     0     0.8     1 0.0  3.0  0
> str(data)
'data.frame':	303 obs. of  14 variables:
  $ age     : num  63 67 67 37 41 56 62 57 63 53 ...
$ sex     : num  1 1 1 1 0 1 0 0 1 1 ...
$ cp      : num  1 4 4 3 2 2 4 4 4 4 ...
$ trestbps: num  145 160 120 130 130 120 140 120 130 140 ...
$ chol    : num  233 286 229 250 204 236 268 354 254 203 ...
$ fbs     : num  1 0 0 0 0 0 0 0 0 1 ...
$ restecg : num  2 2 2 0 2 0 2 0 2 2 ...
$ thalach : num  150 108 129 187 172 178 160 163 147 155 ...
$ exang   : num  0 1 1 0 0 0 0 1 0 1 ...
$ oldpeak : num  2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
$ slope   : num  3 2 2 3 1 1 3 1 2 3 ...
$ ca      : Factor w/ 5 levels "?","0.0","1.0",..: 2 5 4 2 2 2 4 2 3 2 ...
$ thal    : Factor w/ 4 levels "?","3.0","6.0",..: 3 2 4 2 2 2 2 2 4 4 ...
$ hd      : int  0 2 1 0 0 0 3 0 2 1 ...
>  data[data=="?"]<-NA
>  data[data$sex==0,]$sex<-"F"
>  data[data$sex==1,]$sex<-"M"
>  data$sex<-as.factor(data$sex)
>  data$cp<-as.factor(data$cp)
>  data$fbs<-as.factor(data$fbs)
>  data$restecg<-as.factor(data$restecg)
>  data$exang<-as.factor(data$exang)
>  data$slope<-as.factor(data$slope)
>  data$ca<-as.integer(data$ca)
>  data$ca<-as.factor(data$ca)
>  data$thal<-as.integer(data$thal)
>  data$thal<-as.factor(data$thal)
>  data$hd<-ifelse(test=data$hd==0,yes="healty",no="unhealty")
>  data$hd<-as.factor(data$hd)
> str(data)
'data.frame':	303 obs. of  14 variables:
  $ age     : num  63 67 67 37 41 56 62 57 63 53 ...
$ sex     : Factor w/ 2 levels "F","M": 2 2 2 2 1 2 1 1 2 2 ...
$ cp      : Factor w/ 4 levels "1","2","3","4": 1 4 4 3 2 2 4 4 4 4 ...
$ trestbps: num  145 160 120 130 130 120 140 120 130 140 ...
$ chol    : num  233 286 229 250 204 236 268 354 254 203 ...
$ fbs     : Factor w/ 2 levels "0","1": 2 1 1 1 1 1 1 1 1 2 ...
$ restecg : Factor w/ 3 levels "0","1","2": 3 3 3 1 3 1 3 1 3 3 ...
$ thalach : num  150 108 129 187 172 178 160 163 147 155 ...
$ exang   : Factor w/ 2 levels "0","1": 1 2 2 1 1 1 1 2 1 2 ...
$ oldpeak : num  2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
$ slope   : Factor w/ 3 levels "1","2","3": 3 2 2 3 1 1 3 1 2 3 ...
$ ca      : Factor w/ 4 levels "2","3","4","5": 1 4 3 1 1 1 3 1 2 1 ...
$ thal    : Factor w/ 3 levels "2","3","4": 2 1 3 1 1 1 1 1 3 3 ...
$ hd      : Factor w/ 2 levels "healty","unhealty": 1 2 2 1 1 1 2 1 2 2 ...
> nrow(data[is.na(data$ca)|is.na(data$thal),])
[1] 6
> data[is.na(data$ca)|is.na(data$thal),]
age sex cp trestbps chol fbs restecg thalach exang oldpeak slope   ca thal       hd
88   53   F  3      128  216   0       2     115     0     0.0     1    2 <NA>   healty
167  52   M  3      138  223   0       0     169     0     0.0     1 <NA>    2   healty
193  43   M  4      132  247   1       2     143     1     0.1     2 <NA>    4 unhealty
267  52   M  4      128  204   1       0     156     1     1.0     2    2 <NA> unhealty
288  58   M  2      125  220   0       0     144     0     0.4     2 <NA>    4   healty
303  38   M  3      138  175   0       0     173     0     0.0     1 <NA>    2   healty
> nrow(data)
[1] 303
> data<- data[!(is.na(data$ca)|is.na(data$thal)),]
> 
> nrow(data)
[1] 297
> xtabs(~hd+sex,data=data)
sex
hd           F   M
healty    71  89
unhealty  25 112
> xtabs(~hd+cp,data=data)
cp
hd           1   2   3   4
healty    16  40  65  39
unhealty   7   9  18 103
> xtabs(~hd+fbs,data=data)
fbs
hd           0   1
healty   137  23
unhealty 117  20
> xtabs(~hd+restecg,data=data)
restecg
hd          0  1  2
healty   92  1 67
unhealty 55  3 79
> xtabs(~hd+exang,data=data)
exang
hd           0   1
healty   137  23
unhealty  63  74
> xtabs(~hd+slope,data=data)
slope
hd           1   2   3
healty   103  48   9
unhealty  36  89  12
> xtabs(~hd+ca,data=data)
ca
hd           2   3   4   5
healty   129  21   7   3
unhealty  45  44  31  17
> xtabs(~hd+thal,data=data)
thal
hd           2   3   4
healty   127   6  27
unhealty  37  12  88
> logistic<-glm(hd~sex,data=data,family="binomial")
> summary(logistic)

Call:
  glm(formula = hd ~ sex, family = "binomial", data = data)

Deviance Residuals: 
  Min       1Q   Median       3Q      Max  
-1.2765  -1.2765  -0.7768   1.0815   1.6404  

Coefficients:
  Estimate Std. Error z value Pr(>|z|)    
(Intercept)  -1.0438     0.2326  -4.488 7.18e-06 ***
  sexM          1.2737     0.2725   4.674 2.95e-06 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 409.95  on 296  degrees of freedom
Residual deviance: 386.12  on 295  degrees of freedom
AIC: 390.12

Number of Fisher Scoring iterations: 4

> logistic<-glm(hd~.,data=data,family="binomial")
> summary(logistic)

Call:
  glm(formula = hd ~ ., family = "binomial", data = data)

Deviance Residuals: 
  Min       1Q   Median       3Q      Max  
-3.0490  -0.4847  -0.1213   0.3039   2.9086  

Coefficients:
  Estimate Std. Error z value Pr(>|z|)    
(Intercept) -6.253978   2.960399  -2.113 0.034640 *  
  age         -0.023508   0.025122  -0.936 0.349402    
sexM         1.670152   0.552486   3.023 0.002503 ** 
  cp2          1.448396   0.809136   1.790 0.073446 .  
cp3          0.393353   0.700338   0.562 0.574347    
cp4          2.373287   0.709094   3.347 0.000817 ***
  trestbps     0.027720   0.011748   2.359 0.018300 *  
  chol         0.004445   0.004091   1.087 0.277253    
fbs1        -0.574079   0.592539  -0.969 0.332622    
restecg1     1.000887   2.638393   0.379 0.704424    
restecg2     0.486408   0.396327   1.227 0.219713    
thalach     -0.019695   0.011717  -1.681 0.092781 .  
exang1       0.653306   0.447445   1.460 0.144267    
oldpeak      0.390679   0.239173   1.633 0.102373    
slope2       1.302289   0.486197   2.679 0.007395 ** 
  slope3       0.606760   0.939324   0.646 0.518309    
ca3          2.237444   0.514770   4.346 1.38e-05 ***
  ca4          3.271852   0.785123   4.167 3.08e-05 ***
  ca5          2.188715   0.928644   2.357 0.018428 *  
  thal3       -0.168439   0.810310  -0.208 0.835331    
thal4        1.433319   0.440567   3.253 0.001141 ** 
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 409.95  on 296  degrees of freedom
Residual deviance: 183.10  on 276  degrees of freedom
AIC: 225.1

Number of Fisher Scoring iterations: 6


> ll.null<-logistic$null.deviance/-2
> ll.proposed<-logistic$deviance/-2
> (ll.null-ll.proposed)/ll.null
[1] 0.5533531
> 1-pchisq(2*(ll.null-ll.proposed),df=(length(logistic$coefficients)-1))
[1] 1
> 1-pchisq(2*(ll.proposed-ll.null),df=(length(logistic$coefficients)-1))
[1] 0
> predicted.data<-data.frame(probability.of.hd=logistic$fitted.values,hd=data$hd)
> predicted.data<-predicted.data[order(predicted.data$probability.of.hd, decreasing = FALSE),]
> predicted.data$rank<-1:nrow(predicted.data)
> library(ggplot2)
> library(cowplot)
ggplot(data=redicted.data,aes(x=rank,y=probability.of.hd))+geom_point(aes(color=hd),alpha=1,shape=4,stroke=2)+xlab("index")+ylab("predicted probabolity of getting heart disease")