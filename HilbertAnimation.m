function M = HilbertAnimation(freq, frames)
    M(frames) = struct('cdata', [], 'colormap', []);
    colors = ['g','b','r'];
    planets = length(freq);
    kmax = max(freq);
    solar = HilbertSolarSystem(freq);
    k = zeros(1, 2*kmax+1);
    for j = 1:kmax
        k(2*j) = j;
        k(2*j+1) = -j;
    end
    paths = zeros(planets, frames);
    f = figure('visible', 'off');
    idx = 1;
    threshold = .02;
    for t = linspace(0, 1, frames)
        hold on
        pos = 0;
        for p = 1:planets
            w = solar(p, :);
            for j = 1:length(k)
                r = w(j);
                rad = abs(r);
                if(abs(r) > threshold)
                    rectangle('Position', [real(pos)-rad, imag(pos)-rad, 2*rad, 2*rad], ...
                              'Curvature', [1, 1]);
                end
                newpos = pos + r*exp(2i*pi*t*k(j));
                if(abs(r) > threshold)
                    plot(real([pos, newpos]), imag([pos, newpos]), 'k');
                end
                pos = newpos;
            end
            %pos = pos + sum(w.*exp(2i*pi*t*k));
            paths(p, idx) = pos;
            %plot(real(pos), imag(pos), 'bo', 'MarkerFaceColor', colors(p));
        end
        for j = 1:planets
            plot(real(paths(j, 1:idx))', imag(paths(j, 1:idx))', colors(j))
            plot(real(paths(j, idx)), imag(paths(j,idx)), 'wo', 'MarkerFaceColor', colors(j))
        end
        axis([-4, 4, -4, 4]);
        M(idx) = getframe;
        if(mod(idx, 50) == 0)
            display(idx);
        end
        
        clf
        idx = idx+1;
    end
end