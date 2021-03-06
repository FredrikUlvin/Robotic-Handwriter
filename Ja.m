function Ja = Ja_calc(q)
%% This function calcuates the robots inertial mass.
% Input:
%   Orientation and extention of robot jonts.
%
% (4.89) Page 141 in Spong
%% Parameters
% Global variables in MATLAB if preferred (remove comments in that case)
% global m1 m2 m3;            % Masses
% global l1 l2 l3;            % Link lengths
% global lc1 lc2 lc3; 	      % Centers of mass
% global In1yy In2zz In3zz;   % Moment of inertia

q1 = q(1);  % Orientation of first joint
q2 = q(2);  % Length of extention of second joint
q3 = q(3);  % Orientation of third joint

m1 = 5; m2 = 5; m3 = 5;
l1 = 0.5; l2 = 0.5; l3 = 0.5;
lc1 = 0.5/2; lc2 = -0.5/2; lc3 = 0.5/2;
In1yy = 1/12*(m1*(l1)^2);
In2zz = 1/12*(m2*(l2)^2);
In3zz = 1/12*(m3*(l3)^2);

J = [...
        -(l1 + q2) * sin(q1) - l2 * sin(q1 + q3)    0        -l2*sin(q1 + q3)   ;...
         (l1 + q2) * cos(q1) + l2 * cos(q1 + q3)    0         l2*cos(q1 + q3)   ;...
         0                                          1           0               ;...
         0                                          0           0               ;...
         0                                          0           0               ;...
         1                                          0           1               ;...
    ];

B = [ ...
        0 0 0;...
        0 1 0;...
        1 0 1;...
    ];

Ja = [ ...
        eye(3) zeros(3,3)   ;...
        zeros(3,3)  inv(B)  ;...
     ] * J;
end