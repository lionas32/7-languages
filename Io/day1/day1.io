fib := method(x,
    if(x == 1 or x == 0, return 1, fib(x - 1) + fib(x - 2))
)

fib(5) println