---
layout: default
title: CS Crosslisted Courses
permalink: /cs-crosslisted/
title: /cs-crosslisted
---

# CS Crosslisted Courses

{% assign cs_courses = site.courses | where_exp: "course", "course.tags contains 'CS Crosslisted'" %}
{% assign grouped_courses = cs_courses | group_by: "last_offered" %}
{% assign sorted_groups = grouped_courses | sort: "name" | reverse %}

{% if sorted_groups.size == 0 %}
  <p>No CS crosslisted courses found.</p>
{% else %}
  {% for group in sorted_groups %}
  <h2>Last Offered: {{ group.name }}</h2>
  <ul>
    {% for course in group.items %}
      <li>
        <a href="{{ course.url | relative_url }}">
          {% if course.codes %}
            {{ course.codes | join: ", " }}
          {% else %}
            {{ course.title }}
          {% endif %}
        </a>
      </li>
    {% endfor %}
  </ul>
  {% endfor %}
{% endif %}
