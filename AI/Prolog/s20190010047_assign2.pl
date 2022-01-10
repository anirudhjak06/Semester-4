/* Facts */

name(elizabeth,"Elizabeth II").
name(philiip,"Philip").
name(charles,"Charles").
name(diana,"Diana").
name(camilla,"Camilla").
name(anne,"Anne").
name(mark,"Mark Phillips").
name(timothy,"Timothy Laurence").
name(andrew,"Andrew").
name(sarah,"Sarah").
name(edward,"Edward").
name(sophie,"Sophie").
name(wiliiam,"William").
name(catherine,"Catherine").
name(harry,"Harry").
name(meghan,"Meghan").
name(peter,"Peter Phillips").
name(autumn,"Autumn Phillips").
name(zara,"Zara Tindall").
name(mike,"Mike Tindall").
name(beatrice,"Beatrice").
name(edoardo,"Edoardo Mapelli Mozzi").
name(eugenie,"Eugenie").
name(jack,"Jack Brooksbank").
name(louise,"Louise").
name(james,"James").
name(george,"George").
name(charlotte,"Charlotte").
name(louis,"Louis").
name(archie,"Archie Harrison").
name(savannah,"Savannah").
name(isla,"Isla").
name(mia,"Mia Grace").
name(lena,"Lena Elizabeth").
name(august,"August Phillip").


male(charles).
male(william).
male(peter).
male(andrew).
male(edward).
male(mark).
male(philip).
male(harry).
male(timothy).
male(james).
male(jack).
male(mike).
male(mapelli).
male(george).
male(louis).
male(archie).
male(august).



female(elizabeth).
female(diana).
female(camilla).
female(anne).
female(sarah).
female(sophie).
female(autumn).
female(zara).
female(catherine).
female(meghan).
female(beatrice).
female(eugenie).
female(louise).
female(charlotte).
female(savannah).
female(isla).
female(mia).
female(lena).



parent(elizabeth,charles).
parent(elizabeth,anne).
parent(elizabeth,andrew).
parent(elizabeth,edward).
parent(philip,charles).
parent(philip,anne).
parent(philip,andrew).
parent(philip,edward).

parent(charles,william).
parent(charles,harry).
parent(diana,william).
parent(diana,harry).

parent(anne,peter).
parent(anne,zara).
parent(mark,peter).
parent(mark,zara).

parent(andrew,beatrice).
parent(andrew,eugenie).
parent(sarah,beatrice).
parent(sarah,eugenie).

parent(edward,louise).
parent(edward,james).
parent(sophie,louise).
parent(sophie,james).

parent(william,george).
parent(william,charlotte).
parent(william,louis).
parent(catherine,george).
parent(catherine,charlotte).
parent(catherine,louis).

parent(harry,archie).
parent(meghan,archie).

parent(peter,savannah).
parent(peter,isla).
parent(autumn,savannah).
parent(autumn,isla).

parent(zara,mia).
parent(zara,lena).
parent(mike,mia).
parent(mike,lena).

parent(eugenie,august).
parent(jack,august).




position(elizabeth, queen, england).
position(philip, duke, edinburgh).
position(diana, princess, whales).
position(charles, prince, wales).
position(camilla, duchess, cornwall).
position(anne, princess, royal).
position(mark, captain, england).
position(timothy, civilian, england).
position(sarah, duchess, york).
position(andrew, duke, york).
position(sophie, countess, wessex).
position(edward, earl, sussex).
position(catherine, duchess, cambridge).
position(william, duke, cambridge).
position(harry, duke, sussex).
position(meghan, duchess, sussex).
position(autumn, civilian, england).
position(peter, civilian, england).
position(zara, civilian, england).
position(mike, civilian, england).
position(beatrice, princess, york).
position(edoardo, civilian, england).
position(eugenie, princess, york).
position(jack, civilian, england).
position(louise, lady, windsor).
position(james, viscount, severn).
position(george, prince, cambridge).
position(charlotte, princess, cambridge).
position(louis, prince, cambridge).
position(archie, civilian, england).
position(savannah, civilian, england).
position(isla, civilian, england).
position(mia, civilian, england).
position(lena, civilian, england).
position(august, civilian, england).




/* Father Relationship */
father(X,Y) :- parent(X,Y), male(X).

/* Mother Relationship */
mother(X,Y) :- parent(X,Y), female(X). 

/* Siblings Relationship */
siblings(X,Y) :- parent(Z,X), parent(Z,Y), not(X=Y).

/* Descendant Relationship */
descendant(X, Y) :- father(Y, X); mother(Y, X).
descendant(X, Y) :- 
    (father(Z, X); mother(Z, X)), 
    descendant(Z, Y).

/* First Cousin Relationship */
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

firstcousin(Child1,Child2) :-
    grandparent(Y1,Child1),
    grandparent(Y2,Child2),
    (siblings(Y1,Y2); 
    (not(siblings(Child1,Child2)), Y1=Y2)) .

/* Cousin Relationship */
cousinparent(X,Y) :-
    siblings(X,Z),
    (parent(Z,Y);
    grandparent(Z,Y)).

cousin(X,Y) :-
    cousinparent(Z,X),
    (parent(Z,Y);
    grandparent(Z,Y)).


/* Connection Relationship */
connection(X,Y,L) :- siblings(X,Y), L=[X,Y].
connection(X,Y,L) :- parent(Z,X), connection(Z,Y,L1), L=[X|L1].
connection(X,Y,L) :- parent(Z,Y), connection(X,Z,L1), append(L1,[Y],L).





/* Facts */

equalRank(emperor, empress).
equalRank(king, queen).
equalRank(grand_duke, grand_duchess).
equalRank(grand_prince, grand_princess).
equalRank(archduke, archduchess).
equalRank(duke, duchess).
equalRank(prince, princess).
equalRank(marquess, marchioness).
equalRank(count, countess).
equalRank(earl, countess).
equalRank(viscount, viscountess).
equalRank(baron, baroness).
equalRank(knight, dame).
equalRank(lord, lady).
equalRank(civilian, civilian).


lowerrank(king, emperor).
lowerrank(king, empress).
lowerrank(queen, emperor).
lowerrank(queen, empress).
lowerrank(grand_duke, king).
lowerrank(grand_duke, queen ).
lowerrank(grand_duchess, king).
lowerrank(grand_duchess, queen).
lowerrank(grand_prince, grand_duke).
lowerrank(grand_prince, grand_duchess).
lowerrank(grand_princess, grand_duke).
lowerrank(grand_princess, grand_duchess).
lowerrank(archduke, grand_prince).
lowerrank(archduke, grand_princess).
lowerrank(archduchess, grand_prince).
lowerrank(archduchess, grand_princess).
lowerrank(duke, archduke).
lowerrank(duke, archduchess).
lowerrank(duchess, archduke).
lowerrank(duchess, archduchess).
lowerrank(prince, duke).
lowerrank(prince, duchess).
lowerrank(princess, duke).
lowerrank(princess, duchess).
lowerrank(marquess, prince).
lowerrank(marquess, princess).
lowerrank(marchioness, prince).
lowerrank(marchioness, princess).
lowerrank(count, marquess).
lowerrank(earl, marquess).
lowerrank(count, marchioness).
lowerrank(earl, marchioness).
lowerrank(countess, marquess).
lowerrank(countess, marchioness).
lowerrank(viscount, count).
lowerrank(viscount, countess).
lowerrank(viscountess, count).
lowerrank(viscountess, countess).
lowerrank(baron, viscount).
lowerrank(baron, viscountess).
lowerrank(baroness, viscount).
lowerrank(baroness, viscountess).
lowerrank(knight, baron).
lowerrank(knight, baroness).
lowerrank(dame, baron).
lowerrank(dame, baroness).
lowerrank(lord, dame).
lowerrank(lord, knight).
lowerrank(lady, knight).
lowerrank(lady, dame).
lowerrank(civilian, knight).
lowerrank(civilian, dame).



/* Lower Rank Relationship */
lowercheck(X, Y) :- lowerrank(Y, X).
lowercheck(X,Y) :- lowerrank(Y,Z), lowercheck(X,Z).
lowercheck(X,Y) :- equalRank(A,X), lowercheck(A,Y).
lowercheck(X,Y) :- equalRank(A,Y), lowercheck(X,A).

lowerthan(_,[]).
lowerthan(X,[H|T]) :- position(X,A,_), position(H,B,_),lowercheck(A,B), lowerthan(X,T).



/* Higher Rank Relationship */
higherthan(_,[]).
higherthan(X,[H|T]) :- position(X,A,_), position(H,B,_),lowercheck(B,A), higherthan(X,T).


/* Equal Rank Relationship */
equal(X,Y) :- X=Y.
equal(X,Y) :- equalRank(A,X), equal(A,Y).
equal(X,Y) :- equalRank(A,Y), equal(X,A).

sameas(_,[]).
sameas(X,[H|T]) :- position(X,A,_), position(H,B,_), equal(A,B), sameas(X,T).