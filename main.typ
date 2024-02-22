#import "template.typ": *
#import "@preview/i-figured:0.2.4"

#show: project.with(
  title: "Bachelorarbeit",
  subtitle: "Dies ist der Titel der Bachelorarbeit",
  abstract: include "chapters/00_abstract.typ",
  logo: "img/HSLU-AICH.png",
  student: "Joel L.",
  coach: todo("Coach eintragen", inline: true),
  expert: todo("Experte eintragen", inline: true),
  departement: [Hochschule Luzern -- Informatik],
  degree: "BSc Artificial Intelligence and Machine Learning",
  date: "16. Februar 2024",
  client: todo("Auftraggeber eintragen", inline: true),
  confidential: true,
  disable_figure_hypenation: false,
)

#include "glossary.typ"

#include "chapters/01_introduction.typ"
#include "chapters/02_state-of-research.typ"
#include "chapters/03_concept.typ"
#include "chapters/04_methodology.typ"
#include "chapters/05_realization.typ"
#include "chapters/06_evaluation.typ"
#include "chapters/07_reflection-and-outlook.typ"

#fence()

= Bibliografie

#{
  set heading(outlined: false)  // workaround to avoid duplicate entry
  bibliography("references.bib", title: v(-1.3em))
}

#pagebreak(weak: true)

// Restart heading numberings at I.i
#set heading(numbering: "I.i")
#counter(heading).update(0)

#include "additional-outlines.typ"

#pagebreak(weak: true)

// Restart heading numberings at A.i
#set heading(numbering: "A.i", supplement: "Appendix")
#counter(heading).update(0)

#include "chapters/99_appendix.typ"
