---
layout: default
title: "/home"
permalink: /
---

<img src="./assets/ieee_at_cornell_logo_glow.png" alt="IEEE at Cornell Logo" width="100%"/>

This wiki covers class information for IEEE-related courses and activities at Cornell University. Our goal is to provide easy access to important resources, course materials, and student guidance. Please help us grow this valuable resource by [contributing](./contributing.md)!

🎉 NEW: Explore [CS Crosslisted Courses]({{ "/cs-crosslisted/" | relative_url }})

## Classes

{% assign grouped_by_level = site.courses | group_by: "primary_level" %}
{% assign sorted_levels = grouped_by_level | sort: "name" %}

{% for level_group in sorted_levels %}
  <h3>{{ level_group.name }}000-Level</h3>
  <ul>
    {% assign level_courses = level_group.items | sort: "title" %}
    {% for course in level_courses %}
      <li>
        <a href="{{ course.url | relative_url }}">
          {% if course.codes %}
            {{ course.codes | join: ", " }}
          {% else %}
            {{ course.code }}
          {% endif %}
        </a>: {{ course.title }}
      </li>
    {% endfor %}
  </ul>
{% endfor %}
