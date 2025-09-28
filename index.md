---
layout: default
title: "/home"
permalink: /
---

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<style>
.offered-course {
  list-style-type: disc;
}

.offered-course::marker {
  color: #7253ed; 
}
</style>

<img src="./assets/ieee_at_cornell_logo_glow.png" alt="IEEE at Cornell Logo" width="100%"/>

This wiki covers class information for IEEE-related courses and activities at Cornell University. Our goal is to provide easy access to important resources, course materials, and student guidance. Please help us grow this valuable resource by [contributing](./contributing.md)!

🎉 NEW: Explore [CS Crosslisted Courses]({{ "/cs-crosslisted/" | relative_url }})

## Classes

> <i class="fa fa-check-circle accent-color" style="color: var(--accent-color);"></i> — Currently Offered **[{{ site.current_semester }}](https://classes.cornell.edu/browse/roster/{{site.current_semester}}/subject/ECE)**

{% assign grouped_by_level = site.courses | group_by: "primary_level" %}
{% assign sorted_levels = grouped_by_level | sort: "name" %}

{% for level_group in sorted_levels %}
  <h3>{{ level_group.name }}-Level</h3>
  <ul>
    {% assign level_courses = level_group.items | sort: "title" %}
    {% for course in level_courses %}
      <li>
      {% if course.last_offered == site.current_semester %}
        <i class="fa fa-check-circle fa-xs" style="color: var(--accent-color);"></i>
      {% else %}
        <i class="fa fa-check-circle fa-xs" style="opacity: 0.0;"></i>
      {% endif %}
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
