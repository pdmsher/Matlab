x = linspace(0, 100*pi,1000);
y= (x.*x+15*x+12).*sin(x); 
comet(x, y);

print('-dtiff','myoutput5.jpg')