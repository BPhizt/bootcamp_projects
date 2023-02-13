#home work 01 / order pizza with chat bot

#Menus..to be continuous..
df_pizza <- data.frame(id)
------------------


#Homework 1 chat bot order pizza 8-10 orders

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

  
#Question 3
print("what size pizza would you like?(1.Small, 2.Medium, 3.Large):?")
size <- readLines("stdin", n=1)
if (size == "1") {
  size <- "small"
} else if (size == "2") {
  size <- "medium"
} else if (size == "3") {
  size <- "Large"
} 
print(paste("You chose", size))
           
#QUESTION 4
print("Here are all the flavors")
print("1.Veggies, 2.Margherita, 3.Hawaiian")
flavor <- readLines("stdin", n=1)
if (flavor == "1") {
  flavor <- "Veggies,"
} else if (flavor == "2") {
  flavor <- "Margherita"
} else if (flavor == "3") {
  flavor <- "Hawaiian"
} 
print(paste("You chose", flavor))

#Question 5 
print("what topping would you like?(1.cheese, 2.pepperoni, 3.vegetables")
toppings <- readLines("stdin", n=1)
if (toppings == "1") {
  toppings <- "Cheese"
} else if (toppings == "2") {
  toppings <- "Pepperoni"
} else if (toppings == "3") {
  toppings <- "Vegetables"
} 
print(paste("You chose", toppings))

#Question 6
print("What type of crust would you like? (1.thin, 2.thick)")
crust <- readLines("stdin", n=1)

if (crust == "1") {
  type <- "Thin Crust"
} else if (crust == "2") {
  type <- "Thick Crust"
} 

print(paste("You have ordered a", size, "pizza with", toppings, flavor, "toppings on a", crust, "crust."))

#Question 7 
print("Total will be $25")
print("How would you like to pay for it?")
print("1.cash, 2.credit_card, 3.debit_card")
paid <- readLines("stdin", n=1)


#Question 8 
print("Do you want anything else?")
print("1.drinks, 2.no, thnks")
anything <- readLines("stdin", n=1)
if (anything ==1) {
  print("What drinks do you like?")
  print("We only have..")
  print("1.water, 2.pepsi, 3.lemonade")
  drink <- readLines("stdin", n=1)
  if (drink == "1"){
  drink <- "water"
  } else if (drink == "2") {
  drink <- "pepsi"
} else if (drink == "3") {
  drink <- "lemonade"
} 
print(paste("Here is your", drink))
} else(
  print("Enjoy your food, don't forget to leave tips")
)

print(paste("Here is your", drink))


#Question 9 
print(paste("Do you want a receipt"))
print("1.Yes, please, 2.No, thanks")
receipt <- readLines("stdin", n=1)
if (action ==1) {
  print("Nah, you don't need it")
} else(
  print("Enjoy your pizza, don't forget to leave tips")
)
  
print("Bye, see u next time")






  

