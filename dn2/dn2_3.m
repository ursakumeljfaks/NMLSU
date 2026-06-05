 A = [1 2; 3 4]; 
 B = [-3; 2]; 
 C = [1 2]; 
 Q = eye(2); 

 % 3a -> glej list
 R = 1; 
 E = eye(2);
 S = zeros(2,1);
 G = zeros(2);
 X = @(alpha) icare(A+alpha.*eye(2),B,Q,R,S,E,G);
 K = @(alpha) inv(R)*B'*X(alpha);
 sys = @(alpha) ss(A-B*K(alpha),B,C,0);
 f = @(alpha) max(real(pole(sys(alpha)))) + 10;
 odg3a = fzero(f,4);

% 3b
% za t vzamemo bolj gosto mrezo, da dosezemo njihovo natancnost
f2 = @(alpha) min(impulse(sys(alpha),0:0.0001:5)) + 0.2;
odg3b = fzero(f2,10);


