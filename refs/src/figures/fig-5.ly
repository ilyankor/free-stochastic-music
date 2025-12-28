\version "2.24.4"

%---------------CUSTOM DEFINITION FOR QUARTER TONE GLYPHS------------------%

% copied from: https://lsr.di.unimi.it/LSR/Item?id=784

% define the alterations as fraction of the equal-tempered whole tone
% use an alteration of 0.2 rather than 0.25 of a tone, so that
% LilyPond correctly recognizes the difference between each one
#(define-public DOUBLE-SHARP  10/10)
#(define-public SHARP-RAISE    7/10)
#(define-public SHARP          5/10)
#(define-public SHARP-LOWER    3/10)
#(define-public NATURAL-RAISE  2/10)
#(define-public NATURAL-LOWER -2/10)
#(define-public FLAT-RAISE    -3/10)
#(define-public FLAT          -5/10)
#(define-public FLAT-LOWER    -7/10)
#(define-public DOUBLE-FLAT  -10/10)

% extend the list of Dutch note names:
arrowedPitchNames =  #`(
    (ceses . ,(ly:make-pitch -1 0 DOUBLE-FLAT))
    (ceseh . ,(ly:make-pitch -1 0 FLAT-LOWER))
    (ces   . ,(ly:make-pitch -1 0 FLAT))
    (cesih . ,(ly:make-pitch -1 0 FLAT-RAISE))
    (ceh   . ,(ly:make-pitch -1 0 NATURAL-LOWER))
    (c     . ,(ly:make-pitch -1 0 NATURAL))
    (cih   . ,(ly:make-pitch -1 0 NATURAL-RAISE))
    (ciseh . ,(ly:make-pitch -1 0 SHARP-LOWER))
    (cis   . ,(ly:make-pitch -1 0 SHARP))
    (cisih . ,(ly:make-pitch -1 0 SHARP-RAISE))
    (cisis . ,(ly:make-pitch -1 0 DOUBLE-SHARP))

    (deses . ,(ly:make-pitch -1 1 DOUBLE-FLAT))
    (deseh . ,(ly:make-pitch -1 1 FLAT-LOWER))
    (des   . ,(ly:make-pitch -1 1 FLAT))
    (desih . ,(ly:make-pitch -1 1 FLAT-RAISE))
    (deh   . ,(ly:make-pitch -1 1 NATURAL-LOWER))
    (d     . ,(ly:make-pitch -1 1 NATURAL))
    (dih   . ,(ly:make-pitch -1 1 NATURAL-RAISE))
    (diseh . ,(ly:make-pitch -1 1 SHARP-LOWER))
    (dis   . ,(ly:make-pitch -1 1 SHARP))
    (disih . ,(ly:make-pitch -1 1 SHARP-RAISE))
    (disis . ,(ly:make-pitch -1 1 DOUBLE-SHARP))

    (eeses . ,(ly:make-pitch -1 2 DOUBLE-FLAT))
    (eses  . ,(ly:make-pitch -1 2 DOUBLE-FLAT))
    (eeseh . ,(ly:make-pitch -1 2 FLAT-LOWER))
    (eseh  . ,(ly:make-pitch -1 2 FLAT-LOWER))
    (ees   . ,(ly:make-pitch -1 2 FLAT))
    (es    . ,(ly:make-pitch -1 2 FLAT))
    (eesih . ,(ly:make-pitch -1 2 FLAT-RAISE))
    (esih  . ,(ly:make-pitch -1 2 FLAT-RAISE))
    (eeh   . ,(ly:make-pitch -1 2 NATURAL-LOWER))
    (e     . ,(ly:make-pitch -1 2 NATURAL))
    (eih   . ,(ly:make-pitch -1 2 NATURAL-RAISE))
    (eiseh . ,(ly:make-pitch -1 2 SHARP-LOWER))
    (eis   . ,(ly:make-pitch -1 2 SHARP))
    (eisih . ,(ly:make-pitch -1 2 SHARP-RAISE))
    (eisis . ,(ly:make-pitch -1 2 DOUBLE-SHARP))

    (feses . ,(ly:make-pitch -1 3 DOUBLE-FLAT))
    (feseh . ,(ly:make-pitch -1 3 FLAT-LOWER))
    (fes   . ,(ly:make-pitch -1 3 FLAT))
    (fesih . ,(ly:make-pitch -1 3 FLAT-RAISE))
    (feh   . ,(ly:make-pitch -1 3 NATURAL-LOWER))
    (f     . ,(ly:make-pitch -1 3 NATURAL))
    (fih   . ,(ly:make-pitch -1 3 NATURAL-RAISE))
    (fiseh . ,(ly:make-pitch -1 3 SHARP-LOWER))
    (fis   . ,(ly:make-pitch -1 3 SHARP))
    (fisih . ,(ly:make-pitch -1 3 SHARP-RAISE))
    (fisis . ,(ly:make-pitch -1 3 DOUBLE-SHARP))

    (geses . ,(ly:make-pitch -1 4 DOUBLE-FLAT))
    (geseh . ,(ly:make-pitch -1 4 FLAT-LOWER))
    (ges   . ,(ly:make-pitch -1 4 FLAT))
    (gesih . ,(ly:make-pitch -1 4 FLAT-RAISE))
    (geh   . ,(ly:make-pitch -1 4 NATURAL-LOWER))
    (g     . ,(ly:make-pitch -1 4 NATURAL))
    (gih   . ,(ly:make-pitch -1 4 NATURAL-RAISE))
    (giseh . ,(ly:make-pitch -1 4 SHARP-LOWER))
    (gis   . ,(ly:make-pitch -1 4 SHARP))
    (gisih . ,(ly:make-pitch -1 4 SHARP-RAISE))
    (gisis . ,(ly:make-pitch -1 4 DOUBLE-SHARP))

    (aeses . ,(ly:make-pitch -1 5 DOUBLE-FLAT))
    (ases  . ,(ly:make-pitch -1 5 DOUBLE-FLAT))
    (aeseh . ,(ly:make-pitch -1 5 FLAT-LOWER))
    (aseh  . ,(ly:make-pitch -1 5 FLAT-LOWER))
    (aes   . ,(ly:make-pitch -1 5 FLAT))
    (as    . ,(ly:make-pitch -1 5 FLAT))
    (aesih . ,(ly:make-pitch -1 5 FLAT-RAISE))
    (asih  . ,(ly:make-pitch -1 5 FLAT-RAISE))
    (aeh   . ,(ly:make-pitch -1 5 NATURAL-LOWER))
    (a     . ,(ly:make-pitch -1 5 NATURAL))
    (aih   . ,(ly:make-pitch -1 5 NATURAL-RAISE))
    (aiseh . ,(ly:make-pitch -1 5 SHARP-LOWER))
    (ais   . ,(ly:make-pitch -1 5 SHARP))
    (aisih . ,(ly:make-pitch -1 5 SHARP-RAISE))
    (aisis . ,(ly:make-pitch -1 5 DOUBLE-SHARP))

    (beses . ,(ly:make-pitch -1 6 DOUBLE-FLAT))
    (beseh . ,(ly:make-pitch -1 6 FLAT-LOWER))
    (bes   . ,(ly:make-pitch -1 6 FLAT))
    (besih . ,(ly:make-pitch -1 6 FLAT-RAISE))
    (beh   . ,(ly:make-pitch -1 6 NATURAL-LOWER))
    (b     . ,(ly:make-pitch -1 6 NATURAL))
    (bih   . ,(ly:make-pitch -1 6 NATURAL-RAISE))
    (biseh . ,(ly:make-pitch -1 6 SHARP-LOWER))
    (bis   . ,(ly:make-pitch -1 6 SHARP))
    (bisih . ,(ly:make-pitch -1 6 SHARP-RAISE))
    (bisis . ,(ly:make-pitch -1 6 DOUBLE-SHARP))
)
pitchnames = \arrowedPitchNames
#(ly:parser-set-note-names pitchnames)

% the symbols for each alteration
arrowGlyphs = #`(
    (,DOUBLE-SHARP . "accidentals.doublesharp")
    (,(+ SHARP SHARP-LOWER) . "accidentals.sharp.arrowup")
    (,SHARP-RAISE  . "accidentals.sharp.arrowup")
    (,SHARP        . "accidentals.sharp")
    (,SHARP-LOWER  . "accidentals.sharp.arrowdown")
    (,NATURAL-RAISE . "accidentals.natural.arrowup")
    (  0            . "accidentals.natural")
    (,NATURAL-LOWER . "accidentals.natural.arrowdown")
    (,FLAT-RAISE   . "accidentals.flat.arrowup")
    (,FLAT         . "accidentals.flat")
    (,FLAT-LOWER   . "accidentals.flat.arrowdown")
    (,(+ FLAT FLAT-RAISE) . "accidentals.flat.arrowdown")
    (,DOUBLE-FLAT  . "accidentals.flatflat")
)


#(set-default-paper-size "letter" 'landscape)
#(set-global-staff-size 10)

\header {
    tagline = " "
}

clarinetMusic = \relative c' {

    \tempo 2=60 \mark \markup { \box { JW=1 } } \time 4/4

    \tuplet 5/4 { r8 a'4. _\ff gis8~ _\p } \tuplet 5/4 { 4 e, _\f c''8~ _\f } |

    \tuplet 5/4 { 8 r feh' _\f disih8 _\ff r } \tuplet 5/4 { r eih,,16 _\p gis8. r4 } |

    r8 g,16 _\ff _\> b~ b4 ees''16 -> _\! _\p d4..~ _\f _\> |

    d4 _\! _\p fis _\f _\> gisih, _\! _\p r |

    \tuplet 5/4 { r4. gis,4 _\p } ees'2~ ~ _\! _\pp _\<
        
    \stopStaff
    \hide NoteHead
    es1 _\!

}

bassMusic = \relative c' {
    r16 gis4.. _\f \tuplet 5/4 { fis'8 _\p _\< d'~ 4. _\! _\f } |
    \tuplet 5/4 { r4 gis,, _\f cis8 } \tuplet 5/4 { bes4. d'16 _\p _\< 8. _\! _\f } |
    \clef bass \tuplet 5/4 { dis,16 f,,~ 4 _\p gis'8 d,~ _\pp _\< } 8 b'16 _\! _\ff _\> e~ 8. ees32 _\! _\f b  |
    bes16 _\pp 8 _\p cis'16 fis4~ 8 a,16 fis,~ _\p 8. ees''16~ |
    4 r \tuplet 6/4 { r r c _\ff } |
}

hornIMusic = \relative c'' {
    r16 dis8 _\p ais _\ff r8. r4 e'~ _\f |
    \tuplet 5/4 { e16 c4 r16 r4 } r r |
    r16 bih4.. _\ff _\> r4 _\! _\pp r |
    r16 fis4.. _\pp \tuplet 6/4 { r4 d'8 _\p [ fis,~ ] 4~ } |
    fis8 gis8. cis16 _\ff fis,8 _\p \tuplet 6/4 { r4 d' _\pp r }

    \stopStaff |
}

hornIIMusic = \relative c {
    \clef "bass" r4 r ais8 _\pp f4. |
    \tuplet 5/4 { r16 fis''4.. _\f ais,,8 _\ff } r4 r |
    r r \tuplet 5/4 { r dis,4. _\f } |
    r4 b''8 _\f fis,~ 2 _\f |
    r16 fisih'4 _\p ais,16~ _\pp _\< 8~ _\! _\f 4 d'4 _\p

}

harpMusic = \relative c {
    \clef bass \tuplet 6/4 { r4 ges8 bes' f' aes,,, } \clef treble \tuplet 5/4 { f'''' \clef bass <fes,,, bes> \clef treble c'''' r4 } |
    r4 r r \clef bass ees,,,8 \clef treble des''' |
    \clef bass r4 ees,,,8 des r4 \clef treble c''8 f |
    \tuplet 5/4 { r4 r f8 } \tuplet 5/4 { r8 \clef bass des,,,4 r8 \clef treble ees'''16 bes, } |
    r4 r16 f''' r8 r4 r
}

percMusic = \relative c'' {
    \clef "percussion"

    \tuplet 5/4 { r4 r \once \override NoteHead.style = #'cross b8 _\pp } r4 \once \override NoteHead.style = #'cross g :32 _\pp _\< |

    r16 _\! g'4..~ :64 _\f _\> \tuplet 5/4 { 4~ :32 _\! 4 a,8 } |
    \tuplet 5/4 { r4 r g'8~ } 4 r8. 16 |
    r g,8 e16 b'8 f'16 e \tuplet 6/4 { r4 e8 c r4 } |
    r4.. a'16 \tuplet 5/4 { a8 b,4. c8 } |


    %     \clef "percussion" \key c \none | % 1
    % \times 4/5  {
    %     r4 r4 \once \override NoteHead.style = #'cross \stemUp b8 _\pp }
    % r4 \once \override NoteHead.style = #'cross \stemUp g4 :32 _\pp _\<
    % | % 2
    % r16 _\! \stemDown f'8. ~ :64 _\f _\> \stemDown f4 ~ :32 _\! _\pp
    % \times 4/5 {
    %     \stemDown f4 ~ :32 _\< \stemDown f4 :32 _\! _\ff \stemUp a,8 _\p
    %     }
    % | % 3
    % \times 4/5  {
    %     r2 \stemDown g'8 ~ :32 _\ff }
    % _\> \stemDown g4 :32 r8. _\! \stemDown g16 _\pp | % 4
    % r16 \once \override NoteHead.style = #'cross \stemUp g,8 [ _\p \once
    % \override NoteHead.style = #'cross \stemUp e16 ] _\ff \once
    % \override NoteHead.style = #'cross \stemUp b'8 [ _\p \once \override
    % NoteHead.style = #'cross \stemUp f'16 _\ppp \stemUp e16 ] \times 4/6
    % {
    %     r4 \stemUp e8 [ _\p \stemUp c8 ] _\pp r4 }
    % | % 5
    % r4 r8. \stemDown a'16 _\ppp \times 4/5 {
    %     \stemUp a8 _\p \once \override NoteHead.style = #'cross \stemUp
    %     b,4. :64 _\ff _\> \stemUp c8 }
    % _\! _\f \pageBreak | % 6
    % R1 }
}

violinIMusic = \relative c' {
    \tuplet 5/4 { g8 ^ "piz" _\f fis''4. :32 ^ "asp" _\p _\< \parenthesize d'8 _\! _\p \glissando \once \override NoteColumn.glissando-skip = ##t }
    \afterGrace \once \hide g8 { \once \override Flag.stroke-style = #"grace" d'8 } r8 r4 |


    r4 r d,, ^ "piz" _\f b'8 :32 ^ "asp" _\pp _\< a _\! ^ "fcl" _\ff |

    \tuplet 5/4 { r c4 _\pp aih,8 \afterGrace g''' \glissando { \once \override Flag.stroke-style = #"grace" cis,8 } }
    cis,,4 :32  _\ff _\> d8 :32 ^ "asp"  _\! _\f _\< f :32 _\! _\ff |

    r \afterGrace bes _\ff _\> \glissando { \once \override Flag.stroke-style = #"grace" f'8 _\! _\p}
    dis, _\pp \afterGrace e'   _\f _\> \glissando { \once \override Flag.stroke-style = #"grace" d8 } r des4 _\! _\ff ^ "fcl" r8 |


    \tuplet 5/4 { g, _\pp fis, _\f  c _\p r4 } \tuplet 5/4 { r r a''''8 ~ :32  ^ "asp" _\ff  } |
}

violinIIMusic = \relative c'' {
    r16 e8 _\p ^ "piz" [ gis,,16 :32 ^ "asp" f'8 :32 _\ff _\> gis' _\! _\f ^ "piz" ]
    a, :32 _\p ^ "asp" r8 r4 |

    \tuplet 6/4 { r4 r disih, _\f ^ "piz" } f _\p fih |

    r8 a,16 ^ "asp" _\f b \afterGrace a''4 _\pp _\< 
    \glissando { \once \override Flag.stroke-style = #"grace" cis,8 _\! _\f }
    \tuplet 6/4 { r8 <e, f>4 _\p ^ "piz" r8 c' g' _\ff } |

    r16 fis, _\ff <a f'>4 _\f g8 :32 _\ff ^ "asp" e'4. :32 _\p des,8 :32 |

    a'4 _\ff ^ "piz" fisih8 _\p r ees4 _\ff ^ "fcl" r8. c16 _\p ^ "asp" |
}

violaMusic = \relative c''' {
    r16 \parenthesize b8. _\ff _\> \glissando \once \override NoteColumn.glissando-skip = ##t
    \afterGrace \once \hide f4 { \clef "alto" \once \override Flag.stroke-style = #"grace" c,8 _\! _\p }    
    \tuplet 5/4 { r8 cis ^ "piz" _\f r4 ais8 ^ "fcl" _\ff } |

    \tuplet 6/4 { r4 r a8 :32 _\ff ^ "asp" r } 
    \tuplet 6/4 { r4 g''8 :32 [ ais,, :32 a ^ "fcl" dih :32 _\p ^ "asp" ] } |

    \tuplet 5/4 { r8 bih ^ "fcl" _\ff b' ^ "piz" _\f cis, r } 
    d16 ^ "fcl" _\ff [ b' _\pp r8 e,8. _\p dis16 _\ff ] |

    r8 dis'16 _\p c, _\f r16 bis, _\f ^ "piz" a'8~ :32 _\f ^ "asp" 
    \tuplet 6/4 { 8 :32 r f'4 ^ "fcl" _\pp r8 e, } |

    r4 fis' _\f ^ "asp" _\>

    <<
        gih2 :32 _\! _\pp 
        { s4.._\p _\< s16 _\! _\f }
    >>  |
}

celloMusic = \relative c {
    \clef "bass" a16 _\f ^ "fcl" \clef "treble"
    \parenthesize b''8. _\p ^ "an" \glissando \once \override NoteColumn.glissando-skip = ##t
    \afterGrace \once \hide g4 { \once \override Flag.stroke-style = #"grace" f8 }
    r4 \clef "bass" d,4 :32 ^ "asp" _\ff |

    r8 g,8 :32 _\ff d4 _\f ^ "fcl"
    \tuplet 5/4 { r8 b'8 :32 ^ "asp" _\ff c'8 ^ "fcl" [ r cis ^ "piz" ] } |

    \clef "tenor" r8 fisih16 _\f [ fisih _\p r cis'8. :32 ^ "asp" _\ff _\> ]
    fis,,4 :32 _\! _\f _\> r4 _\! _\pp |

    \tuplet 5/4 { r8 \parenthesize c''4 \glissando _\ff _\> a8 :32 _\! _\pp cis,~ :32 } cis4 :32 r |

    \tuplet 6/4 { r gih' :32 _\pp r } \clef "bass" r8
    \parenthesize ees, _\f _\< \glissando \once \override NoteColumn.glissando-skip = ##t
    \afterGrace \once \hide a4 { \once \override Flag.stroke-style = #"grace" d,,8 _\! _\ff } |
}

\score {
    <<
        \new StaffGroup = "StaffGroup_clarinets" <<
            \new Staff = "Staff_clarinet"
                \with { instrumentName = \markup { \center-column { "Clarinette" \concat {  "si" \hspace #0.2 \flat } } } }
                \clarinetMusic
            \new Staff = "Staff_bass"
                \with { instrumentName = \markup { \center-column { "Clarinette" "basse" } } }
                \bassMusic
        >>

        \new StaffGroup = "StaffGroup_horns" <<
            \new Staff = "Staff_horn1"
                \with { instrumentName = "Cor 1" }
                \hornIMusic
            \new Staff = "Staff_horn2"
                \with { instrumentName = "Cor 2" }
                \hornIIMusic
        >>

        \new Staff = "Staff_harp"
            \with { instrumentName = "Harpe" }
            \harpMusic
        \new DrumStaff = "Staff_percussion"
            \with { instrumentName = "Percussion" }
            \percMusic

        \new StaffGroup = "StaffGroup_strings" <<
            \new Staff = "Staff_violin1"
                \with { instrumentName = "Violon 1" }
                \violinIMusic
            \new Staff = "Staff_violin2"
                \with { instrumentName = "Violon 2" }
                \violinIIMusic
            \new Staff = "Staff_viola"
                \with { instrumentName = "Alto" }
                \violaMusic
            \new Staff = "Staff_cello"
                \with { instrumentName = "Cello" }
                \celloMusic
        >>
    >>

    \layout {
        \context {
            \Score
            \override TupletNumber.text = #tuplet-number::calc-fraction-text


            \override TimeSignature.stencil = ##f
            \override KeySignature.alteration-glyph-name-alist = \arrowGlyphs
            \override Accidental.alteration-glyph-name-alist = \arrowGlyphs
            \override AccidentalCautionary.alteration-glyph-name-alist = \arrowGlyphs
            \override TrillPitchAccidental.alteration-glyph-name-alist = \arrowGlyphs
            \override AmbitusAccidental.alteration-glyph-name-alist = \arrowGlyphs


            \override TimeSignature.#'stencil = ##f
            % \accidentalStyle modern
        }
    }
   \midi { }
}
