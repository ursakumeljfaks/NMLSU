% 3 NALOGA
R = 2;
L = 0.2;
C = 0.15;
t = linspace(0,10,5000);

% 3a
A = [-R/L -1/L; 1/C 0];
B = [1/L; 0];
C = eye(2);
D = [0; 0];
x0 = [0 0]';

u = ones(1,length(t)); % enotska stopnica je vhod

sys = ss(A,B,C,D);
[y2,~] = lsim(sys,u,t,x0);
odg3a = mean(y2(:,1));

% 3b
idx = t >= 5;
% lsim(sys_w, cos(k.*t), t) vrne celoten potek napetosti w
% (idx) izbere le stabiliziran del
% max(...) izračuna amplitudo tega dela
function m = maksi_w_ustaljen(k, sys, t, idx)
    y = lsim(sys, cos(k.*t), t);
    w = y(:, 2);         % Vzamemo samo 2. stolpec (napetost w)
    w_stabilen = w(idx); % Vzamemo samo vrednosti od 5s do 10s
    m = max(w_stabilen);
end
odg3b = fzero(@(k) maksi_w_ustaljen(k, sys, t, idx) - 0.1, 10);

% 3c
v0 = impulse(sys,t);  % enotksi impulz
v1 = ones(size(t)); % enotska stopnica
v2 = t; % enotska rampa

i0 = v0(:,1);
[y_v1, ~] = lsim(sys, v1, t); i1 = y_v1(:,1);
[y_v2, ~] = lsim(sys, v2, t); i2 = y_v2(:,1);

M = [i0, i1, i2];
b = 0.1 * ones(length(t), 1);
resitev = M\b;
odg3c = resitev(1);
