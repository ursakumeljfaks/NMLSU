A = [-10.0 8.0 -5.0 1.0; 8.0 -9.0 -6.0 1.0; 1.0 10.0 -7.0 1.0; -4.70 -2.0 0.0 -4.0]; 
B = [1.0; -1.0; -4.80; 2.0]; 
C = [1.0 0.0 0.0 0.0]; 

% 1a
x0 = [1.0 0.0 -4.9 0.0]';

%M = [A B*B'; 0 -A'];
A2 = A + 6*eye(size(A));
W = @(t) integral(@(t)(expm(-A2*t)*B*B'*expm(-A2'*t)),0,t,"ArrayValued",true);
eM = @(t) [expm(A*t), expm(A*t)*W(t);
           zeros(size(A)), expm(-A'*t)];

b = eM(1);
blok = b(1:4,1:4);
odg1a = abs(eigs(blok));

% 1b
odg1b = norm(W(1))*norm(inv(W(1)));

% 1c
eig(A2);
beta = 12;
Z = lyap(A2+beta.*eye(4),-2.*B*B');
Knew = B'*inv(Z);
odg1c = norm(A2-B*Knew);

% 1d
sys = ss(A2-B*Knew,B,C,0);
t = linspace(0,0.5,1000);
u = sin(t);
odg1d = lsim(sys,u,t,x0);