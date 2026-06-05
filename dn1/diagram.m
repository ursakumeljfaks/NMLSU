function s = diagram(K, G1, G2, H1, H2, H3)

A1 = feedback(G1,H2);
A2 = series(A1,G2);
A3 = feedback(A2,H1);
A4 = feedback(A3,H3);
A5 = series(K,A4);
A6 = series(A5,tf([1],[1 0]));
s = feedback(A6,1);

end