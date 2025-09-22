# Free Stochastic Music by Computer

This is a recreation of the Fortran IV program recorded in Xenakis' Formalized
Music, Chapter 5: Free Stochastic Music by Computer.

## Original source

The original source materials are located in `ref`.

- Chapter 5 and Appendix 1 are digitized in `excerpt.pdf`, compiled from `main.tex`.
- Scans of the pages from the book are in `xenakis.pdf`.
- Source files for the figures are in `fig`.

## Recreation

There are three recreations, two in Fortran and the other in Python.

1. `main.f` is the file `XenFSM_1.f` from [this repository](https://github.com/ThemosTsikas/XenakisFreeStochasticMusicFortran).
   The `WRITE` statements in the added functions have been commented out.

   To compile:

   ```sh
   gfortran src/main.f -o fsm
   ```

   To run the program using the input data for Atrées (ST/10-3, 060962):

   ```sh
   ./fsm < ex/input.txt > output.txt
   ```

2. `main.f90` will be a fairly direct port of the logic as is written in the book.
3. `main.py` is a more modern interpretation in Python.

## Citation

Xenakis, Iannis. 1992. *Formalized Music: Thought and Mathematics in Composition*, second, revised English edition, with additional material translated by Sharon Kanach. Harmonologia Series No. 6. Stuyvesant, NY: Pendragon Press.
