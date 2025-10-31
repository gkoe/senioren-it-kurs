---------

layout: default

title: Kursterminelayout: defaultlayout: default

description: Aktuelle Termine für unsere IT-Kurse

---title: Kursterminetitle: Termine



<div class="wrap">description: Aktuelle Termine für unsere IT-Kursedescription: Ãœbersicht der Kurstermine

  <h2>Aktuelle Kurstermine</h2>

  <p>Hier finden Sie die nächsten Termine unserer Kursangebote. Alle Kurse sind einzeln buchbar und in kleinen Gruppen (max. 8 Personen).</p>------



  <ul class="termine-list">

    <li class="termin">

      <div class="termin-header"><div class="wrap"><div class=""wrap"">

        <h3>📱 Smartphone-Grundlagen</h3>

        <span class="termin-badge">Android & iPhone</span>  <h2>Aktuelle Kurstermine</h2>  <h2>Kurstermine</h2>

      </div>

      <div class="termin-details">  <p>Hier finden Sie die nächsten Termine unserer Kursangebote. Alle Kurse sind einzeln buchbar.</p>

        <p><strong>📅 Datum:</strong> Montag, 15. November 2025</p>

        <p><strong>🕐 Uhrzeit:</strong> 10:00 - 12:00 Uhr</p>  <!-- Beispiel-Termine: passe die Liste an -->

        <p><strong>📍 Ort:</strong> Seniorenzentrum A</p>

        <p><strong>📝 Inhalt:</strong> Optimale Handynutzung - Grundlegende Bedienung, wichtige Einstellungen und Barrierefreiheit</p>  <ul class="termine-list">  {% assign termine = 

      </div>

    </li>    <li class="termin">    [

    

    <li class="termin">      <h3>Smartphone-Grundlagen (Android/iPhone)</h3>      {"date":"2025-11-05","title":"EinfÃ¼hrung in die Grundlagen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},

      <div class="termin-header">

        <h3>💬 Offene Sprechstunde</h3>      <p><strong>Datum:</strong> Montag, 15. November 2025<br>      {"date":"2025-11-12","title":"E-Mails sicher nutzen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},

        <span class="termin-badge sprechstunde">Fragen & Antworten</span>

      </div>      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>      {"date":"2025-11-19","title":"Internet & Surfen","time":"10:00 - 12:00","location":"Seniorenzentrum A"}

      <div class="termin-details">

        <p><strong>📅 Datum:</strong> Mittwoch, 17. November 2025</p>      <strong>Ort:</strong> Seniorenzentrum A<br>    ]

        <p><strong>🕐 Uhrzeit:</strong> 14:00 - 16:00 Uhr</p>

        <p><strong>📍 Ort:</strong> Seniorenzentrum A</p>      <strong>Inhalt:</strong> Optimale Handynutzung - Grundlegende Bedienung und wichtige Einstellungen</p>  %}

        <p><strong>📝 Inhalt:</strong> Bringen Sie Ihre Fragen und Geräte mit - wir helfen Ihnen individuell weiter!</p>

      </div>    </li>  <ul class=""termine-list"">

    </li>

            {% for t in termine %}

    <li class="termin">

      <div class="termin-header">    <li class="termin">      <li class=""termin"">

        <h3>🔒 Sicherer Umgang mit Zugangsdaten</h3>

        <span class="termin-badge sicherheit">Sicherheit</span>      <h3>Offene Sprechstunde: Fragen & Antworten</h3>        <strong>{{ t.date }}</strong> â€” {{ t.title }} ({{ t.time }})<br>

      </div>

      <div class="termin-details">      <p><strong>Datum:</strong> Mittwoch, 17. November 2025<br>        <em>{{ t.location }}</em>

        <p><strong>📅 Datum:</strong> Montag, 22. November 2025</p>

        <p><strong>🕐 Uhrzeit:</strong> 10:00 - 12:00 Uhr</p>      <strong>Uhrzeit:</strong> 14:00 - 16:00 Uhr<br>      </li>

        <p><strong>📍 Ort:</strong> Seniorenzentrum A</p>

        <p><strong>📝 Inhalt:</strong> Passwörter richtig verwalten, Zwei-Faktor-Anmeldung und Phishing erkennen</p>      <strong>Ort:</strong> Seniorenzentrum A<br>    {% endfor %}

      </div>

    </li>      <strong>Inhalt:</strong> Bringen Sie Ihre Fragen und Geräte mit - wir helfen Ihnen weiter!</p>  </ul>

    

    <li class="termin">    </li>

      <div class="termin-header">

        <h3>💾 Ohne Backup kein Mitleid</h3>      <p>Wenn du aufgenommen werden mÃ¶chtest, schreibe an <a href=""mailto:kurs@example.org"">kurs@example.org</a>.</p>

        <span class="termin-badge backup">Datensicherung</span>

      </div>    <li class="termin"></div>

      <div class="termin-details">

        <p><strong>📅 Datum:</strong> Montag, 29. November 2025</p>      <h3>Sicherer Umgang mit Zugangsdaten</h3>

        <p><strong>🕐 Uhrzeit:</strong> 10:00 - 12:00 Uhr</p>      <p><strong>Datum:</strong> Montag, 22. November 2025<br>

        <p><strong>📍 Ort:</strong> Seniorenzentrum A</p>      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>

        <p><strong>📝 Inhalt:</strong> Cloud, externe Festplatte und automatische Sicherungen richtig einrichten</p>      <strong>Ort:</strong> Seniorenzentrum A<br>

      </div>      <strong>Inhalt:</strong> Passwörter, Zwei-Faktor-Anmeldung und Phishing erkennen</p>

    </li>    </li>

        

    <li class="termin">    <li class="termin">

      <div class="termin-header">      <h3>Backup: Daten richtig sichern</h3>

        <h3>🚴 Radfahren mit Komoot</h3>      <p><strong>Datum:</strong> Montag, 29. November 2025<br>

        <span class="termin-badge komoot">Navigation</span>      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>

      </div>      <strong>Ort:</strong> Seniorenzentrum A<br>

      <div class="termin-details">      <strong>Inhalt:</strong> Cloud, externe Festplatte und automatische Sicherungen</p>

        <p><strong>📅 Datum:</strong> Montag, 6. Dezember 2025</p>    </li>

        <p><strong>🕐 Uhrzeit:</strong> 10:00 - 12:00 Uhr</p>    

        <p><strong>📍 Ort:</strong> Seniorenzentrum A</p>    <li class="termin">

        <p><strong>📝 Inhalt:</strong> Touren planen, navigieren und Offline-Karten nutzen mit der Komoot-App</p>      <h3>Radfahren mit Komoot</h3>

      </div>      <p><strong>Datum:</strong> Montag, 6. Dezember 2025<br>

    </li>      <strong>Uhrzeit:</strong> 10:00 - 12:00 Uhr<br>

  </ul>      <strong>Ort:</strong> Seniorenzentrum A<br>

      <strong>Inhalt:</strong> Touren planen und navigieren mit der Komoot-App</p>

  <section id="anmeldung" class="cta-box">    </li>

    <h3>Jetzt anmelden!</h3>  </ul>

    <p>Möchten Sie an einem oder mehreren Kursen teilnehmen?</p>

    <p style="font-size: 1.1rem; margin: 1rem 0;"><strong>📧 E-Mail:</strong> kurs@example.org<br>  <section id="anmeldung" class="cta-box">

    <strong>ℹ️ Hinweis:</strong> Max. 8 Teilnehmende pro Kurs</p>    <h3>Anmeldung</h3>

    <p style="font-size: 0.95rem; margin-top: 1rem;">Alle Kurse sind einzeln buchbar. Vorkenntnisse sind nicht notwendig!</p>    <p>Möchten Sie an einem Kurs teilnehmen? Melden Sie sich gerne bei uns!</p>

  </section>    <p><strong>E-Mail:</strong> kurs@example.org (bitte durch echte E-Mail ersetzen)<br>

</div>    <strong>Hinweis:</strong> Die Teilnehmerzahl ist auf max. 8 Personen pro Kurs begrenzt.</p>

  </section>
</div>
