function x = solve_sep(A, B, z)

    n1 = size(A,1);
    n2 = size(B,1);

    Z = reshape(z, n1, n2);

    % A*X - X*B = Z
    % lyap rešuje A*X + X*C + D = 0
    % zato: A*X + X*(-B) - Z = 0

    X = lyap(A, -B, -Z);

    x = X(:);

end