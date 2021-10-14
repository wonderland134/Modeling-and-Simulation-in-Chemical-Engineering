%Assignment3-1

T = linspace(10,70,7);
u = [1.308 1.005 0.801 0.656 0.549 0.469 0.406];
%1/u = k1 + k2T + k3T^2

coeff = polyfit(T, 1./u, 2);

T_array = linspace(0,80,1000);
u_inverse_array = coeff(3) + coeff(2) * T_array + coeff(1) * T_array.^2;

plot(T, 1./u, 'o')
hold on
plot(T_array, u_inverse_array)
xlabel('Temeprature(degree C)')
ylabel('1/u (in cP)')
grid()

k1 = coeff(3)
k2 = coeff(2)
k3 = coeff(1)