clear all
close all

T=1;
z=tf('z',T);

X=(z^3+1)/(z^3-z^2-z-2);

Xtilde=X/z;
[num,den]=tfdata(Xtilde,'v');
[r,p]=residue(num,den)

modP=abs(p(3))
fasP=angle(p(3))+pi

modR=abs(r(3))
fasR=angle(r(3))