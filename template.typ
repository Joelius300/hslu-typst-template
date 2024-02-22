// TODO Check list of packages and select those you need
// https://typst.app/docs/packages/

#import "@preview/i-figured:0.2.4"
#import "@preview/anti-matter:0.1.1": anti-matter, fence, set-numbering
#import "@preview/big-todo:0.2.0": todo

// Universal underlines (used in set in template)
#let underline-thickness = 0.5pt
#let underline-offset = 1pt
// Underline box: From https://github.com/typst/typst/issues/1716#issuecomment-1690842054
#let ubox(..box_args) = box(
  width: 1fr,
  stroke: (bottom: underline-thickness),
  outset: (bottom: underline-offset),
  ..box_args,
)

// Function to get a signature template (in German)
#let signature_template() = {
  [Ort / Datum, Unterschrift #ubox()]
}

// Function to write equation with a caption
#let eq(body, caption) = {
  figure(math.equation(block: true, body), caption: caption, kind: "eq", supplement: "Gleichung")
}

// Function to get a checkbox symbol in the current font
#let checkbox(checked: false) = {
  // unset font to force fallback where symbol works correctly.
  // this is necessary because in some fonts the checked box is smaller.
  set text(font: "")
  if checked {
    sym.ballot.x
  } else {
    sym.ballot
  }
}

#let img(name, caption, alt: none, ..img_args) = {
  if alt == none and type(caption) == str {
    alt = caption
  }

  figure(image("img/" + name, alt: alt, ..img_args), caption: caption)
}

#let project(
  title: "",
  subtitle: "",
  abstract: none,
  logo: none,
  student: "",
  departement: [Hochschule Luzern -- Informatik],
  degree: "BSc Informatik oder Wirtschaftsinformatik",
  // could use the datetime type directly but there's no localization for displaying
  date: datetime.today().display(),
  year: str(datetime.today().year()),
  coach: "",
  expert: "",
  client: "",
  confidential: false,
  disable_figure_hypenation: false,
  body
) = {
  set document(author: student, title: title)
  
  show: anti-matter
  set-numbering(none)  // disable page numbers
  
  set text(font: "STIX Two Text", size: 11pt, lang: "de")
  set heading(numbering: "1.1")
  // set math.equation(numbering: "(1)")
  
  // TODO maybe justify only after title page?
  set par(justify: true, leading: 0.65em * 1.5)

  // In a figure, you can specify the kind to be math.equation and that works
  // (it even has a localized supplement), BUT you cannot use math.equation here
  // when specifying the extra-prefixes, so we use the custom kind "eq".
  show heading: i-figured.reset-counters.with(level: 1, extra-kinds: ("eq",), equations: true)
  show figure: i-figured.show-figure.with(extra-prefixes: ("eq": "eq:"))
  show math.equation: i-figured.show-equation

  show math.equation: set text(weight: 400)
  show figure.caption: set text(hyphenate: not disable_figure_hypenation)
  
  // Universal underlines
  set underline(stroke: underline-thickness, offset: underline-offset)
  
// Title page
{  
  set align(center)
  if logo != none {
    align(right, image(logo, width: 25%))
  }
  
  v(1em)
  text(30pt, weight: 700, title)
  
  set text(size: 18pt, weight: 500)
  v(1em)
  text(subtitle, weight: 550)
  v(2em)
  student
  // TODO hier noch "arbeit von", "unter Betreuung von", "im Auftrag von"?
  // wenn ja mit Funktion für die verschiedenen Schriftgrössen
  
  set align(bottom)
  set text(size: 14pt, weight: 250)
  
  degree
  linebreak()
  departement
  linebreak()
  // date.display("[day].[month].[year]")  no localization support yet
  date
  v(4em)
}

pagebreak()

// Preamble according to requirements from HSLU
[
#set heading(numbering: none, outlined: false)
== Bachelorarbeit an der #departement

#v(2em)

#grid(columns: 2, row-gutter: 1.75em, column-gutter: 1em,
strong[Titel:], title,
strong[Studentin/Student:], student,
strong[Studiengang:], degree,
strong[Jahr:], year, // str(date.year()),
strong[Betreuungsperson:], coach,
strong[Expertin/Experte:], expert,
strong[Auftraggeberin/Auftraggeber:], client,
)

#v(3em)

==== Codierung / Klassifizierung der Arbeit
#checkbox(checked: not confidential) Öffentlich (Normalfall) \
#checkbox(checked: confidential) Vertraulich \

#v(3em)

==== Eidesstattliche Erklärung

Ich erkläre hiermit, dass ich die vorliegende Arbeit selbständig und
ohne unerlaubte fremde Hilfe angefertigt habe, alle verwendeten Quellen,
Literatur und andere Hilfsmittel angegeben habe, wörtlich oder
inhaltlich entnommene Stellen als solche kenntlich gemacht habe, das
Vertraulichkeitsinteresse des Auftraggebers wahren und die
Urheberrechtsbestimmungen der Hochschule Luzern respektieren werde.

#signature_template()

#v(3em)

==== Abgabe der Arbeit auf der Portfolio Datenbank

Bestätigungsvisum Studentin/Student \
Ich bestätige, dass ich die Bachelorarbeit korrekt gemäss Merkblatt auf
der Portfolio Datenbank abgelegt habe. Die Verantwortlichkeit sowie die
Berechtigungen habe ich abgegeben, so dass ich keine Änderungen mehr
vornehmen kann oder weitere Dateien hochladen kann.

#signature_template()

]

  pagebreak(weak: true)

  // If there are todos, show an outline of them here
  locate(loc => if query(figure.where(kind: "todo"), loc).len() > 0 [
    _Diese Seite verschwindet sobald alle TODOs erledigt sind._
    
    #outline(
      title: heading(text(fill: red)[TODOs], level: 1, outlined: false),
      target: figure.where(kind: "todo"),
    )
  ])  

  pagebreak(weak: true)

  // Currently the pages before the abstract have no page numbers, they
  // are purely title pages. Then the front- and backmatter have "I" page numbers
  // and the rest has normal "1" page numbers.
  set-numbering("I")
  // abstract and table of contents have no heading numbering
  set heading(numbering: none, outlined: false)

  if abstract != none {
    [= Abstract]
    
    abstract
  }
  
  pagebreak(weak: true)
  
  // // Numbering for headings and equations after preamble
  // set heading(numbering: "1.")
  // set math.equation(numbering: "(1)")

  // Table of contents
  // outline(title: heading([Inhaltsverzeichnis], level: 1, outlined: true, numbering: "1."), depth: 3)
  [= Inhaltsverzeichnis]
  outline(title: v(-1.3em), depth: 3)

  fence()

  set heading(numbering: "1.1", outlined: true)
  
  pagebreak(weak: true)

  // actual content
  body
}
