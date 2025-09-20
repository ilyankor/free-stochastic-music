# Excerpts from Formalized Music

## Chapter V: Free Stochastic Music by Computer

After this interlude, we return to the treatment of composition by machines.

The theory put forward by *Achorripsis* had to wait four years before being realized mechanically.
This realization occurred thanks to M. François Génuys of IBM-France and to M. Jacques Barraud of the Régie Autonome des Transports
Parisiens.

### The Paradox: Music and Computers

#### A Stochastic Work Executed by the IBM-7090

The general public has a number of different reactions when faced by the alliance of the machine with artistic creation.
They fall into three categories:

"It is impossible to obtain a *work of art*, since by definition it is a handi­craft and requires moment-by-moment "creation" for each detail and for the entire structure, while a machine is an inert thing and cannot invent."

"Yes, one may play games with a machine or use it for speculative purposes, but the result will not be "finished": it will represent only an experiment—interesting, perhaps, but no more."

The enthusiasts who at the outset accept without flinching the whole frantic brouhaha of science fiction.
"The moon? Well, yes, it's within our reach.
Prolonged life will also be with us tomorrow—why not a creative machine?"
These people are among the credulous who, in their, idiosyncratic optimism, have replaced the myths of Icarus and the fairies, which have decayed, by the scientific civilization of the twentieth century, and science partly agrees with them.
In reality, science is neither all paradox nor all animism, for it progresses in limited stages that are not foreseeable at too great a distance.

There exists in all the arts what we may call rationalism in the etymo­logical sense: the search for proportion.
The *artist* has always called upon it out of *necessity*.
The rules of construction have varied widely over the cen­turies, but there have always been rules in every epoch because of the neeessily of making oneself understood.
Those who believe the first statement above are the first to refuse to apply the qualification *artistic* to a product which they do not *understand* at all.

Thus the musical scale is a convention which circumscribes the area of potentiality and permits construction within those limits in its own particu­lar symmetry.
The rules of Christian hymnography, of harmony, and of counterpoint in the various ages have allowed artists to construct and to make themselves understood by those who adopted the same constraints­—through traditions, through collective taste or imitation, or through sym­pathetic resonance.
The rules of serialism, for instance, those that banned the traditional octave doublings of tonality, imposed constraints which were partly new but none the less real.

Now everything that is rule or repeated constraint is part of the mental machine.
A little "imaginary machine," Philippot would have said—a choice, a set of decisions.
A musical work can be analyzed as a multitude of mental machines.
A melodic theme in a symphony is a mold, a mental machine, in the same way as its structure is.
These mental machines are something very restrictive and deterministic, and sometimes very vague and indecisive.
In the last few years we have seen that this idea of mechanism is really a very general one.
It flows through every area of human knowledge and action, from strict logic to artistic manifestations.

Just as the wheel was once one of the greatest products of human intelligence, a mechanism which allowed one to travel farther and faster with more luggage, so is the computer, which today allows the transforma­tion of man's ideas.
Computers resolve logical problems by heuristic methods.
But computers are not really responsible for the introduction of mathematics into music; rather it is mathematics that makes use of the computer in composition.
Yet if people's minds are in general ready to recognize the usefulness of geometry in the plastic arts (architecture, painting, etc.), they have only one more stream to cross to be able to conceive of using more abstract, non-visual mathematics and machines as aids to musical composition, which is more abstract than the plastic arts.

To summarize:

1. The creative thought of man gives birth to mental mechanisms, which, in the last analysis, are merely sets of constraints and choices.
   This process takes place in all realms of thought, including the arts.
2. Some of these mechanisms can be expressed in mathematical terms.
3. Some of them are physically realizable: the wheel, motors, bombs, digital computers, analogue computers, etc.
4. Certain mental mechanisms may correspond to certain mechanisms of nature.
5. Certain mechanizable aspects of artistic creation may be simulated by certain physical mechanisms or machines which exist or may be created.
6. It happens that computers can be useful in certain ways.

Here then is the theoretical point of departure for a utilization of electronic computers in musical composition.

We may further establish that the role of the living composer seems to have evolved, on the one hand, to one of inventing schemes (previously forms) and exploring the limits of these schemes, and on the other, to effect­ing the scientific synthesis of the new methods of construction and of sound emission.
In a short while these methods must comprise all the ancient and modern means of musical instrument making, whether acoustic or electronic, with the help, for example, of digital-to-analogue converters; these have already been used in communication studies by N. Guttman, J. R. Pierce, and M. V. Mathews of Bell Telephone Laboratories in New Jersey.
Now these explorations necessitate impressive mathematical, logical, physical, and psychological impedimenta, especially computers that accelerate the mental processes necessary for clearing the way for new fields by providing immediate experimental verifications at all stages ofmusical construction.

Music, by its very abstract nature, is the first of the arts to have at­tempted the conciliation of artistic creation with scientific thought.
Its industrialization is inevitable and irreversible.
Have we not already seen attempts to industrialize serial and popular music by the Parisian team of P. Barbaud, P. Blanchard, and Jeanine Charbonnier, as well as by the musicological research of Hiller and Isaacson at the University of Illinois?

In the preceding chapters we demonstrated some new areas of musical creation: Poisson, Markov processes, musical games, the thesis of the mini­mum of constraints, etc.
They are all based on mathematics and especially on the theory of probability.
They therefore lend themselves to being treated and explored by computers.
The simplest and most meaningful scheme is one ofminimum constraints in composition, as exemplified by *Achorripsis*.

Thanks to my friend Georges Boudouris of the C.N.R.S. I made the acquaintance of Jacques Barraud, Engineer of the Ecole des Mines, then director of the Ensemble Electroniques de Gestion de la Société des Petroles Shell-Berre, and François Génuys, agrégé in mathematics, and head of the Etudes Scientifiques Nouvelles at IBM-France.
All three are scientists, yet they consented to attempt an experiment which seemed at first far-fetched­—that of a marriage of music with one of the most powerful machines in the world.

In most human relations it is rarely pure logical persuasion which is important; usually the paramount consideration is material interest.
Now in this case it was not logic, much less self-interest, that arranged the be­trothal, but purely experiment for experiment's sake, or game for game's sake, that induced collaboration.
Stochastically speaking, my venture should have encountered failure.
Yet the doors were opened, and at the end of a year and a half of contacts and hard work "the most unusual event wit­nessed by the firm or by this musical season [in Paris]" took place on 24 May 1962 at the headquarters of IBM-France.
It was a live concert pre­senting a work of stochastic instrumental music entitled *ST/10-1, 080262*, which had been calculated on the IBM-7090.
It was brilliantly performed by the conductor C. Simonovic and his Ensemble de Musique Contem­poraine de Paris.
By its passage through the machine, this work made tangible a stochastic method of composition, that of the minimum of constraints and rules.

### Position of the Problem

The first working phase was the drawing of the flow chart, i.e., writing down clearly and in order the stages of the operations of the scheme of *Achorripsis*,[^1] and adapting it to the machine structure.
In the first chapter we set out the entire synthetic method of this minimal structure.
Since the machine is an iterative apparatus and performs these iterations with extra­ordinary speed, the thesis had to be broken down into a sequential series of operations reiterated in loops.
An excerpt from the first flow chart is shown in Fig. V-1.

<!-- Fig. V-1. Excerpt from the First Flow Chart of Achorripsis -->

The statement of the thesis of *Achorripsis* receives its first machine­-oriented interpretation in the following manner:

1. *The work consists of a succession of sequences or movements each $a_i$ seconds long*.
   Their durations are totally independent (asymmetric) but have a fixed mean duration, which is introduced in the form of a parameter.
   These durations and their stochastic succession are given by the formula
   $$P_{a_i} = c \mathrm{e}^{-ca_i} \, da_i$$

2. *Definition of the mean density of the sounds during $a_i$*.
   During a sequence sounds are emitted from several sonic sources.
   If the total number of these sounds or points during a sequence is $N_{a_i}$, the mean density of this point­ cluster is $N_{a_i} / a_i$ sounds/sec.
   In general, for a given instrumental ensemble this density has limits that depend on the number of instrumentalists, the nature of their instruments, and the technical difficulties of performance.
   For a large orchestra the upper limit is of the order of $150$ sounds/sec.
   The lower limit $(V3)$ is arbitrary and positive.
   We choose $(V3) = 0.11$ sounds/sec.
   Previous experiments led us to adopt a logarithmic progression for the density sensation with a number between 2 and 3 as its base.[^2]
   We adopted $\mathrm{e} = 2.71827$.
   Thus the densities are included between $(V3)\mathrm{e}^0$ and $(V3)\mathrm{e}^R$ sounds/sec., which we can draw on a line graduated logarithmically (base $\mathrm{e}$).
   As our purpose is total independence, we attribute to each of the sequences $a_i$ calculated in **1.** a density represented by a point drawn at random from the portion of the line mentioned above.
   However a certain concern for continuity leads us to temper the independence of the densities among sequences $a_i$; to this end we introduce a certain "memory" from sequence to sequence in the following manner:

   Let $a_{i-1}$ be a sequence of duration $a_{i-1}$, $(DA)_{i-1}$ its density, and $a_i$ the next sequence with duration $a_i$ and density $(DA)_i$.
   Density $(DA)_i$ will be given by the formula:
   $$(DA)_i = (DA)_{i-1} \mathrm{e}^{\pm x},$$
   in which $x$ is a segment of line drawn at random from a line segment $s$ of length equal to $(R - 0)$.
   The probability of $x$ is given by
   $$P_x = \frac{2}{s} \left(1 - \frac{x}{s}\right) dx$$
   and finally,
   $$N_{a_i} = (DA)_i a_i.$$

3. *Composition $Q$ of the orchestra during sequence $a_i$*.
   First the instruments are divided into $r$ classes of timbres, e.g., flutes and clarinets, oboes and bassoons, brasses, bowed strings, pizzicati, col legno strokes, glissandi, wood, skin, and metal percussion instruments, etc.
   (See the table for Atrées.)
   <!-- Composition of the Orchestra for Atrées (ST/10-3,060962) -->

   The composition of the orchestra is stochastically conceived, i.e., the distribution of the classes is not deterministic.
   Thus during a sequence of duration $a_i$ it may happen that we have 80% pizzicati, 10% percussion, 7% keyboard, and 3% flute class.
   Under actual conditions the determining factor which would condition the composition of the orchestra is density.
   We therefore connect the orchestral composition with density by means of a special diagram.
   An example from *ST/10-1, 080262* is shown in Fig. V-2.
   <!-- Fig V-2. ST/10-1, 080262, Composition of the Orchestra -->

   Fig. V-2 is expressed by the formula
   $$Q_r = (n-x)(e_{n,r} - e_{n+1,r}) + e_{n,r}$$
   in which $r =$ the number of the class, $x = \log_e \left[(DA_i)/(V3)\right]$, $n = 0,1,2, \dots, R$, such that $n \leq x \leq n + 1$, and $e_{n,r}$ and $e_{n+1,r}$ are the probabilities of class $r$ as a function of $n$.
   It goes without saying that the composition of this table is a precise task of great complexity and delicacy.
   Once these preliminaries have been completed, we can define, one after the other, the $N_{a_i}$, sounds of sequence $a_i$.

4. *Definition of the moment of occurence of the sound $N$ within the sequence $a_i$*.
   The mean density of the points or sounds to be distributed within $a_i$ is $k = N_{a_i} / a_i$.
   The formula which gives the intervals separating the sound attacks is
   $$P_t = k\mathrm{e}^{-kt} dt.$$

5. *Attribution to the above sound of an instrument belonging to orchestra $Q$, which has already been calculated*.
   First class $r$ is drawn at random with proba­bility $q_r$ from the orchestra ensemble calculated in **3.**
   (Consider an urn with balls of $r$ colors in various proportions.)
   Then from within class $r$ the number of the instrument is drawn according to the probability $p_n$ given by an arbitrary table (urn with balls of $n$ colors).
   Here also the distribution of instruments within a class is delicate and complex.

6. *Attribution of a pitch as a function of the instrument*.
   Taking as the zero point the lowest B&#x266D; of the piano, we establish a chromatic scale in semitones of about $85$ degrees.
   The range $s$ of each instrument is thus expressed by a natural number (distance).
   But the pitch $h_u$ of a sound is expressed by a decimal number of which the whole number part is related to a note ofthe chromatic scale within the instrument's range.

   Just as for the density in **2.**, we accept a certain memory of or dependence on the preceding pitch played by the same instrument, so that we have
   $$h_u = h_{u-1} \pm z,$$
   where $z$ is given by the probability formula
   $$P_z = \frac{2}{s} \left(1 - \frac{z}{s}\right) dz.$$
   $P_z$ is the probability of the interval $z$ taken at random from the range $s$, and $s$ is expressed as the difference between the highest and lowest pitches that can be played on the instrument.

7. *Attribution of a glissando speed if class $r$ is characterized as a glissando*.
   The homogeneity hypotheses in Chap. I led us to the formula
   $$f(v) = \frac{2}{a \sqrt{\pi}} \mathrm{e}^{-v^2/a^2},$$
   and by the transformation $v/a = u$ to its homologue:
   $$T(u) = \frac{2}{\sqrt{\pi}} \int_0^u \mathrm{e}^{-u^2} \, \mathrm{d}u,$$
   for which there are tables.
   $f(v)$ is the probability of occurrence of the speed $v$ (which is expressed in semitones/sec.); it has a parameter $a$, which is pro­portional to the standard deviation $s$ ($a = s \sqrt{2}$).

   $a$ is defined as a function of the logarithm of the density of sequence $a_i$ by: an inversely proportional function
   $$a = \sqrt{\pi} \left(30 - \frac{20}{R} L[(DA_i)/(V3)]\right),$$
   or a directly proportional function
   $$a = \sqrt{\pi} \left(10 + \frac{20}{R} L[(DA_i)/(V3)]\right),$$
   or a function independent of density
   $$a = 17.7 + 35k,$$
   where $k$ is a random number between $0$ and $1$.

   The constants of the preceding formulae derive from the limits of the speeds that string glissandi may take.

   Thus for $(DA)_i = 145$ sounds/sec.
   $$\begin{align*}
   a &= 53.2 \ \textrm{semitones/sec.} \\
   2s &= 75 \ \textrm{semitones/sec.} \\
   \end{align*}$$
   and for for $(DA)_i = 0.13$ sounds/sec.
   $$\begin{align*}
   a &= 17.7 \ \textrm{semitones/sec.} \\
   2s &= 25 \ \textrm{semitones/sec.} \\
   \end{align*}$$

8. *Attribution of a duration $x$ to the sounds emitted*.
   To simplify we establish a mean duration for each instrument, which is independent of tessitura and nuance.
   Consequently we reserve the right to modify it when transcribing into traditional notation.
   The following is the list of constraints that we take into account for the establishment of duration $x$:
   $$\begin{align*}
   &G \textrm{, the maximum length of respiration or desired duration} \\
   &(DA)_i \textrm{, the the density of the sequence} \\
   &q_r \textrm{, the probability of class} \ r \\
   &p_n \textrm{, the probability of the instrument} \ n
   \end{align*}$$
   Then if we define $z$ as a parameter of a sound's duration, $z$ could be inversely proportional to the probability of the occurrence of the instrument, so that
   $$z = \frac{1}{(DA)_i p_n q_r}.$$
   $z$ will be at its maximum when $(DA)_i p_n q_r$ is at its minimum, and in this case we could choose $z_{\textrm{max}} = G$.

   Instead of letting $z_{\textrm{max}} = G$, we shall establish a logarithmic law so as to freeze the growth of $z$.
   This law applies for any given value of $z$.
   $$z' = G \ln{z} / \ln{z_\textrm{max}}$$

   Since we admit a total independence, the distribution of the durations $x$ will be Gaussian:
   $$f(x) = \frac{1}{s \sqrt{2 \pi}} \mathrm{e}^{-(x - m)^2/(2s^2)},$$  
   where $m$ is the arithmetic mean of the durations, $s$ the standard deviation, and
   $$\begin{align*}
   m - 4.25s &= 0\\
   m + 4.25s &= z'
   \end{align*}$$
   the linear system which furnishes us with the constants $m$ and $s$.
   By assuming $u = (x-m)/s\sqrt{2}$ we find the function $T(u)$, for which we consult the tables.

   Finally, the duration $x$ of the sound will be given by the relation
   $$x = \pm us\sqrt{2} + m.$$

   We do not take into account incompatibilities between instruments, for this would needlessly burden the machine's program and calculation.

9. *Attribution of dynamic forms to the sounds emitted*.
   We define four zones of mean intensities: *pp*, *p*, *f*, *ff*.
   Taken three at a time they yield $4^3 = 64$ permutations, of which $44$ are different (an urn with 44 colors); for example, *ppp*&#x1D192;*f*&#x1D193;*p*.
   <!-- Table of the 44 Intensity Forms Derived from 4 Mean Intensity Values, ppp, p, f, ff -->

10. The same operations are begun again for each sound of the cluster $N_{a_i}$.
11. Recalculations ofthe same sort are made for the other sequences.

An extract from the sequential statement was reproduced in Fig. V-1.
Now we must proceed to the transcription into Fortran IV, a language "understood" by the machine (see Fig. V-3).
<!-- Fig. V-3. Stochastic Music Rewritten in Fortran IV -->
<!-- Fig. V-4. Provisional Results of One Phase of the Analysis -->
<!-- Fig. V-5. Bars 1-5 of ST/10-1,080262 -->

It is not our purpose to describe the transformation of the flow chart into Fortran.
However, it would be interesting to show an example of the adaptation of a mathematical expression to machine methods.

Let us consider the elementary law of probability (density function)
$$ f(x) \, dx = c\mathrm{e}^{-cx} \, dx.$$
How shall we proceed in order for the computer to give us lengths $x$ with the probability $f(x) \, dx$? The machine can only draw random numbers $y_0$ with equiprobability between $0$ and $1$.
We shall "modulate" this proba­bility: Assume some length $x_0$; then we have
$$\operatorname{prob}{(0 \leq x \leq x_0)} = \int_0^{x_0} f(x) \, \mathrm{d}x = 1 - \mathrm{e}^{-cx_0} = F(x_0),$$
where $F(x_0)$ is the distribution function of $x$.
But
$$F(x_0) = \operatorname{prob}{(0 \leq y \leq y_0)} = y_0$$
then
$$1 - \mathrm{e}^{-cx_0} = y_0$$
and
$$x_0 = - \frac{\ln{(1 - y_0)}}{c}$$
for all $x_0 \geq 0$.

Once the program is transcribed into language that the machine's internal organization can assimilate, a process that can take several months, we can proceed to punching the cards and setting up certain tests.
Short sections are run on the machine to detect errors of logic and orthography and to determine the values of the entry parameters, which are introduced in the form of variables.
This is a very important phase, for it permits us to explore all parts of the program and determine the modalities of its opera­tion.
The final phase is the decoding of the results into traditional notation, unless an automatic transcriber is available.

### Conclusions

A large number of compositions of the same kind as *ST/10-1, 080262* is possible for a large number of orchestral combinations.
Other works have already been written: *ST/48-1, 240162*, for large orchestra, commissioned by RTF (France III); *Atrées* for ten soloists; and *Morisma-Amorisima*, for four soloists.

Although this program gives a satisfactory solution to the minimal structure, it is, however, necessary to jump to the stage of pure composition by coupling a digital-to-analogue converter to the computer.
The numerical calculations would then be changed into sound, whose internal organization had been conceived beforehand.
At this point one could bring to fruition and generalize the concepts described in the preceding chapters.

The following are several of the advantages of using electronic computers ­in musical composition:

1. The long laborious calculation made by hand is reduced to nothing.
   The speed of a machine such as the IBM-7090 is tremendous—of the order of 500,000 elementary operations/sec.

2. Freed from tedious calculations the composer is able to devote him­self to the general problems that the new musical form poses and to explore the nooks and crannies of this form while modifying the values of the input data.
   For example, he may test all instrumental combinations from soloists to chamber orchestras, to large orchestras.
   With the aid of electronic com­puters the composer becomes a sort of pilot: he presses the buttons, intro­duces coordinates, and supervises the controls of a cosmic vessel sailing in the space of sound, across sonic constellations and galaxies that he could formerly glimpse only as a distant dream.
   Now he can explore them at his ease, seated in an armchair.
3. The program, i.e., the list of sequential operations that constitute the new musical form, is an objective manifestation of this form.
   The program may consequently be dispatched to any point on the earth that possesses computers of the appropriate type, and may be exploited by any composer pilot.
4. Because of certain uncertainties introduced in the program, the composer-pilot can instill his own personality in the sonic result he obtains.

[^1]: See *Gravesaner Blättler*, nos. 11/12 (Mainz: Ars Viva Verlag, 1957).
[^2]: $(V3)\mathrm{e}^R$ must be equal to the upper limit, e.g., to $150$ sounds/sec. in the case of a large orchestra.

## Appendix I

### Two Laws of Continuous Probability

#### First Law

#### Second Law

<!-- TO BE DONE -->
