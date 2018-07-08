function res = Interpolate(z, f)
    res = zeros(1, f*length(z));
    for i = 0:length(z)-2
        for j = 0:f-1
            res(1+i*f+j) = z(i+1) + j*(z(i+2)-z(i+1))/f;
        end
    end
    for j = 0:f-1
        res(1+(length(z)-1)*f+j) = z(end) + j*(z(1) - z(end))/f;
    end
end