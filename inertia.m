function M = inertia(q)
%% This function calcuates the robots inertial mass.
% Input:
%   Orientation and extention of robot jonts.
%
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

%% Matrices
% (8.21) Page 295 in book: M(q)*DDq + C(q,Dq)*Dq + G(q) = u
% Inertia matrix
M = [0.2e1 * m3 * lc3 * cos(q1 + q3) * sin(q1) * q2 - 0.2e1 * m3 * lc3 * sin(q1 + q3) * cos(q1) * q2 + (m2 + m3) * q2 ^ 2 - 0.2e1 * m2 * lc2 * q2 + m1 * lc1 ^ 2 + In1yy + m2 * lc2 ^ 2 + In3zz + In2zz + m3 * lc3 ^ 2 -m3 * lc3 * sin(q1) * sin(q1 + q3) - m3 * lc3 * cos(q1) * cos(q1 + q3) m3 * lc3 ^ 2 - m3 * lc3 * sin(q1 + q3) * cos(q1) * q2 + m3 * lc3 * cos(q1 + q3) * sin(q1) * q2 + In3zz; -m3 * lc3 * sin(q1) * sin(q1 + q3) - m3 * lc3 * cos(q1) * cos(q1 + q3) m2 + m3 -m3 * lc3 * sin(q1) * sin(q1 + q3) - m3 * lc3 * cos(q1) * cos(q1 + q3); m3 * lc3 ^ 2 - m3 * lc3 * sin(q1 + q3) * cos(q1) * q2 + m3 * lc3 * cos(q1 + q3) * sin(q1) * q2 + In3zz -m3 * lc3 * sin(q1) * sin(q1 + q3) - m3 * lc3 * cos(q1) * cos(q1 + q3) m3 * lc3 ^ 2 + In3zz;];

end