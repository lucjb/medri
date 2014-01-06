reset
set ylabel "Random Space Dimension"
set xlabel "{/Symbol e}"
max(x,y) = (x > y) ? x : y
epsilon(mean, stddev) = max(abs(mean+stddev), abs(mean-stddev))

n=42905;
e(x)=(a+b*c)*log(n)/x
fit e(x) 'jl.dat' u  ((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3):1 via a, b, c

set autoscale
set xrange[0:0.14]
set yrange[0:3000]
set terminal postscript eps color enhanced "Helvetica" 20
set output "epsilon-sparse.eps"
plot 'jl.dat' using  (epsilon($15, $14)):1 with lines title "Empirical results", (0.075+b*b)*log(42905)/( ((x**2)/2)-((x**3)/3)) title 'Theoretical model'




set autoscale
set xlabel "Random Space Dimension"
set ylabel "{/Symbol e}^2/2-{/Symbol e}^3/3"
set terminal postscript eps color enhanced "Helvetica" 20
set output "epsilonFit-sparse.eps"
plot 'jl.dat' using  1:((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3) title "Empirical results", e(x) title "Achlioptas Model" 



