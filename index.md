---
layout: default
title: "Index"
---

# IEEE at Cornell Wiki

<img src="./assets/ieee_at_cornell_logo_glow.png" alt="IEEE at Cornell Logo" width="100%"/>

This wiki covers class information for IEEE-related courses and activities at Cornell University. Our goal is to provide easy access to important resources, course materials, and student guidance.

## Classes

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      <p><strong>Professor:</strong> {{ post.professor }}</p>
      <p><strong>Semester:</strong> {{ post.semester }}</p>
      <p><strong>Rating:</strong> {{ post.rating }}</p>
      <p>{{ post.excerpt }}</p>
      <a href="{{ post.url }}">Read More</a>
    </li>
  {% endfor %}
</ul>

### 2000

* [ECE 2100](https://da-luce.github.io/ieee-at-cornell-wiki.github.io/classes/ece2100.md)
* [ECE 2300](https://da-luce.github.io/ieee-at-cornell-wiki.github.io/classes/ece2300.md)

### 3000

* [ECE 3250](https://da-luce.github.io/ieee-at-cornell-wiki.github.io/classes/ece3250.md)

### 4000

* [ECE 4750](https://da-luce.github.io/ieee-at-cornell-wiki.github.io/classes/ece4750.md)
