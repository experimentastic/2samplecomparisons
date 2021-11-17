
# "tDistributionPlot"

library(haven)
library(here)
library(knitr)
library(kableExtra)

library(tidyverse)
library(plotly)

library(htmlwidgets)

# data 
RTPWA<-read_dta(here("content/basics/Data/Replication_WebAppendix.dta"))
SampleDat<-RTPWA%>%select(female, TimeNTP)%>%
              mutate(female = as_factor(female))

SampleDat2<-RTPWA%>%select(female, TimeTP)%>%
              mutate(female = as_factor(female))


# t.test(SampleDat[SampleDat$female==0,]$TimeNTP, SampleDat[SampleDat$female==1,]$TimeNTP)

v.testTP<-var.test(SampleDat2[SampleDat2$female==0,]$TimeTP, SampleDat2[SampleDat2$female==1,]$TimeTP)

t.testTP<-t.test(SampleDat2[SampleDat2$female==0,]$TimeTP, SampleDat2[SampleDat2$female==1,]$TimeTP, 
                 var.equal = TRUE)

# plot
zstart <--5
zend <- 5
my_col <- "#00998a"

#df1 = t.testTP$parameter


df1<-seq(1,200)

xp<- seq(zstart,zend, by = 0.01)
df<- expand_grid(x = xp, df = df1)%>%
  group_by(df)%>%
  mutate(y = dt(xp, df = df))


dffig<-df%>%
  plot_ly()%>%
  add_trace(x = ~xp, y = ~dnorm(xp, mean = 0, sd =1), line = list(color = "black"), name = "Standard Normal", type="scatter", mode="lines")%>%
  add_trace(x = ~x, y = ~y, frame = ~df, type = "scatter", mode="lines", name="t distribution")%>%
  layout(title="Standard Normal distribution versus t-distribution as degrees of freedom change", 
         xaxis = list(title="t statistic"), 
         yaxis = list(title="density"))%>%
  animation_slider(
    currentvalue = list(prefix = "Degrees of freedom: ")
  )



saveWidget(dffig, "dffig.html", selfcontained = F, libdir = "lib")

