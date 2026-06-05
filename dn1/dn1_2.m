% 2 NALOGA
G1 = tf([1],[1 1]);
G2 = tf([1 0],[1 2]);
H1 = tf([1],[1 3]);
H2 = tf([3],[1 4]);
H3 = tf([1 2],[1 5]);
K = 10;

% 2a
s = diagram(K, G1, G2, H1, H2, H3);
vsi_poli = pole(s);
realni_poli = vsi_poli(imag(vsi_poli) == 0);
odg2a = -2.737329566117706; % funckija pzmap(s) ti narise nicle in pole od s

% 2b
step(s);
podatki = stepinfo(s);
odg2b = podatki.SettlingTime;

% 2c
f1 = @(k) diagram(k, G1, G2, H1, H2, H3);
odg2c = fzero(@(k) dcgain(f1(k)) - 0.8,15);

% 2d
t = linspace(0,1,1000);
u = cos(5.*t).*exp(-t);
odg2d = fzero(@(k) max(lsim(f1(k),u,t))-0.1, 5);
