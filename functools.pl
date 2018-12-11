:- module(functools, [map/3, map2/4, foldR/4, foldL/4, any/2]).

map(_, [], []).
map(F, [H|T], [H1|T1]) :-
    call(F, H, H1),
    map(F, T, T1).

map2(_, _, [], []).
map2(F, X, [H|T], [H1|T1]) :-
    call(F, X, H, H1),
    map2(F, X, T, T1).

foldR(_, [], Acc, Acc).
foldR(F, [H|T], Init, R) :-
    foldR(F, T, Init, Acc),
    call(F, H, Acc, R).

foldL(_, [], Acc, Acc).
foldL(F, [H|T], Init, R) :-
    call(F, H, Init, Acc),
    foldL(F, T, Acc, R).

any(P, [H|T]) :-
    call(P, H);
    any(P, T).
