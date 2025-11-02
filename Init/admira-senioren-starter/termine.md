---
layout: default
title: Termine
---

<ul class="list">
  {% assign termine = site.termine | sort: 'date' %}
  {% for t in termine %}
    <li>
      <strong>{{ t.title }}</strong><br>
      <span style="opacity:.8">{{ t.date | date: "%A, %d.%m.%Y" }}{% if t.time %}, {{ t.time }}{% endif %} · {{ t.location }}</span>
      {% if t.description %}<div>{{ t.description }}</div>{% endif %}
      <a class="link-plain" href="{{ t.url | relative_url }}">Details →</a>
    </li>
  {% endfor %}
</ul>
