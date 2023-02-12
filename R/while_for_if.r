## while loop // for loop // if..else

f_auth <- function() {
  print("Welcome to our application.")
  
  attemps <- 0 # user tries to log in zero time
  
  while (attemps < 3) {
  
    # get username password from user
    un <- readline("Username: ")
    pw <- readline("Password: ")
    
    attemps <- attemps + 1
    
    # check authentication
    # & is user have to answer both question correct then they can login
    
    if (un == "bluenira" & pw == "1234") {
      print("Successfully login.")
      break #break out from the loop
    } else {
      if (attemps == 3) #code on this line will run when user try/
        #attemps = 3
        {
        print("Your account is locked.")
      } else {
        print("Please try again...")
      }
    }
  }
}


#for loop
# for loop
# vectorization**is a vector
# similar with list in python
# Toy was showing that R is so easy. We not need for loop
# but in other language we will need to write for loop

nums <- 1:10

for (num in nums) {
  print(num * 2)
}
## IN  R  we can write so short and easy
nums <- 1:10
nums * 2 # * คูณ

#nums ยกกำลัง 3
nums <- 1:10
nums ** 3 #** ยกกำลัง

#plus
nums <- 1:10
nums +12

#for loop with hi friends example for other language
# say Hi to each of our friends
friends <- c("Jenny", "Lisa", "Jisoo", "Rose")

for (friend in friends) {
  print( paste("Hi", friend)  )
}

# in R >> the result was the same but R will show as vector
friends <- c("Jenny", "Lisa", "Jisoo", "Rose")
paste("Hi", friends)
