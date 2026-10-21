FROM texlive/texlive:latest-small

# latexmk: reruns pdflatex as needed; cm-super: vector fonts for the itemize bullets (TS1)
RUN tlmgr install latexmk cm-super

WORKDIR /work
