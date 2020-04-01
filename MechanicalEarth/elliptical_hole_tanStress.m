% calculate and plot normal stress acting tangential
% to boundary of elliptical hole 
clear all, clf reset; % clear memory and figures
s1 = 0; s3 = -1; p = 0; % remote stress and internal pressure
a = 1; b = .25; % semi-major and -minor axial lengths
ETD=-90:1:90; ETR=ETD*pi/180;   % angle eta
amb = a^2 - b^2;
hold on; axis([-90 90 -10 10]); 
xlabel('Eta (degrees)'), title('Elliptical Hole');
ylabel('Tangential stress/Internal pressure');
C=['b' 'g' 'r' 'c' 'm' 'y' 'k']
for k = 1:7
    be = (k-1)*15; ber = be*pi/180; % angle beta
    c2b = cos(2*ber); C2E = cos(2*ETR);
    DEN = (a^2 + b^2) - amb*C2E;
    T1 = (s1+s3+2*p)*(2*a*b)./DEN;
    T2 = (s1-s3)*(((a+b)^2)*(cos(2*(ber-ETR))) - amb*c2b)./DEN;
    ST = -p + T1 + T2;
    plot(ETD,ST,C(k));
end
legend('0','15','30','45','60','75','90');
