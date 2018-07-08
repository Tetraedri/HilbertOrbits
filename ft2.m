function w = ft2(z, k)
    w = zeros(1, 2*k+1);
    w(1) = ft(z, 0);
    for i = 1:k
        w(2*i) = ft(z,i);
        w(2*i+1) = ft(z,-i);
    end
end