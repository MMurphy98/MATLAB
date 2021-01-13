function value = fre(b, a)
    b = max(b);
    n = length(a) - 1;
    p = roots(a);
    result = zeros(3,1001);
    cnt = 1;
    
    for w = 0:0.1*2*pi:100*2*pi
        abs_tmp = 1;
        angle_tmp = 0;
        for k = 1:n
            p_tmp = w*1i - p(k);
            abs_tmp = abs_tmp * abs(p_tmp);
            angle_tmp = angle_tmp + rad2deg(angle(p_tmp));
        end
        
        %disp(angle_tmp);
        result(1,cnt) = w / (2*pi);
        result(2,cnt) = b / abs_tmp;
        
        if angle_tmp > 180
            result(3,cnt) = -angle_tmp + 360;
        else
            result(3,cnt) = -angle_tmp;
        end
        
        cnt = cnt + 1;
    end
    
    figure(1); plot(result(1, :), result(2, :));
    grid on; hold on;
    
    figure(2); plot(result(1, :), result(3, :));
    grid on; hold on;

end
