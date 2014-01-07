reset
set ylabel "Performance"
set xlabel "Dimensionality"
max(x,y) = (x > y) ? x : y
epsilon(mean, stddev) = max(abs(mean+stddev), abs(mean-stddev))

#dim	MAP	Avg P	Avg R	F	HR	FH	cosMSE	cosVar	cosDev	cosMean	euclMSE	euclVar	euclDev	euclMean

set terminal postscript eps color enhanced
set ylabel "Hit Ratio"
set output "hr.eps"
plot 'jl-dense.dat' using  1:(epsilon($15, $14)) with lines title "Relative Error",  'jl-dense.dat' using 1:($6-0.8) with lines title "Hit Ratio"
set ylabel "F-Score"
set output "fscore.eps"
plot 'jl-dense.dat' using  1:(epsilon($15, $14)) with lines title "Relative Error", 'jl-dense.dat' using 1:($5-0.2) with lines title "F-Score"
set ylabel "Recall"
set output "recall.eps"
plot 'jl-dense.dat' using  1:(epsilon($15, $14)) with lines title "Relative Error", 'jl-dense.dat' using 1:($4-0.15) with lines title "Recall"
set ylabel "Precision"
set output "precision.eps"
plot 'jl-dense.dat' using  1:(epsilon($15, $14)) with lines title "Relative Error", 'jl-dense.dat' using 1:($3-0.26) with lines title "Precision"
set ylabel "MAP"
set output "map.eps"
plot 'jl-dense.dat' using  1:(epsilon($15, $14)) with lines title "Relative Error", 'jl-dense.dat' using 1:($2-0.1) with lines title "Map"


