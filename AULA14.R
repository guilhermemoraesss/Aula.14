> install.packages("strucchange")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/strucchange_1.5-1.zip'
Content type 'application/zip' length 951478 bytes (929 KB)
downloaded 929 KB

package 'strucchange' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpIR8Zqf\downloaded_packages
> library(strucchange)
Carregando pacotes exigidos: zoo

Attaching package: 'zoo'

The following objects are masked from 'package:base':
  
  as.Date, as.Date.numeric

Carregando pacotes exigidos: sandwich
> library(readxl)
> library(readxl)
> Bancor_xls <- read_excel("C:/EconometriaA/Bancor.xls.xlsx", 
                           +     col_types = c("date", "numeric"))
There were 50 or more warnings (use warnings() to see the first 50)
> View(Bancor_xls)
> Bitcoin <- ts <- ts(Bancor_xls$Close, start = 2018, frequency = 365)
> plot(Bitcoin)
> chow <- Fstats(Bitcoin~1)
> sctest(chow)

supF test

data:  chow
sup.F = 130.58, p-value < 2.2e-16

> plot(Bitcoin)
> lines(breakpoints(chow))
> plot(chow)
> bp_ts <- breakpoints(Bitcoin ~ 1)
> bp_ts

Optimal 6-segment partition: 
  
  Call:
  breakpoints.formula(formula = Bitcoin ~ 1)

Breakpoints at observation number:
  58 112 166 220 281 

Corresponding to breakdates:
  2018(58) 2018(112) 2018(166) 2018(220) 2018(281) 
> summary(bp_ts)

Optimal (m+1)-segment partition: 
  
  Call:
  breakpoints.formula(formula = Bitcoin ~ 1)

Breakpoints at observation number:
  
  m = 1   85                
m = 2              209 288
m = 3   85         223 281
m = 4   85     162 216 281
m = 5   58 112 166 220 281

Corresponding to breakdates:
  
  m = 1   2018(85)                                        
m = 2                                2018(209) 2018(288)
m = 3   2018(85)                     2018(223) 2018(281)
m = 4   2018(85)           2018(162) 2018(216) 2018(281)
m = 5   2018(58) 2018(112) 2018(166) 2018(220) 2018(281)

Fit:
  
  m   0      1      2      3      4      5     
RSS 1164.8  857.3  466.3  290.5  278.0  256.6
BIC 1474.2 1373.8 1162.7 1001.3  997.1  979.5
> plot(Bitcoin)
> lines(bp_ts)
> fm0 <- lm(Bitcoin ~ 1)
> fm1 <- lm(Bitcoin ~ breakfactor(bp_ts, breaks = 1))
> fm2 <- lm(Bitcoin ~ breakfactor(bp_ts, breaks = 2))
> plot(Bitcoin)
> lines(ts(fitted(fm0), start = 2014, freq=365), col = 3)
> lines(ts(fitted(fm1), start = 2014, frequency=365), col = 4)
> lines(ts(fitted(fm2), start = 2014, frequency=365), col = 1)
> lines(bp_ts)
> MIO1 <- diff(Bitcoin)
> plot(MIO1)
> 