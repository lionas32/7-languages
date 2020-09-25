# Enhance the XML program to add spaces to show the indentation
# structure

Builder := Object clone
Builder counter := 0
Builder forward := method(
  i := "" asMutable
  i = Builder counter repeat(i appendSeq("    "))
  (i == nil) ifTrue(i := "")
  writeln("#{i}<" interpolate, call message name, ">")
  Builder counter = Builder counter + 1
  call message arguments foreach(
	arg, 
	content := self doMessage(arg);
	if(content type == "Sequence", writeln("#{i} " interpolate, content)))
  writeln("#{i}</" interpolate, call message name, ">")
  Builder counter = Builder counter - 1
)

# Enhance the XML program to handle attributes: if the first argument is
# a map (use the curly brackets syntax), add attributes to the XML program.
OperatorTable addAssignOperator(":", "atPutNumber")
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doString(arg asString)
       )
  r
)

Builder forward := method(
  i := "" asMutable
  i = Builder counter repeat(i appendSeq("    "))
  (i == nil) ifTrue(i := "")
  # Start of attributes
  write("#{i}<" interpolate, call message name)
  args := call message arguments
  firstArg := doMessage(args at(0))
  if (firstArg type == "Map", 
  	write(" ", firstArg asList at(0) join("="))
	args := args exSlice(1)
   )
  writeln(">")
  # End of attributes
  Builder counter = Builder counter + 1
  args foreach(
	arg, 
	content := self doMessage(arg);
	if(content type == "Sequence", writeln("#{i} " interpolate, content)))
  writeln("#{i}</" interpolate, call message name, ">")
  Builder counter = Builder counter - 1
)

Builder book({"author":"Tate"},
			li("1"),
			li("2")
			li("3")
			ul({"key":"value"}, li("Done")))
