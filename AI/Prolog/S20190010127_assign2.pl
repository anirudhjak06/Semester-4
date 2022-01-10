name(elizabeth,'Elizabeth II').
name(philip,'Philip').
name(charles,'Charles').
name(anne,'Anne').
name(andrew,'Andrew').
name(edward,'Edward').
name(diana,'Diana').
name(camilla,'Camilla').
name(mark,'Mark Philips').
name(tim,'Timothy Laurence').
name(sara,'Sarah').
name(sophie,'Sophie').
name(peter,'Peter Philips').
name(zara,'Zara Tindall').
name(autumn,'Autumn Philips').
name(mike,'Mike Tindall').
name(william,'William').
name(harry,'Harry').
name(catherine,'Catherine').
name(meghan,'Meghan').
name(beatrice,'Beatrice').
name(edoardo,'Edoardo Mapelli Mozzi').
name(eugenie,'Eugenie').
name(jack,'Jack Brooksbank').
name(louise,'Louise').
name(james,'James').
name(george,'George').
name(charlotte,'Charlotte').
name(louis,'Louis').
name(archie,'Archie Harrison').
name(savannah,'Savannah').
name(isla,'Isla').
name(mia,'Mia Grace').
name(lena,'Lena Elizabeth').
name(august,'August Philip').

gender(elizabeth,female).
gender(philip,male).
gender(charles,male).
gender(diana,female).
gender(camilla,female).
gender(anne,female).
gender(mark,male).
gender(tim,male).
gender(andrew,male).
gender(sara,female).
gender(edward,male).
gender(sophie,female).
gender(william,male).
gender(catherine,female).
gender(harry,male).
gender(meghan,female).
gender(peter,male).
gender(autumn,female).
gender(zara,female).
gender(mike,male).
gender(beatrice,female).
gender(edoardo,male).
gender(eugenie,female).
gender(jack,male).
gender(louise,female).
gender(james,male).
gender(george,male).
gender(charlotte,female).
gender(louis,male).
gender(archie,male).
gender(savannah,female).
gender(isla,female).
gender(mia,female).
gender(lena,female).
gender(august,male).

parent(elizabeth,charles).
parent(philip,charles).
parent(elizabeth,anne).
parent(philip,anne).
parent(elizabeth,andrew).
parent(philip,andrew).
parent(elizabeth,edward).
parent(philip,edward).
parent(diana,william).
parent(charles,william).
parent(diana,harry).
parent(charles,harry).
parent(anne,peter).
parent(mark,peter).
parent(anne,zara).
parent(mark,zara).
parent(sara,beatrice).
parent(andrew,beatrice).
parent(sara,eugenie).
parent(andrew,eugenie).
parent(sophie,louise).
parent(edward,louise).
parent(sophie,james).
parent(edward,james).
parent(catherine,george).
parent(william,george).
parent(catherine,charlotte).
parent(william,charlotte).
parent(catherine,louis).
parent(william,louis).
parent(meghan,archie).
parent(harry,archie).
parent(autumn,savannah).
parent(peter,savannah).
parent(autumn,isla).
parent(peter,isla).
parent(zara,mia).
parent(mike,mia).
parent(zara,lena).
parent(mike,lena).
parent(eugenie,august).
parent(jack,august).

position(elizabeth,queen,england).
position(philip,duke,edinburgh).
position(diana,princess,wales).
position(charles,prince,wales).
position(camilla,duchess,cornwall).
position(mark,captain,england).
position(anne,princess,royal).
position(tim,vice-admiral,england).
position(andrew,duke,york).
position(sara,duchess,york).
position(edward,earl,wessex).
position(sophie,countess,wessex).
position(william,duke,cambridge).
position(harry,duke,sussex).
position(catherine,duchess,cambridge).
position(meghan,duchess,sussex).
position(autumn,civilian,england).
position(peter, civilian, england).
position(zara, civilian, england).
position(mike, civilian, england).
position(beatrice,princess,york).
position(edoardo,civilian,england).
position(eugenie,princess,york).
position(jack,civilian,england).
position(louise,lady,windsor).
position(james,viscount,severn).
position(george,prince,cambridge).
position(charlotte,princess,cambridge).
position(louis,prince,cambridge).
position(archie, civilian, england).
position(savannahnnah, civilian, england).
position(isla, civilian, england).
position(mia, civilian, england).
position(lena, civilian, england).
position(august, civilian, england).

father(X,Y) :- parent(X,Y),gender(X,male).
mother(X,Y) :- parent(X,Y),gender(X,female).

sibling(X,Y) :- parent(Z,X), parent(Z,Y),\+(X=Y).

descendant(X,Y) :- parent(Y,X).
descendant(X,Y) :- parent(Z,X),descendant(Z,Y).

firstcousin(X,Y) :-
    parent(Z,X),parent(W,Y),sibling(Z,W).

cousin(X,Y) :- firstcousin(X,Y).
cousin(X,Y) :- parent(Z,X),parent(W,Y),cousin(Z,W).

connection(X,Y,L) :- X=Y,L=[X].
connection(X,Y,L) :- sibling(X,Y) , L=[X,Y].
connection(X,Y,L) :- parent(Z,X) , connection(Z,Y,L1) , L = [X|L1].
connection(X,Y,L) :- parent(Z,Y) , connection(X,Z,L1) , append(L1,[Y],L).


/*               Ranks              */
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
equalRank(count, earl).
equalRank(viscount, viscountess).
equalRank(baron, baroness).
equalRank(knight, dame).
equalRank(lord, lady).
equalRank(captain,vice-admiral).
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
lowerrank(captain,lord).
lowerrank(captain,lady).
lowerrank(vice-admiral,lord).
lowerrank(vice-admiral,lady).
lowerrank(civilian, captain).
lowerrank(civilian, vice-admiral).

lower(X,Y):-lowerrank(X,Y).
lower(X,Y):-lowerrank(X,Z),lower(Z,Y).

lowerthan(_,[]).
lowerthan(X,[H|T]):- position(X,Y1,_1),position(H,Y2,_2),lower(Y2,Y1),lowerthan(X,T).

higherthan(_,[]).
higherthan(X,[H|T]):- position(X,Y1,_1),position(H,Y2,_2),lower(Y1,Y2),higherthan(X,T).

sameas(_,[]).
sameas(X,[H|T]):- position(X,Y1,_1),position(H,Y2,_2),((Y1==Y2);equalRank(Y1,Y2);equalRank(Y2,Y1)),sameas(X,T).
