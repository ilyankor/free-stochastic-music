 \version "2.22"

\paper {
    indent = #0
    system-system-spacing = #'((basic-distance . 0) (padding . 4))
}

\score {
    \new Dynamics {
        \override DynamicText.X-offset = 0

        s1\ppp\< s1\!\ppp            |  s1\f\> s1\!\p              \break
        s1\ppp\< s1\!\p              |  s1\p\< s1\!\ff             \break
        s2\ppp\< s2\!\p\> s1\!\ppp   |  s2\p\< s2\!\ff\> s1\!\p    \break
        s1\p\> s1\!\ppp              |  s1\ff\> s1\!\p             \break
        s1\ppp\< s1\!\f              |  s2\ppp\< s2\!\ff\> s1\!\f  \break
        s2\ppp\< s2\!\f\> s1\!\ppp   |  s1\ppp\< s1\!\ppp          \break
        s1\f\> s1\!\ppp              |  s1\ppp\< s1\!\ppp          \break
        s1\ppp\< s1\!\ff             |  s1\ppp\< s1\!\ppp          \break
        s2\ppp\< s2\!\ff\> s1\!\ppp  |  s1\ppp\< s1\!\ppp          \break
        s1\ff\> s1\!\ppp             |  s1\ppp\< s1\!\ppp          \break
        s2\ppp\< s2\!\f\> s1\!\p     |  s1\ppp\< s1\!\ppp          \break
        s2\f\> s2\!\ppp\< s1\!\p     |  s1\ppp\< s1\!\ppp          \break
        s2\p\< s2\!\f\> s1\!\ppp     |  s1\ppp\< s1\!\ppp          \break
        s2\p\> s2\!\ppp\< s1\!\f     |  s1\ppp\< s1\!\ppp          \break
        s2\ppp\< s2\!\ff\> s1\!\p    |  s1\ppp\< s1\!\ppp          \break
        s2\ff\> s2\!\ppp\< s1\!\p    |  s1\ppp\< s1\!\ppp          \break
        s2\p\> s2\!\ppp\< s1\!\ff    |  s1\ppp\< s1\!\ppp          \break
        s2\p\< s2\!\ff\> s1\!\ppp    |  s1\ppp\< s1\!\ppp          \break
        s1\p\< s1\!\p                |  s1\ppp\< s1\!\ppp          \break
        s2\p\> s2\!\ppp\< s1\!\p     |  s1\ppp\< s1\!\ppp          \break
        s1\p\< s1\!\f                |  s1\ppp\< s1\!\ppp          \break
        s2\p\< s2\!\f\> s1\!\p       |  s1\ppp\< s1\!\ppp          \break
    }
    \layout {
        \context {
            \Score
            \override SpacingSpanner spacing-increment = #6
            \omit BarNumber
        }
    }
}