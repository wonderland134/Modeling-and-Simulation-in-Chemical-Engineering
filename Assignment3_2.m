clear
clc

%Assignment3-2

%미분된 함수 구하는 섹션
P = [1 2 5 10 20 30 40];
T = [-183.1 -176 -169.5 -153.2 -140 -130.7 -124.1];

%log10P(atm) = A + B/(T('C)+C)
logP = log10(P);

syms x y A B C
S_temp = (y-A-B/(x+C))^2;

%S = sigma_i(logP_i - A - B/(T_i + C)^2)
%as/aA = sigma_i(2*A-2*logP_i + 2*B/(C+T))
%as/aB = sigma_i((2*A-logP_i+B/(C+T))/(C+T))
%as/aC = sigma_i(-(2*B*(A-logP_i+B/(C+T)))/(C+T)^2)

for i=1:length(P)
    try
        S = S + subs(S_temp, [x, y], [T(i), logP(i)]);
    catch
        S = subs(S_temp, [x, y], [T(i), logP(i)]);
    end
end

aA = diff(S, A)
aB = diff(S, B)
aC = diff(S, C)

%해를 구하는 섹션
val_init = [4 -300 270];
coeff = fsolve('systemnl', val_init);
A = coeff(1)
B = coeff(2)
C = coeff(3)
T_array = linspace(-190, -110, 1000);
P_array = 10.^(A+B./(T_array+C));
plot(T, P, 'ro')
hold on
plot(T_array, P_array, 'b-')
grid()
xlabel('Temperature (degree C)')
ylabel('Pressure (atm)')
title('Antoine equation of oxygen')
