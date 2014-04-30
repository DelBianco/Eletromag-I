 #!/bin/bash

gnuplot Ex.gp

python Ex.py > Sig.dat

gnuplot Ex2.gp

pdflatex Ex.tex



