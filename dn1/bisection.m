function x = bisection(p, a, b, maxIter, tol)
% function x = bisection(p, a, b, maxIter, tol) z uporabo bisekcije najde
% ničlo polinoma p na začetnem intervalu [a, b]. Izvede največ maxIter
% korakov, oziroma dokler ne doseže tolerance tol.

y1 = polyval(p, a);
y2 = polyval(p, b);

y = Inf;
k = 0;

while k < maxIter && abs(y) > tol
    x = (b + a)/2;
    y = polyval(p, x);

    if y * y1 > 0
        a = x;
        y1 = y;
    else
        b = x;
        y2 = y;
    end
    k = k+1;
end

end