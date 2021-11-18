---
title: t-test 6
author: ''
date: '2021-11-17'
slug: []
categories: []
tags: []
weight: 11
---

Should we reject the null hypothesis that the population average decision times with time pressure are the same for males and females?

The t-test permits us to ask the a specific question: **If the null hypothesis is true, what is the probability of observing a value the same, or more extreme, than the test statistic that we observed in our sample?**

If this probability is *low* we will *reject the null hypothesis*: we will essentially decide that this observed statistic is different enough that we would not attribute this difference to sampling error alone.

Now, because the t-distribution is a probability distribution, the total *area below the t-distribution* is 1.

So we need to decide what *level of significance* we are comfortable with first, and then we can determine the probability that our observed test statistic could be as extreme or more so that what we just observed.





For a two-tailed test (i.e. our alternative hypothesis is $\neq$ to some value), the $p$-value of our test statistic is twice the area towards the nearest *tail*.




```
##         t 
## 0.1263807
```

```
##         t 
## 0.2527613
```

```
## 
## 	Two Sample t-test
## 
## data:  SampleDat2[SampleDat2$female == 0, ]$TimeTP and SampleDat2[SampleDat2$female == 1, ]$TimeTP
## t = 1.1454, df = 377, p-value = 0.2528
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -2.827096 10.716953
## sample estimates:
## mean of x mean of y 
##  160.6291  156.6842
```


