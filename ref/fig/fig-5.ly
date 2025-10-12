\version "2.24.4"

#(set-default-paper-size "a4" 'landscape)

\header { 
    tagline = " "
}

clarinetMusic = \relative c' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    \tuplet 5/4 { r8 a'4.\ff gis8~\p } \tuplet 5/4 { 4 e,\f c''8~\f } |
    \tuplet 5/4 { 8 r f'\f dis8\ff r } \tuplet 5/4 { r e,,16\p gis8. r4 } |
    r8 g,16 b~ b4 ees''16 d4..~ |
    d4 fis gis, r |
    \tuplet 5/4 { r4. gis,4 } ees'2~ |
}

bassMusic = \relative c' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \clef bass

    r16 gis4.. \clef treble \tuplet 5/4 { fis'8 d'~ 4. } |
    \tuplet 5/4 { r4 gis,, cis8 } \tuplet 5/4 { bes4. d'16 8. } |
    \clef bass \tuplet 5/4 { dis,16 f,,~ 4 gis'8 d,~ } 8 b'16 e~ 8. ees32 b  |
    bes16 8 cis'16 fis4~ 8 a,16 fis,~ 8. ees''16~ |
    4 r \tuplet 6/4 { r r c } |
}

hornIMusic = \relative c'' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    r16 dis8 ais r8. r4 e'~ |
    \tuplet 5/4 { e16 c4 r16 r4 } r r |
    r16 b4.. r4 r |
    r16 fis4.. \tuplet 6/4 { r4 d'8 fis,~ 4 } |
    fis8 gis8. cis16 fis,8 \tuplet 6/4 { r4 d' r } |
}

hornIIMusic = \relative c {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \clef bass

    r4 r ais8 f4. |
    \tuplet 5/4 { r16 fis''4.. ais,,8 } r4 r |
    r r \tuplet 5/4 { r dis,4. } |
    r4 b''8 fis,~ 2 |
    r16 fis'4 ais,16~ 8~ 4 d'4
}

harpMusic = \relative c {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \clef bass

    \tuplet 6/4 { r4 ges8 bes' f' aes,,, } \clef treble \tuplet 5/4 { f'''' \clef bass fes,,, \clef treble c'''' r4 } |
    r4 r r \clef bass ees,,,8 \clef treble des''' |
    \clef bass r4 ees,,,8 des r4 \clef treble c''8 f |
    \tuplet 5/4 { r4 r f8 } \tuplet 5/4 { r8 \clef bass des,,,4 r8 \clef treble ees'''16 bes, } |
    r4 r16 f''' r8 r4 r
}

percMusic = \relative c'' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    r1 | r1 | r1 | r1 | r1 |
}

violinIMusic = \relative c'' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    r1 | r1 | r1 | r1 | r1 |
}

violinIIMusic = \relative c'' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    r1 | r1 | r1 | r1 | r1 |
}

violaMusic = \relative c'' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    r1 | r1 | r1 | r1 | r1 |
}

celloMusic = \relative c'' {
    \override TupletNumber.text = #tuplet-number::calc-fraction-text

    r1 | r1 | r1 | r1 | r1 |
}

\score {
    <<
        \new StaffGroup = "StaffGroup_clarinets" <<
            \new Staff = "Staff_clarinet"
                \with { instrumentName = \markup { \concat { "Clarinet in B" \flat } } }
                \clarinetMusic
            \new Staff = "Staff_bass"
                \with { instrumentName = "Bass Clarinet" }
                \bassMusic
        >>

        \new StaffGroup = "StaffGroup_horns" <<
            \new Staff = "Staff_horn1"
                \with { instrumentName = "Horn in F" }
                \hornIMusic
            \new Staff = "Staff_horn2"
                \with { instrumentName = "Trumpet in  C" }
                \hornIIMusic
        >>
       
        \new Staff = "Staff_harp"
            \with { instrumentName = "Harp" }
            \harpMusic
        \new Staff = "Staff_percussion"
            \with { instrumentName = "Percussion" }
            \percMusic
        
        \new StaffGroup = "StaffGroup_strings" <<
            \new Staff = "Staff_violin1"
                \with { instrumentName = "Violin I" }
                \violinIMusic
            \new Staff = "Staff_violin2"
                \with { instrumentName = "Violin II" }
                \violinIIMusic
            \new Staff = "Staff_viola"
                \with { instrumentName = "Viola" }
                \violaMusic
            \new Staff = "Staff_cello"
                \with { instrumentName = "Cello" }
                \celloMusic
        >>
    >>
    \layout { }
%    \midi { }
}
