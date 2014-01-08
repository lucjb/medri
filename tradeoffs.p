reset
set xrange [20000:50000]
set yrange [1000:1500]
#plot (0.075+0.269*0.269)*log(x)/(0.05**2/2-0.05**3/3)

reset
set yrange [0:3000]
set xrange [0:1]
#plot (0.075+0.269*0.269)*log(42905)/( ((x**2)/2)-((x**3)/3))


n=42905

p1=99
b1=0.431732


p2=94
b2=0.263755

	
p3=90
b3=0.215866

p4=80
b4=0.150884


n2=429050

p1=99
b12=0.355082


p2=94
b22=0.216928


p3=90
b32=0.177541

p4=80
b42=0.124096


set yrange [50:3000]
set xrange [0.02:0.25]
set ytics 100
set xtics .025
set grid xtics mxtics ytics mytics back
set ylabel "Random Space Dimension"
set xlabel "{/Symbol e}"

#set terminal png
set terminal postscript eps color enhanced 15

set output "tradeoffs1.eps"
plot (0.075+0.269*b1)*log(n)/(((x**2)/2)-((x**3)/3)) lt rgb"red" title "p=0.99",  (0.075+0.269*b2)*log(n)/(((x**2)/2)-((x**3)/3)) lt rgb "green" title "p=0.94", (0.075+0.269*b3)*log(n)/(((x**2)/2)-((x**3)/3)) lt rgb"blue" title "p=0.90",  (0.075+0.269*b4)*log(n)/(((x**2)/2)-((x**3)/3)) lt rgb"black" title "p=0.80"

set output "tradeoffs2.eps"
#plot (0.075+0.269*b1)*log(n2)/(((x**2)/2)-((x**3)/3)) with linespoint lt rgb"red", (0.075+0.269*b2)*log(n2)/(((x**2)/2)-((x**3)/3)) with linespoint lt rgb"green", (0.075+0.269*b3)*log(n2)/(((x**2)/2)-((x**3)/3)) with linespoint lt rgb"blue",  (0.075+0.269*b4)*log(n2)/(((x**2)/2)-((x**3)/3))  with linespoint lt rgb"black" 

plot (0.075+0.269*b12)*log(n2)/(((x**2)/2)-((x**3)/3)) lt rgb"red" title "p=0.99", (0.075+0.269*b22)*log(n2)/(((x**2)/2)-((x**3)/3))  lt rgb"green" title "p=0.94", (0.075+0.269*b32)*log(n2)/(((x**2)/2)-((x**3)/3))  lt rgb"blue" title "p=0.90",  (0.075+0.269*b42)*log(n2)/(((x**2)/2)-((x**3)/3))   lt rgb"black" title "p=0.80"

set yrange [1000:2000]
set xrange [0.05:0.075	]
set xtics add (0.0652, 0.068)
set ytics ((0.075+0.269*b12)*log(n2)/(((0.05**2)/2)-((0.05**3)/3)), (0.075+0.269*b1)*log(n)/(((0.05**2)/2)-((0.05**3)/3)))
set output "tradeoffs3.eps"
plot (0.075+0.269*b1)*log(n)/(((x**2)/2)-((x**3)/3)) lt rgb"red" title "p=0.99, n", (0.075+0.269*b12)*log(n2)/(((x**2)/2)-((x**3)/3)) lt rgb"red" title "p=0.99 10n"


