#!/bin/bash

python Ex.py > MatRho.dat

gnuplot Ex.gp

gnuplot Ex1.gp

python Ex1.py > MatV.dat

gnuplot Ex2.gp

pdflatex Ex.tex
