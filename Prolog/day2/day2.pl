% Reverse the elements of a list
reverse2([], []). 
reverse2([Head|[]], [Head]).
reverse2([Head|Tail], Reversed) 
    :- reverse2(Tail, Tail2), append(Tail2, [Head], Reversed).

% Find the smallest element of a list.
min2([Head|[]], Head).
min2([Head,Head2|Tail], Smallest) 
    :- ( 
        Head =< Head2 -> min2([Head|Tail], Smallest)
    ;   min2([Head2|Tail], Smallest)
    ).

% Sort the elements of a list.
sorted([], []).
sorted([Head|[]], [Head|[]]).
sorted([Head,Head2|Tail], Sorted)
    :- (
        Head < Head2 -> sorted([Head2|Tail], Tail2), append([Head], Tail2, Sorted)
    ;   sorted([Head2,Head|Tail], Sorted2), sorted(Sorted2, Sorted)
    ).
