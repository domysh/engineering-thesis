#!/usr/bin/env bash

set -xe 
mkdir -p build
(ls build/main.aux &> /dev/null) || TEXINPUTS=./vendor//: pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -shell-escape -output-directory=build main.tex 
bibtex build/main &&\
TEXINPUTS=./vendor//: pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -shell-escape -output-directory=build main.tex && \
TEXINPUTS=./vendor//: pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -shell-escape -output-directory=build main.tex
