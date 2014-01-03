set terminal latex
set output '"Documento no guardado 1"-gnuplottex-fig1.tex'
plot [0:2*pi] sin(x) title 'Sine', cos(x) title 'Cosine'
