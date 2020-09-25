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


Builder ul(
	li("Io"), 
	li(li("Lua")), 
	li("JavaScript"))