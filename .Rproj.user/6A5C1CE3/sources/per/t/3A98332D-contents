# ----------------------------------------------
# -----------1_basics---------------------------
# -----------Nils Kappelmann--------------------
# ----------------------------------------------



# -----------Basics------------------------------


## How do I read in Data? --> Different ways but often you start with a .csv file

dat = read.csv(
  file = "./Data/BFI_Data.csv", # file argument specifies file holding the data (and location) 
  header = TRUE, # header argument specifies whether there are variable names in top line
  sep = ";"
) # sep argument specifies how data entries are separated (open as with notepad to check this)


# There are different ways of loading in the data
save(dat, "./Data/BFI_Data.RData")
load("./Data/BFI_Data.RData") # Load is helpful and quick if you use RData files
rm(bfi) # let's remove this again


# This dataset is actually freely available in the psych package
#install.packages("psych")
library("psych")
data(bfi) # it can be loaded like this (no need to remember this approach for your own data)
?bfi # This is how you get some information on the data



## How does the data look like?

# Function 1: colnames

colnames(dat)


# Function 2: head

head(dat)
head(dat, 3)


# Function 3: tail (complement to head)

tail(dat, 6)


# Function 4: str

str(dat)



## What does "number:number" mean?

1:15
15:1
5:25
seq(from = 1, to = 2, by= 0.05)


## What does "<-" or "=" do?

1:10
numbers <- 1:10
numbers

numbers2 = 10:1
numbers2

## What does "[]" do?

numbers[1:5]
numbers[8]
numbers[10:5]

dat[, 2]
dat[1, 2:3]
dat[2:3, 1:5]


# Get length 
length(1:10)
length(dat)
length(dat[,2])
nrow(dat)
ncol(dat)


## What does "$" do?

dat$A1
dat$education
dat$gender[5:10]
dat[5:10,]$gender
dat[5:10, 26]
dat[5:10, "gender"]
dat[5:10, c("gender", "education")]


## What does the c Function do?

c("Bernd", "David")
c(1, 5, 2)

names <- c("Bernd", "David")



## What does the data.frame Function do?

data.frame(Variable1 = c(1, 5, 2),
           Variable2 = c("Bernd", "David", "Simon"))

namesandnumbers <- data.frame(Variable1 = c(1, 5, 2),
                              Variable2 = c("Bernd", "David", "Simon"))
namesandnumbers

list(namesandnumbers,
     test = 1:10)

as.numeric("1")


dat$O5 = as.numeric(dat$O5)


##What does the round function do?

c(2.3, 2.55, 2.777)
round(c(2.3, 2.55, 2.777))
round(c(2.3, 2.55, 2.777), 1)
round(c(2.3, 2.55, 2.777), 2)


## What does the rnorm function do?

rnorm(20, mean = 100, sd = 15)
rnorm(20, 100, 15)

fakedat <- data.frame(fakeIQ = rnorm(100, mean = 100, sd = 15)) 
head(fakedat)

fakedat$fakeBMI <- round(rnorm(100, mean = 24, sd = 3))
head(fakedat)


## What does the table function do?

table(fakedat$fakeBMI)
prop.table(table(fakedat$fakeBMI)) * 100
table(fakedat$fakeIQ) # oops....
table(round(fakedat$fakeIQ))


## What does the summary function do?

summary(fakedat$fakeIQ)
mean(fakedat$fakeIQ)
mean(c(1, 3, 5, NA))
mean(c(1, 3, 5, NA), na.rm = TRUE)
median(fakedat$fakeIQ)
min(fakedat$fakeIQ)
max(fakedat$fakeIQ)
sd(fakedat$fakeIQ)
summary(fakedat$fakeBMI)
summary(dat$A1)



## What does the hist function do?

hist(fakedat$fakeBMI) 
hist(fakedat$fakeIQ)
hist(dat$age)


## What does the plot function do?

plot(x = fakedat$fakeBMI, y = fakedat$fakeIQ)
plot(fakedat$fakeBMI, fakedat$fakeIQ)

with(fakedat, plot(fakeBMI, fakeIQ))



## What does the lm function do?
lm(fakeIQ ~ fakeBMI, data = fakedat)

fakemodel <- lm(fakeIQ ~ fakeBMI, data = fakedat)
summary(fakemodel)

plot(fakemodel)

str(fakemodel)
hist(fakemodel$residuals)

qqnorm(fakemodel$residuals)
qqline(fakemodel$residuals)

plot(fitted(fakemodel), residuals(fakemodel))


## How are more complicated regression models created?

fakedat$fakepreIQ <- fakedat$fakeIQ + rnorm(100, mean = 0, sd = 10)

fakemodel <- lm(fakeIQ ~ fakeBMI + fakepreIQ, data = fakedat)
summary(fakemodel)

fakemodel <- lm(fakeIQ ~ fakeBMI : fakepreIQ, data = fakedat)
summary(fakemodel)

fakemodel <- lm(fakeIQ ~ fakeBMI + fakepreIQ + fakeBMI : fakepreIQ, data = fakedat)
summary(fakemodel)

fakemodel <- lm(fakeIQ ~ fakeBMI * fakepreIQ, data = fakedat)
summary(fakemodel)

with(fakedat, plot(fakepreIQ, fakeIQ))
abline(lm(fakeIQ ~ fakepreIQ, data = fakedat))



## How are prettier plots created?

# install.packages("ggplot2") # install ggplot2 package if not done already
library("ggplot2")

ggplot(fakedat, aes(x = fakepreIQ, y = fakeIQ)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, colour = "darkblue") +
  ylab("Fake IQ") +
  xlab("Fake Pre-IQ") +
  theme_bw()



## Now for the bfi data:

# paste function

A.items <- paste("A", 1:5, sep = "")
A.items

# rowSums and rowMeans function

dat$A_sum <- rowSums(dat[, A.items], na.rm = FALSE) # na.rm: how to handle missing data
summary(dat$A_sum)

dat$A_mean <- rowMeans(dat[, A.items], na.rm = FALSE)
summary(dat$A_mean)

hist(dat$A_sum)
with(dat, plot(A3, A_sum))





# ----------------------------Calculation---------------------------


## You can also assess variables based on a criterion (instead of row number etc.)
dat$A_sum[dat$A_sum == 10] # missing values make things complicated sometimes...

dat$A_sum[dat$A_sum == 10 & is.na(dat$A_sum) == FALSE]
dat$A_sum[dat$A_sum == 10 & !is.na(dat$A_sum) == FALSE]

# What is is.na?
is.na(c(1, NA))
!is.na(c(1, NA))


dat$A_sum[dat$A_sum >= 25 & !is.na(dat$A_sum)]

dat$A_sum[dat$A_sum != 10 & !is.na(dat$A_sum)]

dat[!is.na(dat$A_sum), "A1"]

dat[!is.na(dat$A_sum) & dat$A1 > 4, "A1"]


## How do I calculate in R?

3 + 4
3 * 4
3 * (5+5)^2
log(4)
exp(3)
sqrt(9)


## It's easy to extend this from single value calculations to vectors:
1:10 + 2
(1:10)^2

plot(1:10, (1:10)^2)


## You can even extend this further to matrices:

matrix(1:9, nrow = 3, ncol = 3)

matrix(1:9, nrow = 3, ncol = 3) * 2

matrix(1:9, nrow = 3, ncol = 3) * 1:3

matrix(1:9, nrow = 3, ncol = 3) * 1:4 #ooops... dimensions need to fit

matrix(1:9, nrow = 3, ncol = 3) %*% 
  matrix(1:9, nrow = 3, ncol = 3) # to multiply matrices %*% is the multiplication sign


## Calculation in R is an easy way to calculate parameters for statistical analyses

# Centering variables:
dat$A_cen <- dat$A_sum - mean(dat$A_sum, na.rm = TRUE)
cbind(dat$A_sum, dat$A_cen)
with(dat, plot(A_sum, A_cen))

# Calculating squared variables:
dat$A_sq <- dat$A_sum^2
with(dat, plot(A_sum, A_sq))

# These variables can be used for statistical analyses:
model <- lm(A_cen ~ A1, data = dat)
summary(model)


## Next to calculation, there are other ways to code variables in R.

## You can categorise variables (e.g., agreeable/ not agreeable). Easiest is dichotomisation
dat$agree <- ifelse(dat$A_sum >= 21, 1, 0)
cbind(dat$A_sum, dat$agree)

dat$agree <- ifelse(dat$A_sum >= 21, "Agreeable", "Not Agreeable")
cbind(dat$bdi_sum, dat$agree)



## Categories can be nicely used for plotting:

ggplot(dat[!is.na(dat$A_sum), ], aes(x = A1, y = A_sum)) + 
  geom_count(aes(color = agree)) + 
  xlab("Agreeableness: Item 1") +
  ylab("Agreeableness: Sum-Score") +
  scale_size(guide = "none") +
  theme_bw() +
  theme(legend.position = "top",
        legend.title = element_blank())



# ---------