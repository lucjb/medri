reset
max(x,y) = (x > y) ? x : y
set multiplot layout 3,1



set autoscale
#k(x) = ((((log(1/(1-a)))/(log(42905)))*b+c)*log(42905))/((x**2/2)-(x**3/3))	
n=42905;
k(x)=a*log(n)/(x**2)

a=3;b=1
fit k(x) 'jl.dat' u (max(abs($15 + 3*$14), abs($15 - 3*$14))):1 via a
plot 'jl.dat' using 1:12 with lines title 'euclMse', 'jl.dat' using 1:13 with lines title 'euclVar', 'jl.dat' using 1:14 with lines title 'euclDev', 'jl.dat' using 1:15:14 title 'euclMean' with yerrorbars, 'jl.dat' using 1:15 with lines notitle
set yrange [100:2000]
set xrange [0:1]

plot 3.4591*log(n)/(x**2), (3.4591+0.27)*log(n)/(x**2), (3.4591-0.27)*log(n)/(x**2), 'jl.dat' us (max(abs($15 + 3*$14), abs($15 - 3*$14))):1

set autoscale
plot'jl.dat' using 1:8 with lines title 'cosMSE', 'jl.dat' using 1:9 with lines title 'cosVar', 'jl.dat' using 1:10 with lines title 'cosDev', 'jl.dat' using 1:11 with lines notitle, 'jl.dat' using 1:11:10 title 'cosMean' with yerrorbars 

set autoscale
plot 'jl.dat' using 1:2 with lines title 'MAP', 'jl.dat' using 1:3 with lines title 'P', 'jl.dat' using 1:4 with lines title 'R', 'jl.dat' using 1:5 with lines title 'F', 'jl.dat' using 1:6 with lines title 'Hit Ratio', 'jl.dat' using 1:7 with lines title 'F-Hit Ratio'

unset multiplot



