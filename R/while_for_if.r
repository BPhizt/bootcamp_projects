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
