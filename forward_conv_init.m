function q = forward_conv_init(q_in, l, coord)
    f = @(x)forward_conv(x, l, coord);
    q = fsolve(f, q_in); 
end