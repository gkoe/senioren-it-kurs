------

layout: defaultlayout: default

title: Kursterminetitle: Termine

description: Aktuelle Termine für unsere IT-Kursedescription: Ãœbersicht der Kurstermine

------



<div class="wrap"><div class=""wrap"">

  <h2>Aktuelle Kurstermine</h2>  <h2>Kurstermine</h2>

  <p>Hier finden Sie die nächsten Termine unserer Kursangebote. Alle Kurse sind einzeln buchbar.</p>

  <!-- Beispiel-Termine: passe die Liste an -->

  <ul class="termine-list">  {% assign termine = 

    <li class="termin">    [

      <h3>Smartphone-Grundlagen (Android/iPhone)</h3>      {"date":"2025-11-05","title":"EinfÃ¼hrung in die Grundlagen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},

      <p><strong>Datum:</strong> Montag, 15. November 2025<br>      {"date":"2025-11-12","title":"E-Mails sicher nutzen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},

      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>      {"date":"2025-11-19","title":"Internet & Surfen","time":"10:00 - 12:00","location":"Seniorenzentrum A"}

      <strong>Ort:</strong> Seniorenzentrum A<br>    ]

      <strong>Inhalt:</strong> Optimale Handynutzung - Grundlegende Bedienung und wichtige Einstellungen</p>  %}

    </li>  <ul class=""termine-list"">

        {% for t in termine %}

    <li class="termin">      <li class=""termin"">

      <h3>Offene Sprechstunde: Fragen & Antworten</h3>        <strong>{{ t.date }}</strong> â€” {{ t.title }} ({{ t.time }})<br>

      <p><strong>Datum:</strong> Mittwoch, 17. November 2025<br>        <em>{{ t.location }}</em>

      <strong>Uhrzeit:</strong> 14:00 - 16:00 Uhr<br>      </li>

      <strong>Ort:</strong> Seniorenzentrum A<br>    {% endfor %}

      <strong>Inhalt:</strong> Bringen Sie Ihre Fragen und Geräte mit - wir helfen Ihnen weiter!</p>  </ul>

    </li>

      <p>Wenn du aufgenommen werden mÃ¶chtest, schreibe an <a href=""mailto:kurs@example.org"">kurs@example.org</a>.</p>

    <li class="termin"></div>

      <h3>Sicherer Umgang mit Zugangsdaten</h3>
      <p><strong>Datum:</strong> Montag, 22. November 2025<br>
      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>
      <strong>Ort:</strong> Seniorenzentrum A<br>
      <strong>Inhalt:</strong> Passwörter, Zwei-Faktor-Anmeldung und Phishing erkennen</p>
    </li>
    
    <li class="termin">
      <h3>Backup: Daten richtig sichern</h3>
      <p><strong>Datum:</strong> Montag, 29. November 2025<br>
      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>
      <strong>Ort:</strong> Seniorenzentrum A<br>
      <strong>Inhalt:</strong> Cloud, externe Festplatte und automatische Sicherungen</p>
    </li>
    
    <li class="termin">
      <h3>Radfahren mit Komoot</h3>
      <p><strong>Datum:</strong> Montag, 6. Dezember 2025<br>
      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>
      <strong>Ort:</strong> Seniorenzentrum A<br>
      <strong>Inhalt:</strong> Touren planen und navigieren mit der Komoot-App</p>
    </li>
  </ul>

  <section id="anmeldung" class="cta-box">
    <h3>Anmeldung</h3>
    <p>Möchten Sie an einem Kurs teilnehmen? Melden Sie sich gerne bei uns!</p>
    <p><strong>E-Mail:</strong> kurs@example.org (bitte durch echte E-Mail ersetzen)<br>
    <strong>Hinweis:</strong> Die Teilnehmerzahl ist auf max. 8 Personen pro Kurs begrenzt.</p>
  </section>
</div>
