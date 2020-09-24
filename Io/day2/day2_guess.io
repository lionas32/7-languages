# Write a program that gives you ten tries to guess a random number from
# 1–100. If you would like, give a hint of “hotter” or “colder” after the first
# guess.

# Requires the `Random` package from `eerie
# eerie install https://github.com/IoLanguage/Random.git
guessGame := method( 
    "Try to guess the random number between 1 and 100!" println
    guess := File standardInput readLine asNumber
    rnum := Random value(1, 101) >> 0
    counter := 10
    while(counter != 0,
        if(guess == rnum, return "Congrats! You guessed the correct number!")
        if(guess < rnum, "To low!" println, "To high!" println)
        guess := File standardInput readLine asNumber
        counter = counter - 1
    )
    "Looks like you ran out of guesses! Better luck next time:)"
)

guessGame println