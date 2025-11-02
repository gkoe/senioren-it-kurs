---
layout: default
title: News
---

<ul class="list">
  {% assign posts_sorted = site.posts | sort: 'date' | reverse %}
  {% for post in posts_sorted %}
    <li>
      <a class="link-plain" href="{{ post.url | relative_url }}"><strong>{{ post.title }}</strong></a>
      <div style="opacity:.75">{{ post.date | date: "%d.%m.%Y" }}</div>
      {% if post.excerpt %}<div>{{ post.excerpt }}</div>{% endif %}
    </li>
  {% endfor %}
</ul>
