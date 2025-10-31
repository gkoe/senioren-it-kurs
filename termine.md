---
layout: default
title: Termine
description: Ãœbersicht der Kurstermine
---

<div class=""wrap"">
  <h2>Kurstermine</h2>

  <!-- Beispiel-Termine: passe die Liste an -->
  {% assign termine = 
    [
      {"date":"2025-11-05","title":"EinfÃ¼hrung in die Grundlagen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},
      {"date":"2025-11-12","title":"E-Mails sicher nutzen","time":"10:00 - 12:00","location":"Seniorenzentrum A"},
      {"date":"2025-11-19","title":"Internet & Surfen","time":"10:00 - 12:00","location":"Seniorenzentrum A"}
    ]
  %}
  <ul class=""termine-list"">
    {% for t in termine %}
      <li class=""termin"">
        <strong>{{ t.date }}</strong> â€” {{ t.title }} ({{ t.time }})<br>
        <em>{{ t.location }}</em>
      </li>
    {% endfor %}
  </ul>

  <p>Wenn du aufgenommen werden mÃ¶chtest, schreibe an <a href=""mailto:kurs@example.org"">kurs@example.org</a>.</p>
</div>
