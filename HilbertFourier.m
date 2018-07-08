function fz = HilbertFourier(n, k)
    syms x;
    N = 2^(n+1);
    z = Hilbert(n, 0:2^n-1);
    w = [z+2i,-z-2i];
    c = 0;
    for i = N
        c = c + z*
    end
end