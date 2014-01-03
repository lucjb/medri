reset
n=200 #number of intervals
max=1. #max value
min=-1. #min value
width=(max-min)/n #interval width
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set term png
set output "histogram400.png"
set xrange [-0.2:0.2]
#set yrange [0:0.1]
#to put an empty boundary around the
#data inside an autoscaled graph.
set offset graph 0.05,0.05,0.05,0.0
set boxwidth width*0.9
#set style fill solid 0.5 #fillstyle
#set tics out nomirror
set xlabel "Relative error"
set ylabel "Frequency"

stats 'jl-data.csv' using 4;
s=STATS_stddev;m=STATS_mean;
set table 'hist.temp'	
plot 'jl-data.csv' u (hist($4,width)):(1.0)/(width*STATS_records) smooth freq
unset table
gauss(x) = 1/(2*pi*s**2)**0.5*exp(-(x-m)**2/(2*s**2)) 
fit gauss(x) 'hist.temp' u 1:($2) via s, m

#set xtics 0.05
set xtics (STATS_mean-STATS_stddev, STATS_mean, STATS_mean+STATS_stddev)

set format x  "%10f"
set label 1 "Dim: 400" at -0.2,6
set label 2 gprintf("Mean = %g", STATS_mean) at -0.2,5.5
set label 3 gprintf("Std. Dev. = %g", STATS_stddev) at -0.2,5
set label 4 gprintf("Epsilon = %g", STATS_stddev+STATS_mean) at -0.2,4.5
set label 5 gprintf("Bin width: %g", width) at -0.2,4
set arrow from STATS_mean,0 to STATS_mean,7 nohead lc rgb 'blue' front
set arrow from STATS_mean+STATS_stddev,0 to STATS_mean+STATS_stddev,3.1 nohead lc rgb 'blue' front
set arrow from STATS_mean-STATS_stddev,0 to STATS_mean-STATS_stddev,3.3 nohead lc rgb 'blue' front
plot 'hist.temp' u 1:($2) w boxes lc rgb"green" title 'data',  gauss(x) title 'Gaussian fit' lc rgb"red"


	

