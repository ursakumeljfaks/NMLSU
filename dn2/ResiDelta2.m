function x = ResiDelta2(A1,B1,C1,A2,B2,C2,z)
n1 = size(A1, 1);
n2 = size(A2, 1);
Z = reshape(z, n2, n1);

F = C2 * Z * A1' - A2 * Z * C1';
% C2*X*B1' - B2*X*C1' = F
% (B2\C2)*X - X*(C1'/B1') = B2\F/B1'
    
M = B2 \ C2;
% M = inv(B2)*C2;
N = -(C1' / B1');
% N = -(C1'*inv(B1'));
Y = B2 \ F / B1';
% Y = inv(B2) * F * inv(B1');

% Rešimo Sylvestrovo enačbo M*X + X*N = Y
X = lyap(M, N, -Y);
% Rezultat pretvorimo nazaj v stolpčni vektor
x = X(:);

end