reset
#set yrange [0:0.01]
n=3000;
max(x,y) = (x > y) ? x : y
epsilon(mean, stddev) = max(abs(stddev), abs(stddev))

m=42905;
e(x)=(a+b*c)*log(n)/x
et(x)=(4+2*0.57)*log(n)/x
fit e(x) 'jl.dat' u  ((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3):1 via a, b, c
#fit et(x) 'jl.dat' u  ((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3):1 via B



#plot 'jl.dat' using  1:((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3), e(x)


plot 'jl.dat' using  1:(epsilon($15, $14))

