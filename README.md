# Free Stochastic Music by Computer

This is a recreation of the Fortran IV program documented in Xenakis' Formalized
Music, Chapter 5: Free Stochastic Music by Computer [1](#citation).

## Reference materials

The original source (Chapter 5 and Appendix 1 of the book) is located in `refs`.

- Scans of the pages are in `xenakis.pdf`.
- LaTeX and LilyPond were used to digitally reconstruct the source in
  `excerpt.pdf`.
- Source files for the figures are in `fig`.

To compile,

```zsh
compilation instructions
```

## Program

There are three recreations in `src`, two in Fortran and the other in Python.

1. `main.f`: The goal is to copy the code directly from the book and get it to
   compile while making minimal changes.

   To compile and run the program using the input data for Atrées
   (ST/10-3, 060962):

   ```zsh
   gfortran -o fsm -std=legacy src/main.f
   ./fsm < input/input.txt > output.txt
   ```

2. `main.f90`: The goal is to convert the Fortran IV code to a modern version of
   Fortran while making minimal changes to the program logic.

   To compile and run the program using the input data for Atrées
   (ST/10-3, 060962):

   ```zsh
   gfortran -o fsm src/main.f
   ./fsm < input/input.txt > output.txt
   ```

3. `main.py`: The goal is to create a modern interpretation of the program in
   Python.

## Status

The reconstruction process for the program code is done in sections
(corresponding to the parts listed in Chapter 5, Position of the Problem). For
the individual sections, see `test`.

- typsetting the reference: :x:

  - Chapter 5 text: :x:
  - Figure 1: :x:
  - Figure 2: :x:
  - Figure 3: :x:
  - Figure 4: :x:
  - Figure 5: :x:
  - Appendix 1: :x:

- Fortran IV (`main.f`): :x:
  
  At this point, `main.f` is the file `XenFSM_1.f` from
  [this repository](https://github.com/ThemosTsikas/XenakisFreeStochasticMusicFortran).
  The `WRITE` statements in the added functions have been commented out.

  - section 0: :x:
  - section 1: :x:
  - section 2: :x:
  - section 3: :x:
  - section 4: :x:
  - section 5: :x:
  - section 6: :x:
  - section 7: :x:
  - section 8: :x:
  - section 9: :x:
  - section 10: :x:
  - section 11: :x:

- Modern Fortran (`main.f90`): :x:

  - section 0: :x:
  - section 1: :x:
  - section 2: :x:
  - section 3: :x:
  - section 4: :x:
  - section 5: :x:
  - section 6: :x:
  - section 7: :x:
  - section 8: :x:
  - section 9: :x:
  - section 10: :x:
  - section 11: :x:

- Python (`main.py`): :x:

## Notes

- In the book version of the code (`refs/fig-3-1.f`), line `XEN  128`,
  `((I,NT(I)),I=1,KTR)` does not compile. It is changed to `(I,NT(I),I=1,KTR)`
  in `src/main.f`.
- In the book version of the input data (`refs/fig-3-2.txt`), line 27 is missing.
  Since the format of the data for that line is `5I3` but only three variables
  are expected, `000000000` is inserted into `input/input.txt`.
- Carriage control characters displayed in the first column of the output have
  been replaced by ASCII characters.
- The variable `MODI = [7, 6, 5, 4, 3, 2, 1]` is used to search the `TETA` table
  for the closest value of `XLAMBDA` in section 7. The search process using
  these numbers is inaccurate, so in `main.f90`, `MODI` is changed to
  `[64, 32, 16, 8, 4, 2, 1]` to implement a binary search.

## Further processing

- Output can be
  [converted to MIDI](https://github.com/jaso-gerbs/xenakis-to-midi).
- Output can be printed to PDF on an
  [IBM 1403 Printer emulator](https://github.com/Pynckels/prt1403).

## Acknowledgements

- [Iannis Xenakis](https://en.wikipedia.org/wiki/Iannis_Xenakis), for pioneering
  and engineering this fascinating concept of using computers to create music.
- [ThemosTsikas](https://github.com/ThemosTsikas), for having a
  [working version of the original source](https://github.com/ThemosTsikas/XenakisFreeStochasticMusicFortran)
  to reference.

<a id="citation-link"></a>
## Citation

1. Xenakis, Iannis. 1992. *Formalized Music: Thought and Mathematics in Composition*, second, revised English edition, with additional material translated by Sharon Kanach. Harmonologia Series No. 6. Stuyvesant, NY: Pendragon Press.

---

:six: :seven:
