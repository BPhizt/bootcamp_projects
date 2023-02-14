Machine Learning (ML) workflow is Train-Test-Split

3 types of Machine Learning (ML) 
- Supervised learning > predict something
- UnSupervised learning > summay data, find the pattern of data, find relation in data
  clustering / Association / Dimension Reduction
- Reinforcement learning(RL)

#installed "caret"

install.packages("caret")
library(caret)
mtcars

train_test_split <- function(data){
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size=0.8*n)
  train_data <- data[id,]
  test_data <- data[-id,]  
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

#train model
lm_model <- train(mpg ~hp, 
      data = split_data[[1]],
      method ="lm" )

#score and evalue
p <- predict(lm_model, 
newdata = split_data[[2]]) 

error <- split_data[[2]]$mpg -p
rmse <- sqrt(mean(error**2))

###Live OCt29
#Statistics
model1 <- lm(mpg~hp+wt,
            data=mtcars)

model1

# caret train()
model2 <- train(mpg~hp+wt,
                data=mtcars,
                method="lm") ##ML algorithm

model3 <- train(mpg~hp+wt,
    data=mtcars,
    method="rpart") #Another one of algorithm

model2$finalModel

##ML basic pipeline !!!! Focus on here


#Step1. prepare / split data
sample(1:6, size = 1) #dice
sample(1:6, size = 3) #random 3 numbers

#If you want to random more than 6 
#set replace=T
sample(1:6, size = 10, replace=T)

#After putting the whole step 1-4 in
#train_test_split then change
#Step1 Prepare /split date
split_data <- train_test_split(mtcars)
train_data <- split_data[[1]]
test_data <- split_data[[2]]


set.seed(42)
n <- nrow(mtcars) #count the number of rows in mtcars
#random sample 1-32 n=32
id <- sample(1:n, size=n*0.8)
#train data id
train_data <- mtcars[id,]
#Test data -id
test_data <- mtcars[-id,]

##Use this code to train data :))))
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size=n*0.8)
train_data <- mtcars[id,]
test_data <- mtcars[-id,]

#Step2. train model
model <- train(mpg~hp+wt,
               data=train_data,
               method="lm")

#K-fold
ctrl <- trainControl(method = "boot",
                     number=100)
model <- train(mpg~hp+wt,
               data=train_data,
               method="lm",
               trControl=ctrl)
#Leave one out cv
ctrl <- trainControl(method = "LOOCV",
                     number=100)
model <- train(mpg~hp+wt,
               data=train_data,
               method="lm",
               trControl=ctrl)

# CV = k-fold cross validation K=5 or k=10
set.seed(35)
ctrl <- trainControl(method="repeatedcv",
                     number=5, #K=5
                     repeats = 5,
                     verboseIter = TRUE)
model <- train(mpg~hp+wt,
               data=train_data,
               method="lm",
               trControl=ctrl)


#Step3. score model / prediction
p_mpg <- predict(model, newdata= test_data)

#Step4.evaluate model
error <- p_mpg - test_data$mpg
test_rmse <- sqrt(mean(error**2))

#step5 save model(batch prediction)
nov_data <- data.frame(
  id =1:3,
  hp =c(200, 150, 188),
  wt =c(2.5, 1.9, 3.2)
)

nov_prediction <- predict(model, 
                newdata = nov_data )

#save model
saveRDS(model, "LinearReg_Model.RDS")
