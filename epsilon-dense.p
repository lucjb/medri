reset
set xlabel "Random Space Dimension"
set ylabel "p({/Symbol e})"
max(x,y) = (x > y) ? x : y
epsilon(mean, stddev) = max(abs(mean+stddev), abs(mean-stddev))


set term png 
set output "medri/epsilon.png"
plot 'jl-dense.dat' using  1:(epsilon($15, $14)) with lines title "Empirical results"


m=42905;
e(x)=(a+b*c)*log(n)/x
et(x)=(4+2*0.57)*log(n)/x
fit e(x) 'jl-dense.dat' u  ((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3):1 via a, b, c
#fit et(x) 'jl-dense.dat' u  ((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3):1 via B


set terminal postscript eps color enhanced "Helvetica" 20
#set term png 
set output "medri/epsilonFit.eps"
plot 'jl-dense.dat' using  1:((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3) title "Empirical results", e(x) title "Achlioptas Model" 



