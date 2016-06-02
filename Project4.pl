male(francis).
male(raoul).
male(guy).
male(camille).
male(andre).
male(nathan).
male(diclan).
male(mael).
male(kaldrick).
male(junior).
male(wilfried).
male(pierre).
male(robert).
male(julien).
male(jean).
male(gilles).
male(henry).
male(gerard).
male(brice).
male(leon).
male(paul).


female(monique).
female(eleonore).
female(rosine).
female(vickye).
female(wilna).
female(vilma).
female(sammy).
female(kayla).
female(malya).
female(josya).
female(solange).
female(glwadys).
female(odette).
female(jeanne).
female(pauline).
female(henriette).
female(elise).
female(linette).

parent(andre, francis).
parent(andre, camille).
parent(andre, raoul).
parent(andre, guy).
parent(andre, eleonore).
parent(andre, rosine).
parent(andre, vickye).
parent(monique, francis).
parent(monique, camille).
parent(monique, raoul).
parent(monique, guy).
parent(monique, eleonore).
parent(monique, rosine).
parent(monique, vickye).
parent(raoul, sammy).
parent(raoul, nathan).
parent(guy, kayla).
parent(guy, malya).
parent(camille, mael).
parent(camille, junior).
parent(eleonore, diclan).
parent(rosine, kaldrick).
parent(vickye, vilma).
parent(vickye, wilna).
parent(wilfried, vilma).
parent(wilfried, wilna).
parent(brice, kaldrick).
parent(gerard, diclan).
parent(solange, sammy).
parent(solange, nathan).
parent(josya, kayla).
parent(josya, malya).
parent(glwadys, mael).
parent(glwadys, junior).
parent(odette, robert).
parent(pierre, robert).
parent(robert, julien).
parent(robert, pauline).
parent(robert, andre).
parent(robert, jean).
parent(jeanne, julien).
parent(jeanne, pauline).
parent(jeanne, andre).
parent(jeanne, jean).
parent(pauline, henry).
parent(pauline, yolande).
parent(donald, henry).
parent(donald, yolande).
parent(henriette, gilles).
parent(jean, gilles).
parent(leon, elise).
parent(linette, elise).
parent(elise, monique).
parent(paul, monique).


mother(X,Y):- female(X), parent(X,Y).
father(X,Y):- male(X), parent(X,Y).
grandparent(X,Y):- parent(X,Z), parent(Z,Y).
grandmother(X,Y):- female(X), grandparent(X,Y).
grandfather(X,Y):- male(X), grandparent(X,Y).

brother(X,Y):- male(X), parent(Z,X), parent(Z,Y), not(X=Y).
sister(X,Y):- female(X), parent(Z,X), parent(Z,Y), not(X=Y).
aunt(X,Y):- sister(X,Z), parent(Z,Y).
aunt(X,Y):- parent(Z,Y), aunt(X,Z).
uncle(X,Y):- brother(X,Z), parent(Z,Y).
uncle(X,Y):- parent(Z,Y), uncle(X,Z).
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).
descendant(X,Y):- parent(Y,X).
firstCousin(X,Y):- parent(Z,X), parent(W,Y), sister(Z,W).
firstCousin(X,Y):- parent(Z,X), parent(W,Y), brother(Z,W).
relative(X,Y):- ancestor(Z,X), ancestor(Z,Y), not(X=Y).
relative(X,Y):- descendant(Z,X), descendant(Z,Y), not(X=Y).



