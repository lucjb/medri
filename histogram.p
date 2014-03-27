reset
n=200 #number of intervals
max=1. #max value
min=-1. #min value
width=(max-min)/n #interval width
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set term png 
#set output terminal and file
set output "histogramAll.png"
set xrange [-0.5:0.5]
#set yrange [0:0.1]
#to put an empty boundary around the
#data inside an autoscaled graph.
set offset graph 0.05,0.05,0.05,0.0
set xtics min,(max-min)/20,max
set boxwidth width*0.9
set style fill solid 0.5 #fillstyle
#set tics out nomirror
set xlabel "Relative error"
set ylabel "Frequency"


stats 'jl-data.csv' using 1;
s1=STATS_stddev;m1=STATS_mean;
set table 'hist1.temp'	
plot 'jl-data.csv' u (hist($1,width)):(1/(STATS_records*width)) smooth freq
unset table
gauss1(x) = (1/(s1*((2*pi)**0.5)))*exp(-(x-m1)**2/(2*s1**2)) 
fit gauss1(x) 'hist1.temp' u 1:2 via s1, m1


stats 'jl-data.csv' using 5;
s2=STATS_stddev;m2=STATS_mean;
set table 'hist2.temp'	
plot 'jl-data.csv' u (hist($5,width)):(1.0)/(width*STATS_records) smooth freq
unset table
gauss2(x) = 1/(2*pi*s2**2)**0.5*exp(-(x-m2)**2/(2*s2**2)) 
fit gauss2(x) 'hist2.temp' u 1:($2) via s2, m2


stats 'jl-data.csv' using 20;
s3=STATS_stddev;m3=STATS_mean;
set table 'hist3.temp'	
plot 'jl-data.csv' u (hist($20,width)):(1.0)/(width*STATS_records) smooth freq
unset table
gauss3(x) = 1/(2*pi*s3**2)**0.5*exp(-(x-m3)**2/(2*s3**2)) 
fit gauss3(x) 'hist3.temp' u 1:($2) via s3, m3


#plot gauss(x) lc rgb"red" title 'Gaussian fit', gauss10(x) lc rgb"blue" title 'Gaussian fit 10', gauss8(x) lc rgb"green" title 'Gaussian fit 18'


#plot 'hist1.temp' u 1:($2) w boxes lc rgb"red" title 'data', gauss(x) title 'Gaussian fit', 'hist2.temp' u 1:($2) w boxes lc rgb"blue" title 'data', gauss10(x) title 'Gaussian fit', 'hist3.temp' u 1:($2) w boxes lc rgb"green" title 'data', gauss8(x) title 'Gaussian fit'

plot 'hist1.temp' u 1:2 w boxes lc rgb"red" title 'k=100', 'hist2.temp' u 1:2 w boxes lc rgb"blue" title 'k=500', 'hist3.temp' u 1:2 w boxes lc rgb"black" title 'k=2000', gauss1(x) lc rgb"green" notitle, gauss2(x) lc rgb"green" notitle, gauss3(x) lc rgb"green" notitle

	

