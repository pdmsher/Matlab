
fplot('x.*sin(x)/cos(x)*sin(x) + 15', [0 10*pi]); 
xlabel('0 < x < 10 * pi');
ylabel('Peaks and Valleys');


print('-dtiff','myoutput1.jpg')
