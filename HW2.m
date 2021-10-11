syms e1 e2

eq1 = (e1-e2)*(3*e1+e2)^3/((2-e1)*(8-e1-e2)*(10+2*e1)^2) == 1.930*10^(-4);
eq2 = e2*(3*e1+e2)/((e1-e2)*(8-e1-e2)) == 5.528;

e1_range = 0:0.001:1.999;
error = zeros(size(e1_range));
e2_result_by_eq1 = zeros(size(e1_range));
e2_result_by_eq2 = zeros(size(e1_range));

i = 1;

for e1_temp = e1_range
    eq1_temp = subs(eq1, e1, e1_temp);
    eq2_temp = subs(eq2, e1, e1_temp);
    e2_by_eq1 = double(vpasolve(eq1_temp, e2, [0, 1]));
    e2_by_eq2 = double(vpasolve(eq2_temp, e2, [0, 1]));
    
    try
        error(i) = abs(e2_by_eq1-e2_by_eq2);
        e2_result_by_eq1(i) = e2_by_eq1;
        e2_result_by_eq2(i) = e2_by_eq2;
    catch
        error(i) = 1;
        e2_result_by_eq1(i) = 1;
        e2_result_by_eq2(i) = 1;
    end
    i=i+1;
end

tiledlayout(1,2)

ax1 = nexttile;
plot(ax1, e1_range, error)
title(ax1, 'Error plot')
ylabel('e2 by eq1 - e1 by eq2')
xlabel('e1')
grid

ax2 = nexttile;
plot(ax2, e1_range, e2_result_by_eq1, e1_range, e2_result_by_eq2)
title(ax2, 'e2 value')
ylabel('e2 value')
xlabel('e1')
grid

ind = find(error == min(error))

e1 = e1_range(ind)
e2 = (e2_result_by_eq1(ind)+e2_result_by_eq2(ind))/2
Y_CO = (e1-e2)/(10+2*e1)
Y_H2 = (3*e1+e2)/(10+2*e1)
Y_H2O = (8-e1-e2)/(10+2*e1)
Y_CO2 = e2/(10+2*e1)
Y_CH4 = (2-e1)/(10+2*e1)
