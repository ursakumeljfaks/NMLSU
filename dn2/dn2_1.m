A = [4 -2 -4; -1 5 -5; 7 -3 1]; 
B = [1; -1; 2]; 
C = [1 0 0]; 

% 1a -> glej zapiske
W = @(t) integral(@(t)(expm(-A*t)*B*B'*expm(-A'*t)),0,t,"ArrayValued",true);
eM = @(t) [expm(A*t), expm(A*t)*W(t);
           zeros(size(A)), expm(-A'*t)];

odg1a = norm(eM(3));

% 1b -> kle bi lah gledala tut eig(A-BK)
K = @(t) B'*inv(W(t));
sys = ss(A-B*K(3),B,C,0); % -> gledamo matriko A-BK
odg1b = pole(sys); % ->  odg je -1.281589993946604

% 1c
f = @(tt) max(real(pole(ss(A-B*K(tt),B,C,0)))) + 1.4;
odg1c = fzero(f,3);

% 1d
eig(A);
% ni nobene lastne vrednosti z NEgativnim realnim delom in beta > 0, zato
% je mnozica takih lastnih vrednosti prazna, zato beta = 1
beta = 1;
Z = lyap(A+beta.*eye(3),-2.*B*B');
Knew = B'*inv(Z);
odg1d = max(abs(eig(A-B*Knew)));
