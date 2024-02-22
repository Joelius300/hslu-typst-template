#import "../template.typ": img, eq
#import "@preview/acrostiche:0.3.1": acr, acrpl

= Einleitung

Welche Ziele, Fragestellungen werden mit dem Projekt verfolgt? Die Bedeutung, Auswirkung und Relevanz dieses Projektes für die unterschiedlichen Beteiligten soll aufgeführt werden. Typischerweise wird hier ein Verweis auf die Aufgabenstellung im Anhang gemacht.

#v(5em)

Hallo hallo, das ist Beispieltext. Ganz tolle #acr("BAA"). Gibt schlechtere und bessere #acrpl("BAA").

#lorem(30)

Hier ist ein weiterer Abschnitt mit weniger Text aber einer Formel.

#eq([$2^100 approx infinity$], [Hier ist eine Formelunterschrift]) <ex-eq>

== Problem <problem>

Hier ist das Problem und ein Bild :)

Und eine Referenz auf die Formel: @eq:ex-eq

#img("HSLU-AICH.png", [Das ist die Bildunterschrift], alt: "und das der Alt text", width: 25%)

#figure(table(columns: 2, [asdf], [asdf]), caption: "my table") <my-table>

Und eine Referenz auf die Tabelle: @tbl:my-table

#pagebreak()