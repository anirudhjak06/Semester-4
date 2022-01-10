name(elizabeth,"Elizabet II").
name(phillip, "Philip").
name(diana,"Diana").
name(charles, "Charles").
name(camilla,"Camilla").
name(mark, "Mark Phillips").
name(anne, "Anne").
name(tim, "Timothy Laurence").
name(andrew, "Andrew").
name(sarah, "Sarah").
name(edward, "Edward").
name(sophie, "Sophie").
name(peter, "Peter Phillips").
name(autumn, "Autumn Phillips").
name(zara, "Zara Tindall").
name(mike, "Mike Tindall").
name(william, "William").
name(catherine, "Catherine").
name(harry, "Harry").
name(meghan,"Meghan").
name(beatrice,"Beatrice").
name(edoardo, "Edoardo Mapelli Mozzi").
name(eugenie, "Eugenie").
name(jack, "Jack Brooksbank").
name(louise, "Louise Windsor").
name(james, "James").
name(george, "George").
name(charlotte, "Charlotte").
name(louis, "Louis").
name(archie, "Archie Harrison").
name(savannah, "Savannah").
name(isla, "Isla").
name(mia, "Mia Grace").
name(lena, "Lena Elizabeth").
name(aug, "August Philip").


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


male(phillip).
male(charles).
male(mark).
male(tim).
male(andrew).
male(edward).
male(peter).
male(mike).
male(william).
male(harry).
male(edoardo).
male(jack).
male(james).
male(george).
male(louis).
male(archie).
male(aug).


parent(elizabeth, charles).
parent(elizabeth, anne).
parent(elizabeth, andrew).
parent(elizabeth, edward).
parent(phillip, charles).
parent(phillip, anne).
parent(phillip, andrew).
parent(phillip, edward).
parent(diana, william).
parent(diana, harry).
parent(charles, william).
parent(charles, harry).
parent(anne, peter).
parent(anne, zara).
parent(mark, peter).
parent(mark, zara).
parent(sarah, beatrice).
parent(sarah, eugenie).
parent(andrew, beatrice).
parent(andrew, eugenie).
parent(sophie, louise).
parent(sophie, james).
parent(edward, louise).
parent(edward, james).
parent(catherine, george).
parent(catherine, charlotte).
parent(catherine, louis).
parent(william, george).
parent(william, charlotte).
parent(william, louis).
parent(meghan, archie).
parent(harry, archie).
parent(autumn, savannah).
parent(autumn, isla).
parent(peter, savannah).
parent(peter, isla).
parent(zara, mia).
parent(zara, lena).
parent(mike, mia).
parent(mike, lena).
parent(eugenie, aug).
parent(jack, aug).


position(elizabeth, queen, england).
position(phillip, duke, edinburgh).
position(diana, princess, whales).
position(charles, prince, wales).
position(camilla, duchess, cornwall).
position(anne, prince, royal).
position(mark, captain, england).
position(tim, civilian, england).
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
position(aug, civilian, england).
 

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


/* father relation ship */
father(X,Y):- parent(X,Y) , male(X).

/* mother relation ship */
mother(X,Y):- parent(X,Y) , female(X).

/* sibling relation ship */
sibling(X,Y):- parent(Z,X), parent(Z,Y), \+(X=Y).

/*----------- descendant relation ship ------------- */
/*We use recursion here*/

/*base case*/
descendant(X,Y):-parent(Y,X).    
/*recursive case*/
descendant(X,Y):- parent(Z, X),descendant(Z,Y).

/*----------- First Cousins relation ship ------------- */

firstCousin(X,Y):-parent(Z1,X), parent(Z2,Y), sibling(Z1,Z2), \+(X=Y).

/*----------- Cousins relation ship ------------- */
cousin(X,Y):- firstCousin(X,Y).
cousin(X,Y):- parent(Z1,X), parent(Z2,Y), cousin(Z1, Z2).








