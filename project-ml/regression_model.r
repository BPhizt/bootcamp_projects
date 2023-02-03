# build a regression model

head(mtcars)

# model = linear regression( mile per gallon is function of hp + wt, data is in mtcars)
model <- lm(mpg ~ hp + wt, data = mtcars)

summary(model) 
