function w = ft(x, k)
    N = length(x);
    v = 0:N-1;
    if(k == 0)
        w = mean(x);
    else
        lx = [x(2:end), x(1)];
        b = -(2i*pi*k)/N;
        I1 = (exp(b*(v+1))-exp(b*v))/b;
        I2 = ((b-1)*exp(b*(v+1)) + exp(b*v))/(b^2);
        s1 = sum(x.*I1);
        s2 = sum((lx-x).*I2);
        w = (s1+s2)/N;
    end
end