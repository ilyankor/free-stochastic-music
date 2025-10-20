\version "2.24.4"

#(set-default-paper-size "letter" 'landscape)
#(set-global-staff-size 16)

\header { 
    tagline = " "
}

clarinetMusic = \relative c' {
    \tuplet 5/4 { r8 a'4.\ff gis8~\p } \tuplet 5/4 { 4 e,\f c''8~\f } |
    \tuplet 5/4 { 8 r f'\f dis8\ff r } \tuplet 5/4 { r e,,16\p gis8. r4 } |
    r8 g,16 b~ b4 ees''16 d4..~ |
    d4 fis gis, r |
    \tuplet 5/4 { r4. gis,4 } ees'2~ |
}

bassMusic = \relative c' {
    \clef bass r16 gis4.. \clef treble \tuplet 5/4 { fis'8 d'~ 4. } |
    \tuplet 5/4 { r4 gis,, cis8 } \tuplet 5/4 { bes4. d'16 8. } |
    \clef bass \tuplet 5/4 { dis,16 f,,~ 4 gis'8 d,~ } 8 b'16 e~ 8. ees32 b  |
    bes16 8 cis'16 fis4~ 8 a,16 fis,~ 8. ees''16~ |
    4 r \tuplet 6/4 { r r c } |
}

hornIMusic = \relative c'' {
    r16 dis8 ais r8. r4 e'~ |
    \tuplet 5/4 { e16 c4 r16 r4 } r r |
    r16 b4.. r4 r |
    r16 fis4.. \tuplet 6/4 { r4 d'8 fis,~ 4 } |
    fis8 gis8. cis16 fis,8 \tuplet 6/4 { r4 d' r } |
}

hornIIMusic = \relative c {
    \clef bass r4 r ais8 f4. |
    \tuplet 5/4 { r16 fis''4.. ais,,8 } r4 r |
    r r \tuplet 5/4 { r dis,4. } |
    r4 b''8 fis,~ 2 |
    r16 fis'4 ais,16~ 8~ 4 d'4
}

harpMusic = \relative c {
    \clef bass \tuplet 6/4 { r4 ges8 bes' f' aes,,, } \clef treble \tuplet 5/4 { f'''' \clef bass <fes,,, bes> \clef treble c'''' r4 } |
    r4 r r \clef bass ees,,,8 \clef treble des''' |
    \clef bass r4 ees,,,8 des r4 \clef treble c''8 f |
    \tuplet 5/4 { r4 r f8 } \tuplet 5/4 { r8 \clef bass des,,,4 r8 \clef treble ees'''16 bes, } |
    r4 r16 f''' r8 r4 r
}

percMusic = \relative c'' {
    \tuplet 5/4 { r4 r b8 } r4 g |
    r16 g'4..~ \tuplet 5/4 { 4~ 4 a,8 } |
    \tuplet 5/4 { r4 r g'8~ } 4 r8. 16 |
    r g,8 e16 b'8 f'16 e \tuplet 6/4 { r4 e8 c r4 } |
    r4.. a'16 \tuplet 5/4 { a8 b,4. c8 } |
}

violinIMusic = \relative c' {
    \tuplet 5/4 { g8 fis''4. d'8 } fis r4. |
    r4 r d b'8 a |
    \tuplet 5/4 { r c4 a,8 g' } cis,4 d8 f |
    r bes dis, f' r e4 r8 |
    \tuplet 5/4 { g, fis, c r4 } \tuplet 5/4 { r r a''8 } |
}

violinIIMusic = \relative c'' {
    r16 e8 gis,,16 f'8 gis' a, r4. |
    \tuplet 6/4 { r4 r dis, } f f |
    r8 a,16 g a''4 \tuplet 6/4 { r8 f,4 r8 c' g' } |
    r16 fis, <a f'>4 g8 e'4. des,8 |
    a'4 fis8 r ees4 r8. c16 |
}

violaMusic = \relative c''' {
    r16 b8. g,4 \clef alto \tuplet 5/4 { r8 cis, r4 ais8 } |
    \tuplet 6/4 { r4 r a8 r } \tuplet 6/4 { r4 \clef treble g''8 \clef alto ais,, a d } |
    \tuplet 5/4 { r8 b b' cis, r } d16 b' r8 e,8. dis16 |
    r8 dis'16 c, r16 bis, a'8~ \tuplet 6/4 { 8 r f'4 r8 e, } |
    r4 fis' g2 |
}

celloMusic = \relative c {
    \clef bass a16 \clef treble b''8. g4 r \clef bass <d, g> |
    r8 g, d4 \tuplet 5/4 { r8 b' c' r cis } |
    r8 \clef treble fis16 fis r cis'8. \clef bass fis,,4 r |
    \clef treble \tuplet 5/4 { r8 c''4 a8 cis,~ } cis4 r |
    \tuplet 6/4 { r g' r } \clef bass r8 ees, b4 |
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
        }
    }
%    \midi { }
}
