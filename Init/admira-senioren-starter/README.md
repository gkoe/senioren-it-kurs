# Admira Linz Senioren – Jekyll Starter

Dieser Starter enthält eine minimale Jekyll-Struktur für einen kleinen Webauftritt.

## Inhalte
- Seiten: Start, Termine (Liste), News (Liste), Reisen (Seite)
- Posts: zwei Beispiel-News unter `_posts/`
- Collection: Termine unter `_termine/` (mit Feldern: title, date, time, location, description)
- Layouts/Includes: `default.html`, `header.html`, `footer.html`
- Styles: `assets/css/style.css` (Farben/Feeling in Rot/Schwarz/Weiß)

## Lokal ansehen (optional)
Du kannst mit Ruby/Jekyll lokal testen. Für GitHub Pages ist das nicht zwingend nötig.

1) Ruby & Bundler installieren (optional)
2) Im Ordner dieses Starters: `bundle add jekyll` und `bundle exec jekyll serve`

## GitHub Pages Deployment
1. Neues Repository auf GitHub anlegen (öffentlich oder privat mit Pages)
2. Dateien hochladen/committen
3. In den Repo-Einstellungen → Pages: Quelle auf `main` (Root) stellen
4. Base‑URL in `_config.yml` setzen, falls Projektseite (z. B. `/admira-senioren`)

## Hinweise
- Keine Logos, Fotos oder CSS von admira.at übernehmen. Nur Farbanmutung nutzen.
- Inhalte (Termine/News) im Front Matter pflegen.
