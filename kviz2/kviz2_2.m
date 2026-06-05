n1 = 3; n2 = 2; A1 = -4.00*eye(n1) + magic(n1); B1 = 5*eye(n1) + ones(n1) + magic(n1)/2; C1 = 3*eye(n1) + ones(n1); A2 = -4.60*eye(n2) + magic(n2)/3; B2 = 2*eye(n2) - ones(n2) + magic(n2)/5; C2 = -4.40*eye(n2) - ones(n2); z = (1:n1*n2)';

x = ResiDelta(A1,B1,C1,A2,B2,C2,z);
odg2a = norm(x);

% 2b
n1 = 250; n2 = 300; A1 = -4.00*eye(n1) + magic(n1); B1 = 5*eye(n1) + ones(n1) + magic(n1)/2; C1 = 3*eye(n1) + ones(n1); A2 = -4.60*eye(n2) + magic(n2)/3; B2 = 2*eye(n2) - ones(n2) + magic(n2)/5; C2 = -4.40*eye(n2) - ones(n2); z = (1:n1*n2)';
x2 = ResiDelta2(A1,B1,C1,A2,B2,C2,z);
odg2b = norm(x2);

% 2c
N = n1 * n2;
Afun = @(v) ResiDelta2(A1, B1, C1, A2, B2, C2, v);
odg2c = eigs(Afun,N,1,'smallestabs');

% 2d
n1 = 25; n2 = 30; A1 = -4.00*eye(n1) + magic(n1); B2 = 2*eye(n2) - ones(n2) + magic(n2)/5; 
N = n1*n2;
% rešuje P*x = z, kjer P = I⊗A1 - B2'⊗I
solveP = @(z) solve_sep(A1, B2, z);
% rešuje P'*x = z
solvePt = @(z) solve_sep(A1', B2', z);
Afun2 = @(z) solvePt(solveP(z));
lambda = eigs(Afun2, N, 1, 'largestabs');
odg2d = sqrt(lambda);