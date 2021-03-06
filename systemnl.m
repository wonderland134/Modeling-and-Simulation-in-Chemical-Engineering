function fx = systemnl(val)
    A = val(1);
    B = val(2);
    C = val(3);
    fx(1) = 14*A + (2*B)/(C - 140) + (2*B)/(C - 176) + (2*B)/(C - 339/2) + (2*B)/(C - 766/5) + (2*B)/(C - 1241/10) + (2*B)/(C - 1307/10) + (2*B)/(C - 1831/10) - 114935667882869757/9007199254740992;
    fx(2) = (2*(A + B/(C - 1307/10) - 6652362732336511/4503599627370496))/(C - 1307/10) + (2*(A + B/(C - 766/5) - 1))/(C - 766/5) + (2*(A + B/(C - 1831/10)))/(C - 1831/10) + (2*(A + B/(C - 140) - 45775923466173/35184372088832))/(C - 140) + (2*(A + B/(C - 1241/10) - 28183737421757/17592186044416))/(C - 1241/10) + (2*(A + B/(C - 176) - 5422874305198591/18014398509481984))/(C - 176) + (2*(A + B/(C - 339/2) - 6295762102141697/9007199254740992))/(C - 339/2);
    fx(3) = - (2*B*(A + B/(C - 176) - 5422874305198591/18014398509481984))/(C - 176)^2 - (2*B*(A + B/(C - 339/2) - 6295762102141697/9007199254740992))/(C - 339/2)^2 - (2*B*(A + B/(C - 1307/10) - 6652362732336511/4503599627370496))/(C - 1307/10)^2 - (2*B*(A + B/(C - 766/5) - 1))/(C - 766/5)^2 - (2*B*(A + B/(C - 1831/10)))/(C - 1831/10)^2 - (2*B*(A + B/(C - 140) - 45775923466173/35184372088832))/(C - 140)^2 - (2*B*(A + B/(C - 1241/10) - 28183737421757/17592186044416))/(C - 1241/10)^2;
end