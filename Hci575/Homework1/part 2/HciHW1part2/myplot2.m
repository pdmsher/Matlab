subplot(1, 2, 1);
t = linspace(0, 2*pi, 250); 
r = sqrt(abs(sin(3*t))); 
r1 = sqrt(abs(cos(3*t))); 
polarplot(t, r); 
subplot(1, 2, 2); 
polarplot(t, r1); 

print('-dtiff','myoutput2.jpg')