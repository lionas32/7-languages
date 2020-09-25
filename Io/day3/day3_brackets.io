# Create a list syntax that uses brackets.
squareBrackets := method(
    res := List clone
    call message arguments foreach(arg,
        res append(doMessage(arg))
    )
    res
)

[1,2,"abc"] println