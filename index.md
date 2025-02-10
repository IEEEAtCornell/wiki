---
layout: default
title: "/"
---

# IEEE at Cornell Wiki

<img src="./assets/ieee_at_cornell_logo_glow.png" alt="IEEE at Cornell Logo" width="100%"/>

This wiki covers class information for IEEE-related courses and activities at Cornell University. Our goal is to provide easy access to important resources, course materials, and student guidance. Please help us grow this valuable resource by [contributing](./README.md#contributing)!

## Classes

### 1000-Level

<ul>
  {% for post in site.categories[1000] %}
    <li>
      <a href="{{ post.url | relative_url}}">{{ post.code }}</a>: {{ post.title }}
    </li>
  {% endfor %}
</ul>

### 2000-Level

<ul>
  {% for post in site.categories[2000] %}
    <li>
      <a href="{{ post.url | relative_url}}">{{ post.code }}</a>: {{ post.title }}
    </li>
  {% endfor %}
</ul>

### 3000-Level

<ul>
  {% for post in site.categories[3000] %}
    <li>
      <a href="{{ post.url | relative_url}}">{{ post.code }}</a>: {{ post.title }}
    </li>
  {% endfor %}
</ul>

### 4000-Level

<ul>
  {% for post in site.categories[4000] %}
    <li>
      <a href="{{ post.url | relative_url}}">{{ post.code }}</a>: {{ post.title }}
    </li>
  {% endfor %}
</ul>

### 5000-Level

<ul>
  {% for post in site.categories[5000] %}
    <li>
      <a href="{{ post.url | relative_url}}">{{ post.code }}</a>: {{ post.title }}
    </li>
  {% endfor %}
</ul>
