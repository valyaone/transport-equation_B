function f_vector = f(y,t,mu,h,N)
    
    f_vector = zeros(N,1);
    for n = 1:(N - 1)
        f_vector(n) = (y(n + 1) - y(n))/h + 1 - exp(t + y(n));
    end
    f_vector(N) = (mu(t) - y(N))/h + 1 - exp(t + y(N));

end