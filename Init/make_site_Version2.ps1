Param()
$ErrorActionPreference = "Stop"

$ZipName = "senioren-it-kurs.zip"
$Tmp = "senioren-it-kurs-tmp"

if (Test-Path $Tmp) { Remove-Item -Recurse -Force $Tmp }
if (Test-Path $ZipName) { Remove-Item -Force $ZipName }

New-Item -ItemType Directory -Path $Tmp | Out-Null
New-Item -ItemType Directory -Path (Join-Path $Tmp "_layouts") | Out-Null
New-Item -ItemType Directory -Path (Join-Path $Tmp "_includes") | Out-Null
New-Item -ItemType Directory -Path (Join-Path $Tmp "assets\css") -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $Tmp "assets\downloads") -Force | Out-Null

# Dateien schreiben
@"
# Minimal Jekyll config for GitHub Pages
title: Senioren-IT Kurs
description: Info-Website für den Senioren-IT Kurs — Termine, Materialien und Kontakt.
baseurl: "" # falls die Seite in einem Unterverzeichnis gehostet wird, z.B. /repo-name
url: "https://gkoe.github.io" # passe ggf. an oder lasse leer
theme: minima
markdown: kramdown
permalink: /:title/
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "_config.yml")

@"
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>{{ page.title | default: site.title }}</title>
  <meta name="description" content="{{ page.description | default: site.description }}">
  <link rel="stylesheet" href="{{ '/assets/css/style.css' | relative_url }}">
</head>
<body>
  {% include header.html %}
  <main class="content">
    {{ content }}
  </main>
  {% include footer.html %}
</body>
</html>
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "_layouts\default.html")

@"
<header class=""site-header"">
  <div class=""wrap"">
    <h1 class=""site-title""><a href=""{{ '/' | relative_url }}"">{{ site.title }}</a></h1>
    <nav class=""main-nav"">
      <a href=""{{ '/' | relative_url }}"">Start</a>
      <a href=""{{ '/termine/' | relative_url }}"">Kurstermine</a>
      <a href=""{{ '/downloads/' | relative_url }}"">Material / Downloads</a>
      <a href=""#kontakt"">Kontakt</a>
    </nav>
  </div>
</header>
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "_includes\header.html")

@"
<footer class=""site-footer"">
  <div class=""wrap"">
    <p>&copy; {{ ""now"" | date: ""%Y"" }} {{ site.title }} — erstellt mit Jekyll · Gehostet auf GitHub Pages</p>
  </div>
</footer>
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "_includes\footer.html")

@"
---
layout: default
title: Start
description: Willkommen beim Senioren-IT Kurs
---

<div class=""wrap"">
  <h2>Willkommen</h2>
  <p>Dies ist die Info-Seite für den Senioren-IT Kurs. Hier findest du die aktuellen Kurstermine und die Materialien zum Download.</p>

  <h3>Nächste Schritte</h3>
  <ul>
    <li><a href=""{{ '/termine/' | relative_url }}"">Kurstermine ansehen</a></li>
    <li><a href=""{{ '/downloads/' | relative_url }}"">Materialien herunterladen</a></li>
  </ul>

  <section id=""kontakt"">
    <h3>Kontakt</h3>
    <p>Für Fragen: <strong>kurs@example.org</strong> (ersetzen durch echte Kontaktadresse)</p>
  </section>
</div>
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "index.md")

@"
---
layout: default
title: Termine
description: Übersicht der Kurstermine
---

<div class=""wrap"">
  <h2>Kurstermine</h2>

  <!-- Beispiel-Termine: passe die Liste an -->
  {% assign termine = 
    [
      {"date":"2025-11-05","title":"Einführung in die Grundlagen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},
      {"date":"2025-11-12","title":"E-Mails sicher nutzen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},
      {"date":"2025-11-19","title":"Internet & Surfen","time":"10:00 - 12:00","location":"Seniorenzentrum A"}
    ]
  %}
  <ul class=""termine-list"">
    {% for t in termine %}
      <li class=""termin"">
        <strong>{{ t.date }}</strong> — {{ t.title }} ({{ t.time }})<br>
        <em>{{ t.location }}</em>
      </li>
    {% endfor %}
  </ul>

  <p>Wenn du aufgenommen werden möchtest, schreibe an <a href=""mailto:kurs@example.org"">kurs@example.org</a>.</p>
</div>
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "termine.md")

@"
---
layout: default
title: Material / Downloads
description: Materialien und Handouts zum Kurs
---

<div class=""wrap"">
  <h2>Materialien</h2>
  <p>Die Kursmaterialien stehen hier zum Download bereit. Klicke auf eine Datei, um sie herunterzuladen.</p>

  <ul class=""downloads-list"">
    <!-- Lege Dateien unter assets/downloads/ ab, z. B. assets/downloads/handout1.pdf -->
    <li><a href=""{{ '/assets/downloads/handout-einfuehrung.pdf' | relative_url }}"" download>Handout: Einführung (PDF)</a></li>
    <li><a href=""{{ '/assets/downloads/uebungen-email.pdf' | relative_url }}"" download>Übungen: E-Mail (PDF)</a></li>
    <li><a href=""{{ '/assets/downloads/kurzuebersicht.zip' | relative_url }}"" download>Sammlung: Beispiel-Dateien (ZIP)</a></li>
  </ul>

  <p>Wenn du eigene Materialien hochladen möchtest, wende dich bitte an die Kursleitung.</p>
</div>
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "downloads.md")

@"
/* sehr einfaches Styling */
:root{
  --accent:#2c6ea4;
  --wrap-width:900px;
  font-family: system-ui, -apple-system, ""Segoe UI"", Roboto, ""Helvetica Neue"", Arial;
}
body{ margin:0; color:#222; background:#f6f8fa; }
.wrap{ max-width:var(--wrap-width); margin:0 auto; padding:1.25rem; }
.site-header{ background:var(--accent); color:#fff; padding:0.75rem 0; }
.site-title{ margin:0; font-size:1.25rem; display:inline-block; }
.site-title a{ color:#fff; text-decoration:none; }
.main-nav{ float:right; }
.main-nav a{ color:#fff; margin-left:1rem; text-decoration:none; }
.content{ padding:1.5rem 0; background:#fff; margin-bottom:1rem; }
.site-footer{ text-align:center; padding:1rem 0; color:#666; font-size:0.9rem; }
.termine-list, .downloads-list{ list-style:none; padding:0; }
.termin{ background:#f1f5f9; margin:0.5rem 0; padding:0.75rem; border-radius:6px; }
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "assets\css\style.css")

@"
# Senioren-IT Kurs — Jekyll Website

Kurzanleitung:
1. Erstelle ein neues GitHub-Repository namens `senioren-it-kurs` (oder verwende deinen gewünschten Namen).
2. Lege die Dateien (inkl. Ordner `assets/css/` und `assets/downloads/`) in das Repo.
3. Lege deine Download-Dateien in `assets/downloads/`.
4. Aktiviere GitHub Pages: Repository -> Settings -> Pages -> Source: main branch (Root).
5. Warte kurz, GitHub baut die Seite. Öffne dann die URL `https://gkoe.github.io/senioren-it-kurs/` (falls baseurl leer ist, ggf. /repo-name).

Tipps:
- Passe _config.yml url ggf. an.
- Du kannst Termine später in _data/termine.yml auslagern, falls gewünscht.
"@ | Out-File -Encoding UTF8 (Join-Path $Tmp "README.md")

# Beispiel placeholder downloads
"Dies ist ein Platzhalter für das Handout Einführung." | Out-File -Encoding UTF8 (Join-Path $Tmp "assets\downloads\handout-einfuehrung.txt")
"Dies ist ein Platzhalter für die Übungen E-Mail." | Out-File -Encoding UTF8 (Join-Path $Tmp "assets\downloads\uebungen-email.txt")
"Beispiel-Dateien gesammelt." | Out-File -Encoding UTF8 (Join-Path $Tmp "assets\downloads\kurzuebersicht.txt")

# ZIP erstellen
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($Tmp, $ZipName)

# Aufräumen
Remove-Item -Recurse -Force $Tmp

Write-Host "Erstellt: $ZipName"
Write-Host "Entpacke und überprüfe die Dateien. Um das Repo zu erstellen, lade die ZIP-Inhalte in ein neues GitHub-Repository hoch."