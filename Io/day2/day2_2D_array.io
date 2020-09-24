# Write a prototype for a two-dimensional list. The dim(x, y) method should
# allocate a list of y lists that are x elements long. set(x, y, value) should set
# a value, and get(x, y) should return that value.

TwoDimList := Object clone

TwoDimList dim := method(x, y,
    self array := list()
    y repeat(self array append(list()))
    self array mapInPlace(i, 
        x repeat(i append(0))
        i
    )
)

TwoDimList set := method(x, y, value,
    row := self array at(y) 
    if(row,
        row atPut(x, value),
        Exception raise("Row #{y} is out of bounds")
    )
)

TwoDimList get := method(x, y,
    row := self array at(y)
    if(row,
        row at(x),
        Exception raise("Row #{y} is out of bounds" interpolate)
    )
)

myArray := TwoDimList clone
myArray dim(4, 5)
myArray set(2, 3, 10)
myArray array 
myArray get(2,3) println

# Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x,
# y) on the original list.

TwoDimList transpose := method(
    newArray := TwoDimList clone
    newArray dim(self array size, self array at(0) size)
    newArray array foreach(i, y,
        y mapInPlace(j, x,
            self get(i, j)
        )
    )
    newArray
)

newArray := myArray transpose 
(myArray get(2,3) == newArray get(3,2)) println

# Write the matrix to a file, and read a matrix from a file.

writeMatrixToFile := method(matrix, filename,
    f := File with(filename)
    f remove
    f openForUpdating
    matrix array foreach(y,
        y foreach(x,
            f write("#{x} " interpolate)
        )
        f write("\n")
    )
    f close
)

readFileToMatrix := method(filename,
    f := File with(filename)
    f openForReading
    lines := f readLines
    f close
    lines mapInPlace(x, x split mapInPlace(y, y asNumber))
    lines println
    newArray := TwoDimList clone
    newArray dim(lines at(0) size, lines size)
    newArray array foreach(i, y,
        y mapInPlace(j, x,
            lines at(i) at(j)
        )
    )
    newArray
)

writeMatrixToFile(newArray, "new_array.txt")
a := readFileToMatrix("new_array.txt")
a array println