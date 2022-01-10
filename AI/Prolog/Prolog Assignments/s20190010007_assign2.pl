/* -------------------------------------------
This Assignment is done by Anirudh Jakhotia
Roll No : S20190010007
------------------------------------------ */


/* -----------------
PROBLEM - 1
------------------- */


/* Facts */

/*First Heirarchy*/ 

name(elizabeth,"Elizabeth II").
name(phil,"Philip").

name(charles,"Charles").
name(diana,"Diana").
name(camilla,"Camilla").

name(william,"William").
name(catherine,"Catherine").
name(harry,"Harry").
name(meghan,"Meghan").

name(george,"George").
name(charlotte,"Charlotte").
name(louis,"Louis").
name(hari,"Archie Harrison").

/*Second Heirarchy*/

name(mark,"Mark Phillips").
name(anne,"Anne").
name(timothy,"Timothy Laurence").

name(autumn,"Autumn Phillips").
name(peter,"Peter Phillips").
name(zara,"Zara Tindall").
name(mike,"Mike Tindall").

name(savannah,"Savannah").
name(isla,"Isla").
name(mia,"Mia Grace").
name(lena,"Lena Elizabeth").

/*Third Heirarchy*/

name(andrew,"Andrew").
name(sarah,"Sarah").

name(beatrice,"Beatrice").
name(edoardo,"Edoardo Mapelli Mozzi").
name(eugenie,"Eugenie").
name(brooks,"Jack Brooksbank").

name(aug,"August Phillip").

/*Fourth Heirarchy*/

name(edward,"Edward").
name(sophie,"Sophie").

name(louise,"Louise").
name(james,"James").

/*Gender Classification for men */

male(peter).
male(andrew).
male(william).
male(george).
male(louis).
male(phil).
male(edward).
male(mark).
male(charles).
male(brooks).
male(mike).
male(mapelli).
male(harry).
male(timothy).
male(james).
male(hari).
male(aug).

/*Gender Classification for women */

female(elizabeth).
female(anne).
female(sarah).
female(diana).
female(camilla).
female(sophie).
female(autumn).
female(zara).
female(beatrice).
female(eugenie).
female(isla).
female(mia).
female(catherine).
female(charlotte).
female(meghan).
female(louise).
female(savannah).
female(lena).

/*Parent Facts */

parent(elizabeth,charles).
parent(elizabeth,anne).
parent(elizabeth,andrew).
parent(elizabeth,edward).

parent(charles,william).
parent(charles,harry).
parent(diana,william).
parent(diana,harry).

parent(anne,peter).
parent(anne,zara).
parent(mark,peter).
parent(mark,zara).


parent(phil,charles).
parent(phil,anne).
parent(phil,andrew).
parent(phil,edward).

parent(edward,louise).
parent(edward,james).
parent(sophie,louise).
parent(sophie,james).

parent(william,george).
parent(william,charlotte).
parent(william,louis).

parent(andrew,beatrice).
parent(andrew,eugenie).
parent(sarah,beatrice).
parent(sarah,eugenie).

parent(catherine,george).
parent(catherine,charlotte).
parent(catherine,louis).

parent(peter,savannah).
parent(peter,isla).
parent(autumn,savannah).
parent(autumn,isla).

parent(harry,hari).
parent(meghan,hari).

parent(eugenie,aug).
parent(brooks,aug).

parent(zara,mia).
parent(zara,lena).
parent(mike,mia).
parent(mike,lena).

/*Position Facts */


/*First Heirarchy*/

position(elizabeth, queen, england).
position(phil, duke, edinburgh).

position(charles, prince, wales).
position(diana, princess, whales).
position(camilla, duchess, cornwall).

position(william, duke, cambridge).
position(catherine, duchess, cambridge).
position(harry, duke, sussex).
position(meghan, duchess, sussex).

position(george, prince, cambridge).
position(charlotte, princess, cambridge).
position(louis, prince, cambridge).
position(hari, civilian, england).

/*Second Heirarchy*/

position(mark, captain, england).
position(anne, prince, royal).
position(timothy, civilian, england).

position(autumn, civilian, england).
position(peter, civilian, england).
position(zara, civilian, england).
position(mike, civilian, england).

position(savannah, civilian, england).
position(isla, civilian, england).
position(mia, civilian, england).
position(lena, civilian, england).


/*Third Heirarchy*/

position(andrew, duke, york).
position(sarah, duchess, york).

position(beatrice, princess, york).
position(edoardo, civilian, england).
position(eugenie, princess, york).
position(brooks, civilian, england).

position(aug, civilian, england).


/*Fourth Heirarchy*/

position(sophie, countess, wessex).
position(edward, earl, sussex).

position(louise, lady, windsor).
position(james, viscount, severn).


/* -----------------
Defining Rules
------------------- */

/* Father Relationship */
father(X,Y) :- parent(X,Y), male(X).

/* Mother Relationship */
mother(X,Y) :- parent(X,Y), female(X). 

/* Siblings Relationship */
siblings(X,Y) :- parent(Z,X), parent(Z,Y), not(X=Y).

/* Descendant Relationship */
descendant(X, Y) :- father(Y, X); mother(Y, X).
descendant(X, Y) :- (father(Z, X); mother(Z, X)),descendant(Z, Y).

/* First Cousin Relationship */
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

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
    cousinparent(Z,X),(parent(Z,Y);grandparent(Z,Y)).

/* Connection Relationship */
connection(X,Y,L) :- siblings(X,Y), L=[X,Y].
connection(X,Y,L) :- parent(Z,X), connection(Z,Y,L1), L=[X|L1].
connection(X,Y,L) :- parent(Z,Y), connection(X,Z,L1), append(L1,[Y],L).


/* -----------------
PROBLEM - 2
------------------- */


/* Facts */


/*Equal Rank Facts */

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

/*Lower Rank Facts */

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


/* -----------------
Defining Rules
------------------- */

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


/* -----------------
Thank You!
------------------- */