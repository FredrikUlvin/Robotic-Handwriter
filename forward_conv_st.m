function [c,ceq] = forward_conv_st(x, pos)
    ceq(1) = (.5 + .5 + x(2)) * cos(x(1)) + .5 * cos(x(1) + x(3)) - pos(1);
    ceq(2) = (.5 + .5 + x(2)) * sin(x(1)) + .5 * sin(x(1) + x(3)) - pos(2);
    c = [];
end