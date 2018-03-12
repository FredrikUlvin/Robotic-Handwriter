% Assignment 8 main script
close all;
clear all;
clc;

% Tuning param set point
Kp = diag([1, 1, 1]);
Kd = diag([5.4, 5.5, 3.8]);

% Tuning var inverse reg.
w = 6;
K0 = diag([w^3,w^3,w^3.5]);
K1 = diag([2*w,2*w,4*w]);  

% Goal points for setpoint reg.
qd1 = 1;
qd2 = 1;
qd3 = 1;

% Path generating variables
k_ts = 0.29;
time_gain_ts = .278;
R_ts = .5;
l_ts = .95;

% Run simulation
sim('model8')

%%
figure(1)
plot(PD)
legend('Xref','Yref','Zref','X','Y','Z')
grid on;
title('Setpoint PD with grav. comp. ')

figure(2)
plot(inverse)
legend('Xref','Yref','Zref','X','Y','Z')
grid on;
title('Trajectory following inverse controller.')

figure(3)
hold on;
plot(inverse1.Data(:,1), inverse1.Data(:,2), 'b');
plot(inverse1.Data(:,4), inverse1.Data(:,5), 'r');
grid on;
hold off;
axis equal;

h = figure(4);
%axis([-1 2 0 2.1]) % this ensures that getframe() returns a consistent size
%axis equal;
%grid on;
filename = 'robotdrawing.gif';
anim_start = 6;
for n = anim_start:length(inverse.Data(:,4))
    % Draw plot for y = x.^n
    axis([-.75 1 0 2.1]) % this ensures that getframe() returns a consistent size
    axis equal;
    hold on;
    plot(inverse1.Data(:,1), inverse1.Data(:,2), 'b');
    ref = plot(inverse1.Data(n,1), inverse1.Data(n,2),'bO');
    plot(inverse1.Data(anim_start:n,4), inverse1.Data(anim_start:n,5), 'r', 'LineWidth',2);
    first_link = line([0 inverse1.Data(n,10)], [0 inverse1.Data(n,11)],'Color','black', 'LineWidth',2);
    second_link = line([inverse1.Data(n,10), inverse1.Data(n,7)],[inverse1.Data(n,11) inverse1.Data(n,8)],'Color', 'green', 'LineWidth',2);
    third_link = line([inverse1.Data(n,7), inverse1.Data(n,4)],[inverse1.Data(n,8) inverse1.Data(n,5)],'Color', 'black', 'LineWidth',2);
    legend('Reference Path', 'Current path ref.','End effector path', 'First Robot link', 'Second link', 'Third link', 'Location', 'southwest');
    hold off;
    drawnow 
      % Capture the plot as an image
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256);
      % Write to the GIF File 
      if n == anim_start
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','DelayTime',0.025,'WriteMode','append'); 
      end
      clf;
end

%%

h = figure(5);
%axis([-1 2 0 2.1]) % this ensures that getframe() returns a consistent size
%axis equal;
%grid on;
filename = 'optimal.gif';
anim_start = 6;
for n = anim_start:length(testt.Data(:,4))
    % Draw plot for y = x.^n
    axis([-.75 1 0 2.1]) % this ensures that getframe() returns a consistent size
    axis equal;
    hold on;
    plot(inverse1.Data(:,1), inverse1.Data(:,2), 'b');
    ref = plot(inverse1.Data(n,1), inverse1.Data(n,2),'bO');
    plot(testt.Data(anim_start:n,1), testt.Data(anim_start:n,2), 'r', 'LineWidth',2);
    first_link = line([0 testt.Data(n,7)], [0 testt.Data(n,8)],'Color','black', 'LineWidth',2);
    second_link = line([testt.Data(n,7), testt.Data(n,4)],[testt.Data(n,8) testt.Data(n,5)],'Color', 'green', 'LineWidth',2);
    third_link = line([testt.Data(n,4), testt.Data(n,1)],[testt.Data(n,5) testt.Data(n,2)],'Color', 'black', 'LineWidth',2);
    legend('Reference Path', 'Current path ref.','End effector path', 'First Robot link', 'Second link', 'Third link', 'Location', 'southwest');
    hold off;
    drawnow 
      % Capture the plot as an image
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256);
      % Write to the GIF File 
      if n == anim_start
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
      else 
          imwrite(imind,cm,filename,'gif','DelayTime',0.025,'WriteMode','append'); 
      end
      clf;
end