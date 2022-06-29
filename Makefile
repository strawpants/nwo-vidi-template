#Makefile to compile vidi proposal 

#create a basename for the proposal
main1=mainVIDI2021_NAME
latcom=latexmk 
latopt=-lualatex --enable-write18 -f -latexoption=-halt-on-error

#note the plotgannt tool lives at: https://github.com/strawpants/plotGannt (this is just a copy of the state at 2022-06-29)
plotgannt=./plotGannt.py


all:  ${main1}.pdf 

figures/vidiGannt.pdf: tasks.yml ${plotgannt} 	
	${plotgannt} --output=figures/vidiGannt.pdf --title 'Project Timeline' tasks.yml

#make rules
${main1}.pdf: figures/vidiGannt.pdf ${main1}.tex
	${latcom} ${latopt} ${main1}.tex

quick: ${main1}.tex
	lualatex -halt-on-error ${main1}.tex


clean:
	rm -f *.bbl *blg *.aux *.pdf *.fdb_latexmk *.xdv
