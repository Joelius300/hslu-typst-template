#import "@preview/big-todo:0.2.0": todo
#import "@preview/i-figured:0.2.4"
#import "@preview/acrostiche:0.3.1": print-index

= Weitere Inhaltsverzeichnisse

== Abkürzungsverzeichnis
#print-index(title: "")

// Table of images
== Abbildungsverzeichnis
#i-figured.outline(title: v(-1.3em))

// Tables of tables
== Tabellenverzeichnis
#i-figured.outline(title: v(-1.3em), target-kind: table)

// Table of equations
== Formelverzeichnis
#i-figured.outline(title: v(-1.3em), target-kind: math.equation)