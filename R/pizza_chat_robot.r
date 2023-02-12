#home work 01 / order pizza with chat bot

#Menus
df_pizza <- data.frame(id)
---------
#HOmework 1 chat bot order pizza 8-10 orders

print("WELCOME TO BLUE'S PIZZARIA")

#question 1 
print("Hi, how are you?")
print("what is your name?")
user_name <- readLines("stdin", n=1) #stdin = standard input = 1 . You can enter only 1 line
#if stdin = 2 mean you have to answer the questions 2 times
print(paste("Hello", user_name))

#question 2
print("What can I get for you today?")
print("1.pizza, 2.rice")
action <- readLines("stdin", n=1)
if (action ==1) {
  print("What do you like?")
} else(
  print("sorry pls order pizza")
)

#QUESTION 3
print("Here are all the flavors")
print("1.Pepperoni, 2.Margherita, 3.Hawaiian, 4.veggies")
flavor <- readLines("stdin", n=1)
print(paste("You chose", flavor))

#Question 4 
print("Total will be $25")
print("How would you like to pay for it?")
print("1.cash, 2.credit_card, 3.debit_card")
paid <- readLines("stdin", n=1)
print(paste("Do you want a receipt"))
print("1.Yes, please, 2.No, thanks")
receipt <- readLines("stdin", n=1)
if (action ==1) {
  print("Nah, you don't need it")
} else(
  print("Enjoy your pizza, don't forget to leave tips")
)
print("Bye, see u next time)


#question 5


#Homework 2 Pao ying chub
#user can play unlimited times
# if else 





  

