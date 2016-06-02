% Armando Freire,
% Francis Lagueu Fogang,
% Moises Alvarez
%
% Project 4 - Comp 333
% Due: May 10, 2016

% Problem 1

% Armando Family Tree
male(armando).
male(armandos).
male(lucas).
male(jacque).
male(jared).
male(jayron).
male(victor).
female(karen).
female(janel).
female(nelia).
female(percila).

parent(armandos,armando).
parent(armandos,lucas).
parent(karen,armando).
parent(karen,lucas).
parent(jacque,jared).
parent(jacque,jayron).
parent(jacque,janel).
parent(nelia,jared).
parent(nelia,jayron).
parent(nelia,janel).
parent(victor,karen).
parent(victor,jacque).
parent(percila,karen).
parent(percila,jacque).

mother(X,Y) :- female(X), parent(X,Y).
father(X,Y) :- male(X), parent(X,Y).
sibling(X,Y) :- X \= Y, parent(Z,X), parent(Z,Y).
brother(X,Y) :- male(X), sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).
uncle(X,Y) :- male(X), parent(Z,Y), Z \= X, brother(X,Z).
aunt(X,Y) :- female(X), parent(Z,Y), Z \= X, sister(X,Z).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandmother(X,Y) :- female(X), grandparent(X,Y).
grandfather(X,Y) :- male(X), grandparent(X,Y).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
firstCousin(X,Y) :- mother(Z,X), aunt(Z,Y).
firstCousin(X,Y) :- father(Z,X), uncle(Z,Y).
descendant(X,Y) :- ancestor(Y,X).
relative(X,Y) :- ancestor(Z,X), ancestor(Z,Y).
relative(X,Y) :- descendant(Z,X), descendant(Z,Y).

%===============================================================================

% Moises Family Tree

female(maricela).
female(nancy).
female(rose).
female(sandra).
female(mari).
female(milin).
female(paula).
female(samantha).
female(vanessa).
female(mary).
female(martha).
female(stella).
female(daniela).
female(sandra).
female(maida).
female(mariela).
female(harminia).
female(maria).
female(carmen).
female(tona).
female(erminia).

male(fernando_Sr).
male(cesar).
male(moises).
male(fernando_Jr).
male(esteban).
male(victor_Sr).
male(victor_Jr).
male(omar).
male(jovani).
male(jose_Sr).
male(jose_Jr).
male(saul).
male(felix_Sr).
male(felix_Jr).
male(brayan).
male(pollo).
male(gabriel).
male(alex).
male(michael).
male(jose_f).
male(daniel).
male(juan).
male(pedro).
male(hugo).
male(adrian).
male(abraham).
male(brayan).
male(espiriron_Jr).
male(pablo_Jr).
male(espiririon_Sr).
male(pablo_Sr).

parent(espiriron_Sr,espiririon_Jr).
parent(erminia,espiririon_Jr).
parent(gomez,maria).
parent(callez,maria).

parent(espiriron_Jr,fernando_Sr).
parent(espiriron_Jr,victor_Sr).
parent(espiriron_Jr,jose_Sr).
parent(espiriron_Jr,felix_Sr).
parent(espiriron_Jr,pollo).
parent(espiriron_Jr,stella).
parent(espiriron_Jr,milin).

parent(maria,fernando_Sr).
parent(maria,victor_Sr).
parent(maria,jose_Sr).
parent(maria,felix_Sr).
parent(maria,pollo).
parent(maria,stella).
parent(maria,milin).

parent(pablo_Sr,pablo_Jr).
parent(carmen,pablo_Jr).
parent(leal,tona).
parent(loyal,tona).

parent(pablo_Jr,maricela).
parent(pablo_Jr,rose).
parent(pablo_Jr,hugo).

parent(tona,maricela).
parent(tona,rose).
parent(tona,hugo).

parent(fernando_Sr,moises).
parent(fernando_Sr,cesar).
parent(fernando_Sr,esteban).
parent(fernando_Sr,nancy).
parent(fernando_Sr,fernando_Jr).

parent(maricela,moises).
parent(maricela,cesar).
parent(maricela,esteban).
parent(maricela,nancy).
parent(maricela,fernado_Jr).

parent(victor_Sr,victor_Jr).
parent(victor_Sr,omar).
parent(victor_Sr,jovani).
parent(victor_Sr,samantha).

parent(jose_Sr,jose_Jr).
parent(jose_Sr,saul).
parent(jose_Sr,vanessa).
parent(jose_Sr,mary).

parent(felix_Sr,felix_Jr).
parent(felix_Sr,brayan).
parent(felix_Sr,martha).

parent(pollo,gabriel).
parent(pollo,alex).
parent(pollo,michael).
parent(pollo,mariela).
parent(pollo,harminia).

parent(stella,daniela).
parent(stella,sandra).
parent(stella,maida).
parent(stella,jose_f).
parent(stella,daniel).

parent(rose,sandra).
parent(rose,mari).
parent(rose,juan).
parent(rose,pedro).

parent(milin,paula).

parent(hugo,adrian).
parent(hugo,abraham).
parent(hugo,brayan).

ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z), ancestor(Z,Y).
grandparent(X,Y):- parent(X,Z), parent(Z,Y).
grandmother(X,Y):- female(X), grandparent(X,Y).
grandmother(X,Y):- male(X), grandparent(X,Y).
grandfather(X,Y):- male(X), grandparent(X,Y).
mother(X,Y):- female(X), parent(X,Y).
father(X,Y):- male(X), parent(X,Y).

aunt(X,Y):- sister(X,Z), parent(Z,Y).
aunt(X,Y):- parent(Z,Y), aunt(X, Z).
uncle(X,Y):- brother(X,Z), parent(Z,Y).
uncle(X,Y):- parent(Z, Y),uncle(X,Z).
firstcousin(X,Y):- parent(Z,X), parent(W, Y), sister(Z, W).
firstcousin(X, Y):- parent(Z,X), parent(W, Y), brother(Z, W).
sister(X,Y):- female(X), father(Z,X), father(Z,Y), mother(W, X), mother(W, Y),   X \= Y.
brother(X,Y):- male(X), father(Z, X), father(Z,Y), mother(W, X), mother(W, Y), X \= Y.
descendant(X, Y):- parent(Y, X).
descendant(X, Y):- parent(Y, Z), descendent(X, Z).
relative(X,Y):- ancestor(Z, X), ancestor(Z, Y).
relative(X,Y):- descendant(Z, X), descendant(Z, Y).
relative(X,Y):- descendant(X,Y).
relative(X,Y):- ancestor(X,Y).

%===============================================================================

% Francis Family Tree

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

% ==============================================================================

% Problem 2

letter(X):- member(X, [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]).
f(X) :- append(['('|Y], [')'], X), e(Y).
f([X]) :- letter(X).
f([X]) :- number(X).
t(X) :- append(L1, [*|L2], X), t(L1), f(L2).
t(X) :- append(L1, [/|L2], X), t(L1), f(L2).
t(X) :- f(X).
e(X) :- append(L1, [+|L2], X), e(L1), t(L2).
e(X) :- append(L1, [-|L2], X), e(L1), t(L2).
e(X) :- t(X).

% ==============================================================================

% Problem 3

subseq([],[]).
subseq([H|T],[H|R]):- subseq(T,R).
subseq([H|T],R):- subseq(T,R).
sum([],0).
sum([H|T],M):- sum(T,N),M is H+N.
subseqSum(L,M,X):- subseq(L,Y),sum(Y,M),X=Y.

%===============================================================================

% Problem 4

fsm(0,[a|T]) :- fsm(0,T).
fsm(0,[b|T]) :- fsm(0,T).
fsm(0,[a|T]) :- fsm(1,T).
fsm(1,[b|T]) :- fsm(2,T).
fsm(2,[b|T]) :- fsm(3,T).
fsm(3,[a|T]) :- fsm(3,T).
fsm(3,[b|T]) :- fsm(3,T).
fsm(3,[]).
