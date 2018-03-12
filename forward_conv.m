function F = forward_conv(x, l, pos)
    F(1) = (l(2) + l(1) + x(2)) * cos(x(1)) + l(3) * cos(x(1) + x(3)) - pos(1);
    F(2) = (l(2) + l(1) + x(2)) * sin(x(1)) + l(3) * sin(x(1) + x(3)) - pos(2);
end