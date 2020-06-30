function f_y_matrix = f_y(y,t,mu,h,N)
    
    f_y_matrix = zeros(N,N);
    for n = 1:N
        f_y_matrix(n,n) = -1/h - exp(t + y(n));
    end
    for n = 1:(N - 1)
        f_y_matrix(n,n + 1) = 1/h;
    end

end
