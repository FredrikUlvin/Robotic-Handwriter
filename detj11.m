syms q1 q2 q3;

%q1 = 0;
q2 = -1;
%q3 = -3;

l1 = .5;
l2 = .5;
l3 = .5;

J11 = [ -(sin(q1)*(l1 + l2 + q2) + sin(q1 + q3)*l3)     0       -sin(q1 + q3) * l3;...
          cos(q1)*(l1 + l2 + q2) + cos(q1 + q3)*l3      0        cos(q1 + q3)*l3;...
          0                                             1           0];
a = solve(det(J11) == 0, [q1 q2 q3])