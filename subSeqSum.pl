subseq([],[]).
subseq([H|T],[H|R]):- subseq(T,R).
subseq([H|T],R):- subseq(T,R).
sum([],0).
sum([H|T],M):- sum(T,N),M is H+N.
subseqSum(L,M,X):- subseq(L,Y),sum(Y,M),X=Y.
