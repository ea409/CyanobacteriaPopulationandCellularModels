ya = [10 7 3 10 10 10];
yb = [10 10 10 10 10];
yc = [10 10 10 10 10 10];


[t, eat2] = poprun_nondiazotroph(365*24*3, ya, 52, 0.05, 0.15, 0.01);


hold all

plot(t, eat2(:,2))
