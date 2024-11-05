---
layout: default
title: "/contributing"
---

# Contributing

> [!NOTE]
> These instructions are for general student contributions. IEEE members should branch and commit directly to this repository.

## Fork the Repository

- **Fork the Repository:** Navigate to the [wiki repository on GitHub](https://github.com/IEEEAtCornell/wiki) and fork it to your personal GitHub account.
- **Clone the Fork:** Clone your forked repository to your local machine

## Adding a Class

- Create a new [markdown](https://www.markdownguide.org/basic-syntax/) document in `_posts/` with a title with the format `YYYY-MM-DD-eceXXXX.md`.
  - `YYYY-MM-DD` is the date of creation
  - `XXXX` is the course code
- Fill out the header information as shown in the [ECE 2300 page](./_posts/2024-09-15-ece2300.md).

> [!IMPORTANT]
> Make sure to fill out the `categories` field, this is how the classes are sorted and displayed on the [homepage](./index.md).

- Save, commit, and push to the `page` branch

## Editing a Class

- Edit one of the class files under [`_posts`](./_posts/). Update the date in the file name to the date of the edit
- Our pages support [MathJax](https://www.mathjax.org/) (a subset of [LaTeX](https://www.latex-project.org/)) outside the front matter section of class pages. See the [ECE 3250 page](./_posts/2024-10-14-ece3250.md) for an example.

## Test your Changes

1. **[Install Jekyll locally](https://jekyllrb.com/docs/installation/). Follow the installation guide per your operating system.**

- Ruby installs compile the source code, so this step may take quite a while.
- Note for MacOS: Jekyll recommends automatically using `chruby` by adding some commands to your shell's source file. If you don't want to do this, just run this when you need to use `jekyll` in a new shell session:

  ```shell
  source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
  chruby ruby-3.3.5
  ```

2. **Install dependencies listed in the [Gemfile](./Gemfile) with [bundler](https://bundler.io/)**

  ```shell
  bundler install
  ```

3. **Build the site**

  ```shell
  jekyll build
  ```

4. **Serve the site locally**

  ```shell
  jekyll serve
  ```

  Look for the `Server address:` field near the end of the command's output. You can view the site by pasting that URL into a web browser of your choice.

> [!TIP]
> The local site will update automatically as you edit the code--just make sure to reload the page!

## Submit a Pull Request

- **Open a Pull Request:** After pushing your changes to your fork, go to the original wiki repository
- Click the "Compare & pull request" button, which will appear when GitHub detects changes between your fork and the original repository
- **Submit the PR:** Provide a clear description of the changes you made, explaining the purpose of your contributions, and then submit the pull request

## Review Process

- A project maintainer will review your pull request. If it meets the contribution guidelines, it will be merged into the main repository
- Once merged, your changes will automatically be deployed by GitHub Pages, and you can view them live on the [wiki site](https://ieeeatcornell.github.io/wiki/)!
