function x = ResiDelta(A1,B1,C1,A2,B2,C2,z)
delta0 = kron(B1,C2) - kron(C1,B2);
delta1 = kron(A1,C2) - kron(C1,A2);
b = delta1*z;
x = delta0\b;
end