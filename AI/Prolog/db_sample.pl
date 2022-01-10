loves(romeo,juilet) .
loves(juilet,romeo) :-loves(romeo,juilet) .
plus(X,Y,Z):- Z is X + Y .

boy(jack) .
girl(jill) .
friends(jack,jill) .

child(suresh,haresh).
child(suresh,haresh):-parent(haresh,suresh).
child(sonu,haresh).
child(gargi,sonu).
son(sonu,haresh).

male(suresh).
male(haresh).
male(ram).
male(john).
male(shah).

female(sanjana) .
female(anjali) .
female(ritu) .
female(jassie) .

happy(abhi).
happy(alice).
happy(bob).
with_bob(alice).

dances(alice):-happy(alice),with_bob(alice).

does_alice_dances :-dances(alice),
write('When alice is happy and with bob, she dances').

parent(albert,bob).
parent(albert,bill).

parent(alice,bob).
parent(alice,bill).

parent(bob,carl).
parent(bob,charls).

grandchild :- parent(albert,X),parent(X,Y),
    write('Albert grandchild is '),
    write(Y),nl.

parent:- parent(X,carl),
    parent(X,charls),
    format('~w ~s parent ~n',[X,"is the"]).

cgpa(10):-
    write('Grade O').    
cgpa(9):-
    write('Grade A').
cgpa(Other):-
    Grade is Other,
    format('Grade is ~w ~n',[Grade]).

owns(jessie,pet(cat,kitty)).    

%related(X,Y):-parent(X,Z); related(Z,Y).

square(X,Y):- Y is X*X.

hello:-
    write('Who are you ? '),
    read(X),
    write('Good day '),
    write(X),
    write('!').

combine_string(S1,S2,S3):-
    name(S1,SList1),
    name(S2,SList2),
    append(SList1,SList2,SList3),
    name(S3,SList3).
       
%fact(neeraj,Q):- fact(P,topper).       