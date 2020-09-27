% Reverse the elements of a list
reverse2([], []). 
reverse2([Head|[]], [Head]).
reverse2([Head|Tail], Reversed) 
    :- reverse2(Tail, Tail2), append(Tail2, [Head], Reversed).