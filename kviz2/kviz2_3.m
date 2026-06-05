 A = [1.90 2.0; 3.0 8.40]; B = [5.0; 6.00]; C = [7.0 8.0]; Q = eye(2); 

 % 3a
 R = 1; 
 E = eye(2);
 S = zeros(2,1);
 G = zeros(2);
 X = @(alpha) icare(A+alpha.*eye(2),B,Q,R,S,E,G);
 K = @(alpha) inv(R)*B'*X(alpha);
 sys = @(alpha) ss(A-B*K(alpha),B,C,0);
 f = @(alpha) max(real(pole(sys(alpha)))) + 5;
 alpha1 = fzero(f,4);
 odg3a = norm(K(alpha1));

 % 3b
t = linspace(0,10,5000);
u = ones(1,length(t));
f2 = @(alpha) min(lsim(sys(alpha),u,t)) + 0.5;
odg3b = fzero(f2,7);
