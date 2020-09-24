# A Fibonacci sequence starts with two 1s. Each subsequent number is
# the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21,
# and so on. Write a program to find the nth Fibonacci number. fib(1) is
# 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with
# loops

# Recursive
fibRec := method(x, (x == 0) ifTrue(return 0);
    if(x == 2 or x == 1, 
        return 1, 
        fibRec(x - 1) + fibRec(x - 2))
)


# Loop
fibLoop := method(x, (x == 0) ifTrue(return 0);
    if(x == 1 or x == 2, return 1)
    a := 1;
    b := 1;
    while(x != 2,
        tmp := b
        b = a + b
        a = tmp
        x = x - 1
    )    
    return b
)

fibRec(1) println
fibRec(5) println


fibLoop(1) println
fibLoop(5) println

# Write a program to add up all of the numbers in a two-dimensional array
sumAll := method(array, 
    array map(sum) sum
)

sumAll(list(list(1,2,3,4,5), list(1,2,3,4,5))) println

# Add a slot called myAverage to a list that computes the average of all the
# numbers in a list. What happens if there are no numbers in a list?
# (Bonus: Raise an Io exception if any item in the list is not a number.)

List myAverage := method(
    s := self sum
    len := self size
    if(len != 0, 
        s / len,
        Exception raise("Length of list is 0")
    )
)

list(1,2,3,4,5) myAverage println
list(2, 5) myAverage println
list() myAverage println