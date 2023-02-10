
#Let's us play rock paper scissors

print("Rock Paper Scissors")

player_1 = input("Username: ")

player_2 = "stranger"

import random
result_winner = []

round = 1
while True:
        print("\nRound:", round)
        result_1 = input("Enter a choice (rock[0], paper[1], scissors[2]): ")
    
        print(player_1, "choose", result_1, ".")
    
        if result_1 == "rock":
            result_1 = 1
        elif result_1 == "paper":
            result_1 = 2
        elif result_1 == "rock":
            result_1 = 3
        else:
            result_1 = 0

        result_2 = random.randint(1,3) #randint use for randon number between x and y 
        
        if result_1 == result_2:
            winner = 0
            result_winner.append(winner)
            print("Tie!")

        elif result_1 == 1 and result_2 == 2:
            winner = 2
            result_winner.append(winner)
            print(player_2, "wins!")

        elif result_1 == 2 and result_2 == 1 :
            winner =1
            result_winner.append(winner)
            print(player_1, "wins, congrats!!")

        elif result_1 == 1 and result_2 == 3:
            winner = 1
            result_winner.append(winner)
            print(player_1, "wins")

        elif result_1 == 3 and result_1 ==1 :
            winner = 2 
            result_winner.append(winner)
            print(player_2, "wins")

        elif result_1==2 and result_2 ==3 :
            winner = 2
            result_winner.append(winner)
            print(player_2, "wins")

        elif result_1 == 3 and result_2 == 2:
            winner = 1 
            result_winner.append(winner)
            print(player_1, "wins!")

        round += 1

        if round ==6 :
            print("Final round")

        if round == 7:
            print("End")

            break

score_1 = result_winner.count(1)
score_2 = result_winner.count(2)

if score_1 > score_2 :
    print(f"\nGame result: {player_1} wins")
    print(f"summary scores: {score_1}")

elif  score_2 > score_1 :
    print(f"\nGame result: {player_2} wins")
    print(f"summary scores: {score_2}")
else :
    print("\nGame result: You're tie!")
