reset
set ylabel "Random Space Dimension"
set xlabel "{/Symbol e}"
max(x,y) = (x > y) ? x : y
epsilon(mean, stddev) = max(abs(mean+stddev), abs(mean-stddev))


set terminal postscript eps color enhanced "Helvetica" 20
set output "epsilon.eps"
plot 'jl-dense.dat' using  (epsilon($15, $14)):1 with lines title "Empirical results", (0.075+0.269*0.269)*log(42905)/( ((x**2)/2)-((x**3)/3)) title 'Theoretical model'


n=42905;
e(x)=(a+b*c)*log(n)/x
fit e(x) 'jl-dense.dat' u  ((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3):1 via a, b, c


set xlabel "Random Space Dimension"
set ylabel "{/Symbol e}^2/2-{/Symbol e}^3/3"
set terminal postscript eps color enhanced "Helvetica" 20
set output "epsilonFit.eps"
plot 'jl-dense.dat' using  1:((epsilon($15, $14)**2)/2-(epsilon($15, $14)**3)/3) title "Empirical results", e(x) title "Achlioptas Model" 



