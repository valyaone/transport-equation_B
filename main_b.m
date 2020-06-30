clear; clc;

a = -1; b = 0;
t_0 = 0; T = 1.0;

mu = @(t) log(2./(exp(t) - 2*t.*exp(-t)));
u_init = @(x) log(2./(1 - 2*x));

N = 50;
M = 50;

a_11 = (1 + 1i)/2;

h = (b - a)/N;
tau = (T - t_0)/M;

x = a:h:b;
t = t_0:tau:T;

u = zeros(M + 1,N + 1);

u(1,:) = u_init(x);

y = zeros(M + 1,N);

y(1,:) = u(1,1:N);

for m = 1:M
    
    w_1 = (eye(N) - a_11*tau*f_y(y(m,:),t(m),mu,h,N))\f(y(m,:),t(m) + tau/2,mu,h,N);
    y(m + 1,:) = y(m,:) + tau*real(w_1)';
    
    u(m + 1,1:N) = y(m + 1,:);
    u(m + 1,N + 1) = mu(t(m + 1));
    
end

figure;
for m = 1:(M + 1)
    plot(x,u(1,:),'-g','LineWidth',3); hold on;
    plot(x,u(m,:),'-or','MarkerSize',3,'LineWidth',3); hold on;
    axis([a b -0.6 1.2]);
    xlabel('X');
    ylabel('U');
    title('Решение уравнения переноса');
    txt2 = num2str(m); txt1 = 'Итерация = ';
    txt = [txt1 ' ' txt2] ;
    text(-0.3,0.85,txt);
    legend('Начальное условие','Решение'); %из-за этого тормозит
    hold off; drawnow; pause(0.01);
    
end






