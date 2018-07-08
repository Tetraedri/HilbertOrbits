function w = HilbertSolarSystem(freq)
    kmax = 2*max(freq)+1;
    n = length(freq);
    w = zeros(n, kmax);
    for i = 1:n
        k = freq(i);
        h = Hilbert(i+1);
        h = [h + 2i, -h - 2i];
        h = Interpolate(h, 2);
        h = [h(end), h(1:end-1)];
        w(i,1:2*k+1) = ft2(h, k);
    end
    for i = n:-1:2
        w(i,:) = w(i,:) - w(i-1,:);
    end
end