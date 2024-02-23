# HSLU Typst Template

Simple [Typst](https://typst.app/) template for HSLU theses ([demo](main.pdf)). It's built from scratch, but I took some valuable inspiration from [DarkDampSquib/hslu_template_typst](https://github.com/DarkDampSquib/hslu_template_typst) for external packages.

Since the template is in German anyway, I'll switch language now. If you want to port it to another language, I'll gladly add a link to your repo.

Ganz grundsätzlich: Es muss vor allem für die Betreuungsperson stimmen; sprecht euch also gut mit ihr ab bezüglich Deckblatt, Schrift, Kapitel, Überschriften, Referenzierung, etc. also eigentlich allem!

## Eigenschaften

- Automatisches Deckblatt (Port von "Seiten 1-3 Bachelorarbeit.tex")
- Schriftgrösse, Zeilenabstand, etc. sind von dem häufig referenzierten Buch "Wissenschaftliches Arbeiten" von Helmu Balzert übernommen (und mit Betreuuer abgesprochen).
- Aufgeteilt in mehrere Dateien nach Hauptkapitel (von "Aufbau Bericht.pdf" vorgegeben) und mit Anforderungen vorgefüllt
- Automatische Seitenzahlen mit unterschiedlicher Nummerierung in Front- und Back-matter vs Hauptteil (mithilfe von [tingerrr/anti-matter](https://github.com/tingerrr/anti-matter))
- Automatische Titel-, Bild-, Formel- und Tabellennummerierung mit Kapitelunterteilung (mithilfe von [RubixDev/typst-i-figured](https://github.com/RubixDev/typst-i-figured))
- Automatische Inhaltsverzeichnisse inkl. Abkürzungs-, Bild-, Formel- und Tabellenverzeichnis
- Helferfunktionen wie `eq` (Formel) und `img` (Bild) mit Beispielen
- Referenzen und Bibliografie mit BibTeX (beispielsweise). Ich empfehle aus [Zotero](https://www.zotero.org/) zu exportieren.

Da Typst PDF/A noch nicht unterstützt, muss das nachträglich konvertiert werden, z.B. mit Adobe Acrobat.

## Lizenz

MIT

Entsprechend bitte ich um eine kurze Referenz, wenn das Template in einer Arbeit verwendet wird.

Gerne könnt ihr das Template forken, verbessern und erweitern damit alle profitieren können.

## Dev Setup

Neben der [Web-App](https://typst.app/) kann auch lokal mit Typst gearbeitet werden.

Ich verwende dazu:

- [Neovim](https://neovim.io/) with [AstroNvim](https://astronvim.com/)
- [nvarner/typst-lsp](https://github.com/nvarner/typst-lsp) (installed with [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim))
- [kaarmu/typst.vim](https://github.com/kaarmu/typst.vim)
- [chomosuke/typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim)
- [LanguageTool](https://languagetool.org/) and [ltex-ls](https://github.com/valentjn/ltex-ls) (again with mason-lspconfig) as writing aid

Ich habe auch gutes gehört von der [VSCode(ium) Extension](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp) von [typst-lsp](https://github.com/nvarner/typst-lsp) zusammen mit der [VSCode(ium) Extension](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview) von [typst-preview](https://github.com/Enter-tainer/typst-preview).
