clean: cleanTex cleanImages cleanFits
cleanTex :
	rm -f medri.aux medri.fdb_latexmk medri.log medri.nav medri.out medri.snm medri.toc medri.pdf

cleanImages:
	rm -f histogramAll.png histogram400.png histogram2000.png *.eps *eps-converted-to.pdf
cleanFits:
	rm -f fit.log *.temp

pdf: clean images
	latexmk -pdf

images:
	gnuplot histogram100.p histogram400.p histogram2000.p histogram.p epsilon.p epsilon-dense.p tradeoffs.p correlation.p



