\version "2.24.4"

#(set-global-staff-size 14.285714285714286)
\paper {
    
    paper-width = 27.94\cm
    paper-height = 21.59\cm
    top-margin = 1.5\cm
    bottom-margin = 1.5\cm
    left-margin = 1.5\cm
    right-margin = 1.5\cm
    indent = 2.149230769230769\cm
    short-indent = 1.3432692307692307\cm
    }
\layout {
    \context { \Score
        skipBars = ##t
        autoBeaming = ##f
        }
    }
clarinetMusic =  \relative a' {
    \clef "treble" \key c \none | % 1
    \tempo 2=60 \mark \markup { \box { JW=1 } } \times 4/5 {
        r8 \stemUp a4. _\ff \stemUp gis8 ~ _\p }
    \times 4/5  {
        \stemUp gis4 \stemUp e,4 _\f \stemDown c''8 ~ _\f }
    | % 2
    \times 4/5  {
        \stemDown c8 [ r8 \stemDown f' ?8 _\f \stemDown es ?8 ] _\ff r8
        }
    \times 4/5  {
        r8 \stemUp es,, ?16 [ _\p \stemUp gis8. ] r4 }
    | % 3
    r8 \stemUp g, ?16 [ _\ff _\> \stemUp b16 ~ ] \stemUp b4 \stemDown
    es'' ?16 -> _\! _\p \stemDown d4.. ~ _\f _\> | % 4
    \stemDown d4 _\! _\p \stemDown fis4 _\f _\> \stemDown g, ?4 _\! _\p
    r4 | % 5
    \times 4/5  {
        r4. \stemUp gis,4 _\p }
    _\< \stemDown es' ?2 ~ _\! _\pp _\< \pageBreak | % 6
    es1 _\! }

bassMusic =  \relative gis {
    \clef "treble_8" \key c \none | % 1
    r16 \stemUp gis8. ~ _\f \stemUp gis4 \times 4/5 {
        \stemDown f' ?8 [ _\p _\< \stemDown d'8 ~ ] _\! _\f \stemDown d4.
        }
    | % 2
    \times 4/5  {
        r4 \stemUp g,, ?4 _\f \stemDown c ?8 }
    \times 4/5  {
        \stemDown bes4. \stemDown d'16 [ _\p _\< \stemDown d8. ] }
    _\! _\f | % 3
    \times 4/5  {
        \stemUp d, ?16 [ \stemUp f,, ?16 ~ ] _\p \stemUp f4 \stemUp g' ?8
        [ \stemUp d, ?8 ~ ] _\pp }
    _\< \stemUp d8 [ \stemUp b'16 _\! _\ff _\> \stemUp e16 ~ ] \stemUp e8.
    [ \stemUp es32 _\! _\f \stemUp b ?32 ] | % 4
    \stemUp bes ?16 [ _\pp \stemUp bes ?8 _\p \stemUp cis'16 ] \stemDown
    fis4 ~ \stemUp fis8 [ \stemUp a, ?16 \stemUp fis,16 ~ ] _\p \stemUp
    fis8. [ \stemUp es'' ?16 ~ ] | % 5
    \stemDown es4 r4 \times 4/6 {
        r4 r4 \stemDown c ?4 _\ff }
    _\> \pageBreak | % 6
    R1 _\! }

hornIMusic =  \relative dis'' {
    \clef "treble" \key c \none | % 1
    r16 \stemDown dis8 [ _\p \stemDown ais8 ] _\ff r8. r4 \stemDown e'4
    ~ _\f | % 2
    \times 4/5  {
        \stemDown e16 \stemDown c4 r16 r4 }
    r2 | % 3
    r16 \stemDown bes ?4.. _\ff _\> r2 _\! _\pp | % 4
    r16 \stemUp fis4.. _\pp \times 4/6 {
        r4 \stemUp d'8 [ _\p \stemUp fis, ?8 ~ ] \stemUp fis4 ~ }
    | % 5
    \stemUp fis8 [ \stemUp gis8. \stemUp cis16 _\ff \stemUp fis,8 ] _\p
    \times 4/6 {
        r4 \stemDown d'4 _\pp r4 }
    \pageBreak | % 6
    R1 }

hornIIMusic =  \relative fis {
    \clef "treble" \key c \none | % 1
    r2 \stemUp fis8 _\p \stemUp d4. | % 2
    \times 4/5  {
        r16 \stemUp fis'8. ~ _\f \stemUp fis4 \stemUp ais,,8 _\ff }
    r2 | % 3
    r2 \times 4/5 {
        r4 \stemUp dis,4. _\f }
    _\> | % 4
    r4 _\! \stemUp b''8 [ _\f _\> \stemUp fis,8 ~ ] _\! _\f \stemUp fis2
    | % 5
    r16 \stemUp f' ?8. ~ _\p \stemUp f16 [ \stemUp ais,16 ~ _\pp _\<
    \stemUp ais8 ~ ] _\! _\f \stemUp ais4 \stemUp d'4 _\p _\< \pageBreak
    | % 6
    R1 _\! }

percussionMusic =  \relative b' {
    \clef "percussion" \key c \none | % 1
    \times 4/5  {
        r4 r4 \once \override NoteHead.style = #'cross \stemUp b8 _\pp }
    r4 \once \override NoteHead.style = #'cross \stemUp g4 :32 _\pp _\<
    | % 2
    r16 _\! \stemDown f'8. ~ :64 _\f _\> \stemDown f4 ~ :32 _\! _\pp
    \times 4/5 {
        \stemDown f4 ~ :32 _\< \stemDown f4 :32 _\! _\ff \stemUp a,8 _\p
        }
    | % 3
    \times 4/5  {
        r2 \stemDown g'8 ~ :32 _\ff }
    _\> \stemDown g4 :32 r8. _\! \stemDown g16 _\pp | % 4
    r16 \once \override NoteHead.style = #'cross \stemUp g,8 [ _\p \once
    \override NoteHead.style = #'cross \stemUp e16 ] _\ff \once
    \override NoteHead.style = #'cross \stemUp b'8 [ _\p \once \override
    NoteHead.style = #'cross \stemUp f'16 _\ppp \stemUp e16 ] \times 4/6
    {
        r4 \stemUp e8 [ _\p \stemUp c8 ] _\pp r4 }
    | % 5
    r4 r8. \stemDown a'16 _\ppp \times 4/5 {
        \stemUp a8 _\p \once \override NoteHead.style = #'cross \stemUp
        b,4. :64 _\ff _\> \stemUp c8 }
    _\! _\f \pageBreak | % 6
    R1 }

harpMusicTreble =  \relative ges, {
    \clef "treble" \key c \none | % 1
    \times 4/6  {
        r4 \change Staff="2" \stemUp ges8 [ _\pp ^ "B" \change Staff="1"
        \change Staff="2" \stemUp bes'8 _\p \change Staff="1" \stemDown
        f'8 _\f \change Staff="2" \stemUp as,,,8 ] }
    \change Staff="1" \times 4/5 {
        \stemDown f''''8 \flageolet [ _\f \change Staff="2" \stemUp
        <fes,,, bes>8 ^ "A" \change Staff="1" \stemDown c'''''8 ] _\p r8
        r8 }
    | % 2
    r2 r4 r4 | % 3
    r2 r4 \stemDown c,,8 [ _\pp \stemDown f8 ] _\p | % 4
    \times 4/5  {
        r4 r4 \stemDown f8 _\pp }
    ^ "B" \times 4/5 {
        r8 \change Staff="2" \stemUp des,,,,4 ^ "A" _\pp \change
        Staff="1" r8 \stemUp es''''16 [ \stemUp bes,16 ] }
    | % 5
    r4 r16 \stemDown f'''16 _\p ^ "B" r8 r2 \pageBreak | % 6
    R1 }

harpMusicBass =  \relative es {
    \clef "bass" \key c \none s1 | % 2
    r2 r4 \stemUp es8 \flageolet [ _\f \change Staff="1" \stemDown
    des''''8 ] \change Staff="2" | % 3
    r4 \stemDown es,,,,8 [ _\p ^ "A" \stemDown des8 ] _\ff r2 | % 4
    R1*2 \pageBreak | % 6
    R1 }

violinIMusic =  \relative g {
    \clef "treble" \key c \none | % 1
    \times 4/5  {
        \stemUp g8 ^ "pizz." _\f \stemDown fis''4. :64 ^ "asp" _\p _\<
        \stemDown d'8 \glissando }
    _\! _\p \once \override NoteHead.style = ##f \stemDown g8
    \acciaccatura { \stemUp d'8 } r8 r4 | % 2
    r2 \stemDown d,,4 ^ "pizz." _\f \stemDown b'8 :32 [ ^ "asp" _\pp _\<
    \stemDown a8 ] _\! ^ "fcl" _\ff | % 3
    \times 4/5  {
        r8 \stemDown c4 _\pp \stemDown a, ?8 [ \stemDown g'''8
        \glissando ] }
    ^ "an" \acciaccatura { \stemUp cis,8 } \stemDown cis,,4 :32
    \stemDown d8 :32 [ ^ "asp" _\ff _\> _\! _\f _\< \stemDown f8 :32 ]
    _\! _\ff | % 4
    r8 \stemDown bes8 \glissando _\ff _\> \acciaccatura { \stemUp f'8 }
    \stemDown dis,8 [ \stemDown e'8 \glissando ] _\! _\pp _\f _\>
    \acciaccatura { \stemUp d8 } r8 \stemDown des4 _\! _\ff ^ "fcl" r8 | % 5
    \times 4/5  {
        \stemUp g,8 [ _\pp \stemUp fis,8 _\f \stemUp c8 ] _\p r4 }
    \times 4/5  {
        r2 \stemDown a''''8 ~ :32 }
    ^ "asp" _\ff _\> \pageBreak | % 6
    a1 _\! }

violinIIMusic =  \relative e'' {
    \clef "treble" \key c \none | % 1
    r16 \stemUp e8 [ _\p ^ "pizz." \stemUp gis,,16 :32 ^ "asp" \stemUp
    f'8 :32 _\ff _\> \stemUp gis'8 ] _\! _\f ^ "pizz." \stemUp a,8 :32
    _\p ^ "asp" r8 r4 | % 2
    \times 4/6  {
        r4 r4 \stemUp d, ?4 _\f }
    ^ "pizz." \stemUp f4 _\p \stemUp f ?4 | % 3
    r8 \stemUp a,16 [ ^ "asp" _\f \stemUp b16 ] \stemDown a''4
    \glissando _\pp \times 4/6 {
        \acciaccatura { \stemUp cis,8*3/2 } r8 \stemUp <e, f>4 _\p ^
        "pizz." r8 \stemDown c' ?8 [ \stemDown g'8 ] _\ff }
    | % 4
    r16 \stemUp fis,16 _\ff \stemDown <a f'>4 _\f \stemUp g8 :32 ^ "asp"
    \stemDown e'4. :64 _\p \stemUp des,8 :32 | % 5
    \stemUp a'4 _\ff ^ "pizz." \stemUp f ?8 _\p r8 \stemUp es4 _\ff ^
    "fcl" r8. \stemUp c16 _\p ^ "asp" \pageBreak | % 6
    R1 }

violaMusic =  \relative b'' {
    \clef "treble" \key c \none | % 1
    r16 \stemDown b8. \glissando _\ff _\> \clef "alto" \once \override
    NoteHead.style = ##f \stemDown g,4 _\! _\p \times 4/5 {
        \acciaccatura { \stemUp c,8*5/4 } r8 \stemDown cis8 ^ "pizz."
        _\f r4 \stemUp ais8 }
    ^ "fcl" _\ff | % 2
    \times 4/6  {
        r2 \stemUp a8 :32 _\ff r8 }
    \times 4/6  {
        r4 \stemDown g''8 :32 [ \stemDown ais,,8 :32 \stemDown a8 ^
        "fcl" \stemDown d ?8 :32 ] _\p }
    ^ "asp" | % 3
    \times 4/5  {
        r8 \stemDown b ?8 [ ^ "fcl" _\ff \stemDown b'8 ^ "pizz." _\f
        \stemDown cis,8 ] r8 }
    \stemDown d16 [ ^ "fcl" _\ff \stemDown b'16 _\pp r8 \stemDown e,8.
    _\p \stemDown dis16 ] _\ff | % 4
    r8 \stemDown dis'16 [ _\p \stemDown c,16 ] _\f r16 \stemUp bis,16 [
    _\f ^ "pizz." \stemUp a'8 ~ :32 ] _\f ^ "asp" \times 4/6 {
        \stemUp a8 :32 r8 \stemDown f'4 ^ "fcl" _\pp r8 \stemUp e,8 }
    | % 5
    r4 \stemDown fis'4 ^ "asp" _\f _\> \stemDown g ?2 :32 _\! _\pp _\<
    \pageBreak | % 6
    R1 _\! }

celloMusic =  \relative a, {
    \clef "bass" \key c \none | % 1
    \stemUp a16 [ _\f ^ "fcl" \clef "treble" \stemUp b''8. \glissando ]
    _\p ^ "an" \once \override NoteHead.style = ##f \stemUp g4
    \acciaccatura { \stemUp f8 } r4 \clef "bass" \stemDown d,4 :32 ^
    "asp" _\ff | % 2
    r8 \stemUp g,8 :32 _\ff \stemUp d4 _\f ^ "fcl" \times 4/5 {
        r8 \stemUp b'8 :16 ^ "asp" _\ff \stemDown c'8 ^ "fcl" r8
        \stemDown cis8 }
    ^ "pizz" | % 3
    \clef "tenor" r8 \stemDown f ?16 [ _\f \stemDown f16 _\p r16
    \stemDown cis'8. :64 ] ^ "asp" _\ff _\> \stemUp fis,,4 :16 _\! _\f
    _\> r4 _\! | % 4
    \times 4/5  {
        r8 \stemDown c''4 \glissando _\ff _\> \stemDown a8 :32 [ _\!
        _\pp \stemDown cis,8 ~ :32 ] }
    \stemDown cis4 :32 r4 | % 5
    \times 4/6  {
        r4 \stemDown g' ?4 _\pp r4 }
    \clef "bass" r8 \stemDown es,8 \glissando _\f _\< \afterGrace {
        \once \override NoteHead.style = ##f \stemUp b4 } { \stemUp d,8
        } \pageBreak | % 6
    R1 _\! }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                \set Staff.instrumentName = "Clarinette si"
                \set Staff.shortInstrumentName = "Cl. in B"
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "clarinetMusic" {  \clarinetMusic }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Clarinette basse"
                \set Staff.shortInstrumentName = "B. Cl."
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "bassMusic" {  \bassMusic }
                    >>
                >>
            
            >>
        \new StaffGroup \with { }
        
        <<
            \new StaffGroup
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = "Cor 1"
                    \set Staff.shortInstrumentName = "Hn. in F 1"
                    
                    \context Staff << 
                        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                        \context Voice = "hornIMusic" {  \hornIMusic }
                        >>
                    >>
                \new Staff
                <<
                    \set Staff.instrumentName = "Cor 2"
                    \set Staff.shortInstrumentName = "Hn. in F 2"
                    
                    \context Staff << 
                        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                        \context Voice = "hornIIMusic" {  \hornIIMusic }
                        >>
                    >>
                
                >>
            
            >>
        \new DrumStaff
        <<
            \set DrumStaff.instrumentName = "Percussion"
            \set DrumStaff.shortInstrumentName = "Perc."
            
            \context DrumStaff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context DrumVoice = "percussionMusic" {  \percussionMusic }
                >>
            >>
        \new PianoStaff
        <<
            \set PianoStaff.instrumentName = "Harpe"
            \set PianoStaff.shortInstrumentName = "Hrp."
            
            \context Staff = "1" << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "harpMusicTreble" {  \harpMusicTreble }
                >> \context Staff = "2" <<
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "harpMusicBass" {  \harpMusicBass }
                >>
            >>
        \new StaffGroup
        <<
            \new StaffGroup \with { }
            
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = "Violon 1"
                    \set Staff.shortInstrumentName = "Vln. 1"
                    
                    \context Staff << 
                        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                        \context Voice = "violinIMusic" {  \violinIMusic }
                        >>
                    >>
                \new Staff
                <<
                    \set Staff.instrumentName = "Violon 2"
                    \set Staff.shortInstrumentName = "Vln. 2"
                    
                    \context Staff << 
                        \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                        \context Voice = "violinIIMusic" {  \violinIIMusic }
                        >>
                    >>
                
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Alto"
                \set Staff.shortInstrumentName = "Vla."
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "violaMusic" {  \violaMusic }
                    >>
                >>
            \new Staff
            <<
                \set Staff.instrumentName = "Cello"
                \set Staff.shortInstrumentName = "Vc."
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "celloMusic" {  \celloMusic }
                    >>
                >>
            
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 120 }
    }

