% 1 NALOGA
% 1a
m = 1;
b = 0.8;
A = [0, 0, 1, 0;
     0, 0, 0, 1;
     0, 0, -b/m, 0;
     0, 0, 0, -b/m];

B = [0, 0;
     0, 0;
     1/m, 0;
     0, 1/m];

C = eye(4);
D = zeros(4, 2);

sys = ss(A,B,C,D);
odg1a = norm(A) + norm(B)

% 1b
t = linspace(0,10,1000);
u = [cos(t); sin(t)];     % ux = cos(t), uy = sin(t)
x0 = [0 0 0 0]';

y= lsim(sys,u,t);
pot = y(end, 1:2);
odg1b = norm(pot)

% 1c
% Matrika C mora vračati samo lokacijo (prvi dve stanji), 
% da jo lahko primerjamo z r(t) = [rx; ry]
C_pos = [1 0 0 0; 
         0 1 0 0];
D_pos = zeros(2, 2);

sys_odprta = ss(A, B, C_pos, D_pos);
% Sklenemo zanko: vhod postane referenca r(t)
sys_zaprta = feedback(sys_odprta, eye(2));
t2 = linspace(0, 8, 1000); % Več točk za boljšo natančnost
r = [cos(t2) + t2; sin(t2) + t2]; % Referenca mora biti v stolpcih

y2 = lsim(sys_zaprta, r, t2);

referencna = r(:,end);
dejanska = y2(end,:)';

odg1c = norm(dejanska-referencna)