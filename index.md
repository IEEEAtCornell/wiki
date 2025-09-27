---
layout: default
title: "/home"
permalink: /
---

<img src="./assets/ieee_at_cornell_logo_glow.png" alt="IEEE at Cornell Logo" width="100%"/>

This wiki covers class information for IEEE-related courses and activities at Cornell University. Our goal is to provide easy access to important resources, course materials, and student guidance. Please help us grow this valuable resource by [contributing](./contributing.md)!

## Classes

{% assign level_1000 = site.courses | where: "primary_level", 1 %}
{% assign level_2000 = site.courses | where: "primary_level", 2 %}
{% assign level_3000 = site.courses | where: "primary_level", 3 %}
{% assign level_4000 = site.courses | where: "primary_level", 4 %}
{% assign level_5000 = site.courses | where: "primary_level", 5 %}
{% assign level_6000 = site.courses | where: "primary_level", 6 %}

### 1000-Level

<ul>
  {% for course in level_1000 %}
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


### 2000-Level

<ul>
  {% for course in level_2000 %}
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

### 3000-Level

<ul>
  {% for course in level_3000 %}
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

### 4000-Level

<ul>
  {% for course in level_4000 %}
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


### 5000-Level

<ul>
  {% for course in level_5000 %}
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

### 6000-Level

<ul>
  {% for course in level_6000 %}
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