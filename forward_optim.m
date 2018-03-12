function q_opt = forward_optim(q_in, q0, pos)
    
    cost = @(q_opt)(q_opt - q_in)' * diag([10 100 1]) * (q_opt - q_in);
    
    function [c, ceq] = constrain(q)
        ceq = [ (.5 + .5 + q(2)) * cos(q(1)) + .5 * cos(q(1) + q(3)) - pos(1);
                 (.5 + .5 + q(2)) * sin(q(1)) + .5 * sin(q(1) + q(3)) - pos(2)
                 ];
        c = -(q'*q);
    end
    
    nonlin_con = @constrain;

    [q_opt, val] = fmincon(cost, q0, [], [], [], [], [], [], nonlin_con);%, 'Algorithm', 'trust-region-reflective');
end